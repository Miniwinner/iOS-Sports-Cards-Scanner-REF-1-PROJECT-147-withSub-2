//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 10.04.2024.
//

import Foundation
import StoreKit
#warning("Раскоментить для pushwoosh/adjust")
// import Pushwoosh
// import Adjust

protocol MainSubsPurchaseMangerDelegat: AnyObject {
    func didPaymentFailedResult(for product: SubsContentExample)
}

final class SubsContentExample: Equatable {
    let subscriptionId: String
    let pushTag: String
    fileprivate var product: SKProduct?
    fileprivate(set) var isEnabled: Bool {
        get {
            var value = false
            enabledStatusQueue.sync {
                value = _isEnabled
            }
            return value
        } set {
            enabledStatusQueue.async(flags: .barrier) {
                self._isEnabled = newValue
            }
        }
    }
    private var _isEnabled: Bool = false

    private let enabledStatusQueue = DispatchQueue(label: "com.webgeek.app.SubsContentExample", attributes: .concurrent)

    private init(id: String, pushTag: String) {
        self.subscriptionId = id
        self.pushTag = pushTag
    }

    static func == (lhs: SubsContentExample, rhs: SubsContentExample) -> Bool {
        lhs.subscriptionId == rhs.subscriptionId
    }

}

extension SubsContentExample: CaseIterable {
    static var allCases: [SubsContentExample] {
        [main, first, second, third]
    }

    static let main: SubsContentExample = SubsContentExample(id: StubMainApplicationKeys.StubsSecreyConfigs.mainSubscription,
                                                 pushTag: StubMainApplicationKeys.StubsSecreyConfigs.mainSubscriptionPushTag_VDI)

    static let first: SubsContentExample = SubsContentExample(id: StubMainApplicationKeys.StubsSecreyConfigs.modsSubscription,
                                                 pushTag: StubMainApplicationKeys.StubsSecreyConfigs.unlockMDDSubscriptionPushTag_VDI)

    static let second: SubsContentExample = SubsContentExample(id: StubMainApplicationKeys.StubsSecreyConfigs.mapsSubscription,
                                                 pushTag: StubMainApplicationKeys.StubsSecreyConfigs.unlockMPPSubscriptionPushTag_VDI)

    static let third: SubsContentExample = SubsContentExample(id: StubMainApplicationKeys.StubsSecreyConfigs.editorSubscription,
                                                 pushTag: StubMainApplicationKeys.StubsSecreyConfigs.unlockerCHARSubscriptionPushTag)

}

class MainSubsPurchaseController: NSObject, SKPaymentTransactionObserver {

    static let shared = MainSubsPurchaseController()

    weak var delegate: MainSubsPurchaseMangerDelegat?
    public var localizablePrice = "$9.99"
    private var secretKey = StubMainApplicationKeys.StubsSecreyConfigs.subscriptionSharedSecret
    private var isRestoreTransaction = true
    private var setupGroup: DispatchGroup?
    private var receiptRefreshCompletion: (() -> Void)?

    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    public func prepareContent(completion: @escaping (_ isSuceess: Bool) -> Void) {
        setupGroup = DispatchGroup()

        let request = SKProductsRequest(productIdentifiers: [SubsContentExample.main.subscriptionId,
                                                            SubsContentExample.first.subscriptionId,
                                                            SubsContentExample.second.subscriptionId,
                                                            SubsContentExample.third.subscriptionId
                                                            ])
        request.delegate = self

        setupGroup?.enter()
        request.start()
        setupGroup?.notify(queue: .main, execute: {
            print("product: \(String(describing: SubsContentExample.main.product))")
            self.setupGroup = nil
            if SubsContentExample.allCases.contains(where: { $0.product == nil }) {
                completion(false)
            } else {
                completion(true)
            }
        })
    }

