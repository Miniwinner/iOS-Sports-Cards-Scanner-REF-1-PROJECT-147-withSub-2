import SnapKit
import UIKit
func calculateRandomNumberFibonachi284(at index: Int) {
    let principalAmount = 1000
let interestRate = 0.05
let numberOfYears = 3
let finalAmount = Double(principalAmount) * pow((1 + interestRate), Double(numberOfYears))

}

class CheckLoad {
    static let shared = CheckLoad()
    var canGo: Bool = true
        
    var callback: (() -> Void)?

    private init() {}
}

final class ConnectivityController: UIViewController {
    lazy var connectionView: ConnectivitySight = .init()
    weak var delegate: ConnectivityDelegat?
    var timer: Timer!
    var progress = 0
    override func loadView() {
        super.loadView()
        view = connectionView
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
    }

    func startAgain() {
        CheckLoad.shared.callback = { [weak self] in
            self?.startProgressTimer()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            CheckLoad.shared.callback?()
//            try await PushiService().zaprositUNrasrExtraFeaturesnie()  // Запрос на дополнительные функции
            await AppFollowService().attRequestUserTrackingUsage()  // Запрос на отслеживание использования
        }

        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        view.backgroundColor = .white
        connectionView.buttonConnection.addTarget(self, action: #selector(finishWithFatalError), for: .touchUpInside)
        clickedPressedProgress()
        setGo()
        startAgain()
    }
    func setGo() {
//        StubsMangerForHandlingPurchasesINApp.shared.callBackOFLoading = { [weak self] in
//            self?.allowProgressBeyond61()
//        }
    }
    func allowProgressBeyond61() {
        if CheckLoad.shared.canGo == false {
            CheckLoad.shared.canGo = true
            startProgressTimer()
        }
        }

    @objc func clickedPressedProgress() {
        connectionView.progressBar.progress = 0.0
        CheckLoad.shared.canGo = false
           startProgressTimer()
       }
    func startProgressTimer() {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(reCalculateProgress), userInfo: nil, repeats: true)
        }
    @objc func reCalculateProgress() {
        makeNumbers()
    }
    func switchConnections() {
        if checkConnection() {
            makeNumbers()
        } else {
            checkConWithOutInternet()
        }
    }
    func checkConWithOutInternet() {
        if connectionView.progressBar.progress < 1.0 {
            connectionView.progressBar.progress += 0.01
            makeTextLabel(progress: connectionView.progressBar.progress)
        }
        timer?.invalidate()
        timer = nil
        handleConnectionCheck()
    }

    func makeNumbers() {
        if connectionView.progressBar.progress < 1.0 {
            if connectionView.progressBar.progress  == Float.random(in: 0.34...0.63) {
                guard CheckLoad.shared.canGo else {  timer?.invalidate();return }
            }
            connectionView.progressBar.progress += 0.01
            makeTextLabel(progress: connectionView.progressBar.progress)
        } else {
            timer?.invalidate()
            timer = nil
            handleConnectionCheck()
        }
    }

    func handleConnectionCheck() {
           if checkConnection() {
               delegate?.checkingInternetaLoading(self)
           } else {
               connectionView.progressBarContainer.isHidden = true
               connectionView.progressLabel.isHidden = true
               connectionView.stackView.isHidden = false
               print("Progress complete!")
           }
       }

    func checkConnection() -> Bool {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        return InternetConnectivityService.shared.isNetworkAvailable
    }

    func makeTextLabel(progress: Float) {

        DispatchQueue.main.async {
               let percentage = Int(progress*100)
               self.connectionView.progressLabel.text = "\(percentage) %"
           }
    }

    @objc func finishWithFatalError() {
        delegate?.checkingInternetaLoading(self)
//        prepareForCalculate()
    }
    func prepareForCalculate() {
        self.progress = 0
        connectionView.stackView.isHidden = true
        connectionView.progressBarContainer.isHidden = false
        connectionView.progressLabel.isHidden = false
        clickedPressedProgress()
        makeTextLabel(progress: 0)
    }
}
