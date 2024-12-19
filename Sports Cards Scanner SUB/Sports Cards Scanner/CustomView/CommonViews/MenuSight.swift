import UIKit
import SnapKit
func calculateRandomNumberFibonachi317(at index: Int) {
    let minutes = 120
let hours = minutes / 60
let remainingMinutes = minutes % 60

}
final class MenuSight: UIView {

    lazy var menuCollectionView: UICollectionView = { collectionView in
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = false
        return collectionView
    }(UICollectionView(frame: .zero, collectionViewLayout: filterLayout()))

    lazy var cancelButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.cancel)

        return button
    }(CommonPlate(style: .cancel2))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }
}

private extension MenuSight {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .white

        addSubviews(menuCollectionView, cancelButton)
        menuCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 130:110)
        }
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20).priority(.high)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 20:10).priority(.high)
            $0.height.equalTo(UIDevice.isIpad ? 96:56)
        }
    }
}

private extension MenuSight {

    func filterLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(UIDevice.isIpad ? 243:142),
            heightDimension: .absolute(UIDevice.isIpad ? 212:124)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(UIDevice.isIpad ? 212:124))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = UIDevice.isIpad ? 20 : 15
        section.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )

        return UICollectionViewCompositionalLayout(section: section)
    }
}