    public func subsPaymentFunc(product: SubsContentExample) {
        guard let product = product.product else { return print("NO PRODUCT:", product)}
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    public func langyageAdaptablePrice(for product: SubsContentExample) -> String {
        getContentActualPrice(for: product.product)
        return localizablePrice
    }

    public func finishAllPayments() {
        let transactions = SKPaymentQueue.default().transactions
        for transaction in transactions {
            let transactionState = transaction.transactionState
            if transactionState == .purchased || transactionState == .restored {
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }

    public func checkContentISAvailable(completion: @escaping (_ isSuccess: Bool) -> Void) {

        let validationFunc = {
            // ПРОВЕРКА ЧЕКА
#if DEBUG
            let urlStr = Bundle.main.appStoreReceiptURL?.absoluteString.replacingOccurrences(of: "receipt", with: "sandboxReceipt")
            let urlR = URL(string: urlStr ?? "")
#else
            let urlR = Bundle.main.appStoreReceiptURL
#endif

            guard let receiptUrl = urlR,
                  let receiptData = try? Data(contentsOf: receiptUrl) else {
                completion(false)
                return
            }

            let receiptDataString = receiptData.base64EncodedString(options: [])

            let jsonRequestBody: [String: Any] = [
                "receipt-data": receiptDataString,
                "password": self.secretKey,
                "exclude-old-transactions": true
            ]

            let requestData: Data
            do {
                requestData = try JSONSerialization.data(withJSONObject: jsonRequestBody)
            } catch {
                print("Failed to serialize JSON: \(error)")
                completion(false)
                return
            }
#warning("При тестировании (сборке ipa для теста) использовать sandbox.itunes/на релизном компьютере - раскомментировать полностью")

         //  #if DEBUG
                        let url = URL(string: "https://sandbox.itunes.apple.com/verifyReceipt")!
        //  #else
        //               let url = URL(string: "https://buy.itunes.apple.com/verifyReceipt")!
        //   #endif

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = requestData

            let task = URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
                guard self != nil else { return }
                var isSuccess = false

                defer {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .notificationStatusesDidChange, object: nil, userInfo: nil)
                        completion(isSuccess)
                    }
                }

                if let error = error {
                    print("Failed to validate receipt: \(error) IAPManager_079c50b4")
                    return
                }

                guard let data = data else {
                    print("No data received from receipt validation IAPManager_079c50b4")
                    return
                }

                guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let receiptInfo = json["latest_receipt_info"] as? [[String: Any]] else {
                    return
                }

                isSuccess = true

                for receipt in receiptInfo {
                    guard let receiptProductIdentifier = receipt["product_id"] as? String,
                          let expiresDateMsString = receipt["expires_date_ms"] as? String,
                          let expiresDateMs = Double(expiresDateMsString),
                          let product = SubsContentExample.allCases.first(where: { $0.subscriptionId == receiptProductIdentifier })else {
                        continue
                    }

                    let expiresDate = Date(timeIntervalSince1970: expiresDateMs / 1000)

                    let isEnabled = expiresDate > Date()

                    if product == .main {
                        #warning("Раскоментить для pushwoosh")
                          // self?.pushwooshSetMainSubscriptionEnabledStatus(isEnabled: isEnabled) //метод ниже
                    }

                    if !product.isEnabled {
                        product.isEnabled = isEnabled
                    }
                }
            }
            task.resume()
        }

        let receiptRefreshRequest = SKReceiptRefreshRequest(receiptProperties: nil)
        receiptRefreshRequest.delegate = self

        receiptRefreshCompletion = {
            self.receiptRefreshCompletion = nil
            validationFunc()
        }

        receiptRefreshRequest.start()
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        #warning("Раскоментить для pushwoosh")
        // Pushwoosh.sharedInstance().sendSKPaymentTransactions(transactions)

        // Create a background task using DispatchWorkItem
        let backgroundTask = DispatchWorkItem { [weak self] in
            guard self != nil else { return }
            // End the background task if it takes too long

            UIApplication.shared.endBackgroundTask(UIApplication.shared.beginBackgroundTask(expirationHandler: nil))
        }

        // Start the background task
        UIApplication.shared.beginBackgroundTask(expirationHandler: nil)

        // Add the background task to the current run loop
        DispatchQueue.main.async(execute: backgroundTask)

        transactions
            .filter { $0.transactionState != .purchasing }
            .forEach { queue.finishTransaction($0) }

        if transactions.count == 1, let transaction = transactions.first, transaction.transactionState != .purchasing {

            guard let product = SubsContentExample.allCases.first(where: { $0.subscriptionId == transaction.payment.productIdentifier }) else {
                // End the background task if no product is found
                backgroundTask.cancel()
                return
            }

            switch transaction.transactionState {
            case.failed:
                delegate?.didPaymentFailedResult(for: product)
            case.purchased:
                if let product = product.product {
                    sendDataAboutContentToAdjust(transaction: transaction, product: product)
                }

                checkContentISAvailable { [weak backgroundTask] _ in
                    // End the background task when validation is complete
                    if let backgroundTask = backgroundTask {
                        backgroundTask.cancel()
                    }
                }
            case .restored:
                print("⚠️ restored")
                if let product = product.product {
                    sendDataAboutContentToAdjust(transaction: transaction, product: product)
                }

                SKPaymentQueue.default().finishTransaction(transaction)
               // queue.finishTransaction(transaction)
                finishAllPayments()
            default:
                break
            }
        } else {
            backgroundTask.cancel()
        }
    }

