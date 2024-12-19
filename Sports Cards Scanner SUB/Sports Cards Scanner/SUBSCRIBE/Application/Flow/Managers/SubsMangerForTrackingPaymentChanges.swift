//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 10.04.2024.
//
import Foundation

// MARK: - Менеджер отслеживания действий с подпиской: вызывается, если подписку купили или просто закрыли окно покупки

class SubsMangerForTrackingPaymentChanges {

    var subscriptionStatusesDidChangeHandler: (() -> Void)?

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handledObjectStatusChanged), name: .notificationStatusesDidChange, object: nil)
    }

    @objc
    private func handledObjectStatusChanged(notification: NSNotification) {
        DispatchQueue.main.async {
            self.subscriptionStatusesDidChangeHandler?()
        }
    }
}
private typealias NotificationName = Notification.Name

extension NotificationName {
    static let notificationStatusesDidChange = Notification.Name("notificationStatusesDidChange")
}

