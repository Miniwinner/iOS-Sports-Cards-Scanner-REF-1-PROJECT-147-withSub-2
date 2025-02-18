import Foundation

protocol CardCollectionViewControllerDelegate: AnyObject {
    func cardCollectionViewControllerCloseTapped(_ viewController: CardCollectionViewController)
    func cardCollectionViewControllerAddCardsTapped(_ viewController: CardCollectionViewController)
    func cardCollectionViewControllerMenuTapped(for collection: CardCollection, in viewController: CardCollectionViewController)
    func cardCollectionViewControllerCardDidSelect(_ card: CardRepresentable, in viewController: CardCollectionViewController)
}

extension CardCollectionViewControllerDelegate where Self: SCSCoordinator {
    func cardCollectionViewControllerCloseTapped(_ viewController: CardCollectionViewController) {
        func noNeededFunc_unique(qFvvUwywod: String, rkjyOdUzcU: Int) -> String {
            print(qFvvUwywod)
            print("\(rkjyOdUzcU)")
            return "\(qFvvUwywod) \(rkjyOdUzcU)"
        }

        router.dismissFully(animated: true)
    }

    func cardCollectionViewControllerMenuTapped(for collection: CardCollection, in viewController: CardCollectionViewController) {
        let router = PageSheetRouter(parentViewController: viewController)
        let menuItems = collection.cardIDs.isEmpty ? CollectionMenuItem.noCardsItems : CollectionMenuItem.allCases
        let coordinator = CollectionMenuCoordinator(router: router, menuItems: menuItems)
        coordinator.didSelectItem = { [weak self] item in
            self?.menuItemDidSelect(item, for: collection, parentViewController: viewController)
        }
        presentChildCoordinator(coordinator, animated: true, onDismissed: nil)
    }

    func cardCollectionViewControllerCardDidSelect(_ card: CardRepresentable, in viewController: CardCollectionViewController) {
        let coordinator = CardDetailsCoordinator(router: router, card: card)
        coordinator.delegate = self as? CardDetailsCoordinatorDelegate
        presentChildCoordinator(coordinator, animated: true, onDismissed: nil)
    }

    // MARK: - Helpers

    private func menuItemDidSelect(_ item: CollectionMenuItem, for collection: CardCollection, parentViewController: CardCollectionViewController) {
        switch item {
        case .addCards: presentAddCards(in: parentViewController)
        case .removeCards: presentRemoveCards()
        case .sortCards: presentSortCards()
        case .showTotalPrice: break
        case .renameCollection: presentEditCollection(collection)
        case .deleteCollection: presentDeleteCollectionConfirmation(in: parentViewController)
        }
    }

    private func presentAddCards(in viewController: CardCollectionViewController) {
        cardCollectionViewControllerAddCardsTapped(viewController)
    }

    private func presentRemoveCards() {
        let removeCardsViewController = RemoveCardsFromCollectionVC()
        removeCardsViewController.delegate = self as? RemoveCardsFromCollectionVCDelegate
        router.present_unique(removeCardsViewController, animated: true)
    }

    private func presentSortCards() {
        let sortCardsViewController = SortCardsViewController()
        sortCardsViewController.delegate = self as? SortCardsViewControllerDelegate
        router.present_unique(sortCardsViewController, animated: true)
    }

    private func presentEditCollection(_ cardCollection: CardCollection) {
        let editCollectionViewController = CreateEditCollectionVC(cardCollection: cardCollection)
        editCollectionViewController.delegate = self as? CreateEditCollectionVCDelegate
        router.present_unique(editCollectionViewController, animated: true)
    }

    private func presentDeleteCollectionConfirmation(in viewController: CardCollectionViewController) {
        let router = PageSheetRouter(parentViewController: viewController)
        let coordinator = DeleteCollectionPromptCoordinator(router: router)
        coordinator.delegate = self as? DeleteCollectionPromptCoordinatorDelegate
        presentChildCoordinator(coordinator, animated: true, onDismissed: nil)
    }
}