    // MARK: paymentQueue без обработки BackgroundTask
    /*    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
           // Pushwoosh.sharedInstance().sendSKPaymentTransactions(transactions)
    
            transactions
                .filter { $0.transactionState != .purchasing }
                .forEach { queue.finishTransaction($0) }
    
            if transactions.count == 1, let transaction = transactions.first, transaction.transactionState != .purchasing {
    
                guard let product = SubsContentExample.allCases.first(where: { $0.subscriptionId == transaction.payment.productIdentifier }) else {
                    return
                }
    
                switch transaction.transactionState {
                case .failed:
                    delegate?.didPaymentFailedResult(for: product)
                case .purchased:
                    if let product = product.product {
                        trackSubscription(transaction: transaction, product: product)
                    }
    
                    validateSubscriptions { _ in }
                default:
                    break
                }
            }
        }
     */

    private func getContentActualPrice(for product: SKProduct?) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product?.priceLocale ?? Locale(identifier: "en-US")

        if let product,
           let formattedPrice = numberFormatter.string(from: product.price) {
            self.localizablePrice = formattedPrice
        } else {
            self.localizablePrice = "$9.99"
        }
    }

    // MARK: FOR PUSHWOOSH
    #warning("Раскоментить для pushwoosh")
    private func sendStausOFMainContent(isEnabled: Bool) {
        //        Pushwoosh.sharedInstance().setTags(["Subscription purchased": isEnabled]) { error in
        //            if let err = error { lazy var a1316f50 = 0
        //                print(err.localizedDescription)
        //                print("send tag error IAPManager_MFTW")
        //            }
        //        }
    }

    // MARK: FOR ADJUST
    #warning("Раскоментить для ADJUST")
    private func sendDataAboutContentToAdjust(transaction: SKPaymentTransaction, product: SKProduct) {
        //   if let receiptURL = Bundle.main.appStoreReceiptURL,
        //   let receiptData = try? Data(contentsOf: receiptURL) {

        //     let price = NSDecimalNumber(decimal: product.price.decimalValue)
        //    let currency = product.priceLocale.currencyCode ?? "USD"
        //     let transactionId = transaction.transactionIdentifier ?? ""
        //    let transactionDate = transaction.transactionDate ?? Date()
        //    let salesRegion = product.priceLocale.regionCode ?? "US"

        //   if let subscription = ADJSubscription(price: price, currency: currency, transactionId: transactionId, andReceipt: receiptData) {
        //   subscription.setTransactionDate(transactionDate)
        //   subscription.setSalesRegion(salesRegion)
        //   Adjust.trackSubscription(subscription)
        //  }
        //   }
    }

    // MARK: - RESTORE

    func revokeBoughtContent() {
        print("restoreProduct start🟣")

        if SKPaymentQueue.canMakePayments() {
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().restoreCompletedTransactions()

        } else {
            print("🟣 ERROR canMakePayments 🟣")
        }

    }

    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {

        for product in queue.transactions {
            if product.error == nil {
                print("🟣restored get transactionState", product.transactionState)
                print("🟣restored get transactionIdentifier", product.transactionIdentifier)
                print("🟣restored get productIdentifier", product.payment.productIdentifier)
            } else {
                print("🔴🟣 ERROR - restored", product.error)
            }
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: any Error) {
        print("🔴 ERROR - restored", error)
    }

    public func revokeCheckISContetnEnabled(completion: @escaping (_ isSuccess: Bool, _ product: SubsContentExample?) -> Void) {

        let validationFunc = {

#if DEBUG
            let urlStr = Bundle.main.appStoreReceiptURL?.absoluteString.replacingOccurrences(of: "receipt", with: "sandboxReceipt")
            let urlR = URL(string: urlStr ?? "")
#else
            let urlR = Bundle.main.appStoreReceiptURL
#endif

            guard let receiptUrl = urlR,
                  let receiptData = try? Data(contentsOf: receiptUrl) else {
                completion(false, nil)
                return
            }

            let receiptDataString = receiptData.base64EncodedString(options: [])

            let jsonRequestBody: [String: Any] = [
                "receipt-data": receiptDataString,
                "password": self.secretKey,
                "exclude-old-transactions": true
            ]

            let requestData: Data
            do {
                requestData = try JSONSerialization.data(withJSONObject: jsonRequestBody)
            } catch {
                print("Failed to serialize JSON: \(error)")
                completion(false, nil)
                return
            }

// #if DEBUG
            let url = URL(string: "https://sandbox.itunes.apple.com/verifyReceipt")!
// #else
   //         let url = URL(string: "https://buy.itunes.apple.com/verifyReceipt")!
// #endif

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = requestData

            let task = URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
                guard let self = self else { return }
                var isSuccess = false

                defer {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .notificationStatusesDidChange, object: nil, userInfo: nil)
                        completion(isSuccess, nil)
                    }
                }

                if let error = error {
                    print("Failed to validate receipt: \(error) IAPManager_079c50b4")
                    return
                }

                guard let data = data else {
                    print("No data received from receipt validation IAPManager_079c50b4")
                    return
                }

                guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let receiptInfo = json["latest_receipt_info"] as? [[String: Any]] else {
                    return
                }

                isSuccess = true

                for receipt in receiptInfo {
                    guard let receiptProductIdentifier = receipt["product_id"] as? String,
                          let expiresDateMsString = receipt["expires_date_ms"] as? String,
                          let expiresDateMs = Double(expiresDateMsString),
                          let product = SubsContentExample.allCases.first(where: { $0.subscriptionId == receiptProductIdentifier }) else {
                        continue
                    }

                    let expiresDate = Date(timeIntervalSince1970: expiresDateMs / 1000)

                    let isEnabled = expiresDate > Date()

                    if !product.isEnabled {
                        product.isEnabled = isEnabled
                    }

                    DispatchQueue.main.async {
                        completion(true, product)
                    }

                    print("⚪️ product:", product.subscriptionId, product.isEnabled)

                }
            }
            task.resume()
        }

        let receiptRefreshRequest = SKReceiptRefreshRequest(receiptProperties: nil)
        receiptRefreshRequest.delegate = self

        receiptRefreshCompletion = {
            self.receiptRefreshCompletion = nil
            validationFunc()
        }

        receiptRefreshRequest.start()
    }
}

extension MainSubsPurchaseController: SKProductsRequestDelegate {

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("requesting to product IAPManager")

        response.invalidProductIdentifiers.forEach { id in
            print("Invalid product identifier:", id, "IAPManager_079c50b4")
        }

        let products = SubsContentExample.allCases

        for product in products {
            guard let productFromResponse = response.products.first(where: { $0.productIdentifier == product.subscriptionId }) else {
                print("no product for: \(product.subscriptionId) IAPManager_079c50b4")
                setupGroup?.leave()
                return
            }
            print("Found product: \(productFromResponse.productIdentifier) IAPManager_079c50b4")
            product.product = productFromResponse
        }

        setupGroup?.leave()
    }

    func requestDidFinish(_ request: SKRequest) {
        if request is SKReceiptRefreshRequest {
            receiptRefreshCompletion?()
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("REQUEST ERROR:", error.localizedDescription)

        if request is SKReceiptRefreshRequest {
            receiptRefreshCompletion?()
        }
    }
}
