import UIKit

protocol MainStubsConnector: AnyObject {
    var children: [MainStubsConnector] { get set }
    var router: MainRouterOFApplication { get }

    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?)
    func dissapearFullyFromView(animated: Bool)
    func showDoughterClassController(_ connector: MainStubsConnector, animated: Bool, onDismissed: Closure?)
}

extension MainStubsConnector {
    func dissapearFullyFromView(animated: Bool) {

        router.dissapearFullyFromView(animated: animated)
    }

    func showDoughterClassController(_ child: MainStubsConnector, animated: Bool, onDismissed: Closure?) {
        children.append(child)
        child.showPreviewBeginnerSight(animated: animated) { [weak self, weak child] in
            guard let self = self, let child = child else { return }
            self.deprecateDoughterConnector(child)
            onDismissed?()
        }
    }

    private func deprecateDoughterConnector(_ child: MainStubsConnector) {

        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
    }
}

enum ExtraOrdinaryEnumMore {
    case chernoe
    case krasnoe
    case baltiiskoe
}
