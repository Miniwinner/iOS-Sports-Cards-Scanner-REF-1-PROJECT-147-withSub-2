import UIKit
import SnapKit
func calculateRandomNumberFibonachi162(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class BeginCardSearchingNowiSight: UIView {

    lazy var backView: BackView = .init()
    lazy var titleLabel: TitleLabel = .init()
    lazy var searchTextField: CustomTextPlain = { textField in
        textField.borderStyle = .none
        textField.font = .font(.interRegular, size: UIDevice.isIpad ? 24: 16)
        textField.backgroundColor = .skyBlue
        textField.cornerRadius = UIDevice.isIpad ? 30:12
        textField.placeholder = L10n.SearchCard.Search.placeholder
        textField.rightViewMode = .always
        textField.trailingPadding = 48
        textField.returnKeyType = .search
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.tintColor = .black
        return textField
    }(CustomTextPlain())

    var searchImageView: UIImageView?

    lazy var loadingIndicatorView: UIActivityIndicatorView = { indicator in
        indicator.tintColor = .labelColor
        indicator.hidesWhenStopped = true
        return indicator
    }(UIActivityIndicatorView(style: .medium))

    lazy var noResultsView: CustomMessageSight = { view in
        view.prepareForConfigureTag(L10n.SearchCard.Error.tryAgain)
        return view
    }(CustomMessageSight())

    lazy var searchCollectionView: UICollectionView = { collectionView in
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }(UICollectionView(frame: .zero, collectionViewLayout: filterLayout()))

    convenience init() {
        self.init(frame: .zero)
        computeViews()
    }

    func setNoResultsView(visible: Bool) {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        searchCollectionView.isUserInteractionEnabled = !visible
        noResultsView.isHidden = !visible
    }

    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }

    func prepareForConfigureZagryzky(_ isLoading: Bool) {
        let valueA = 38
        let valueB = 19
        let resultA = valueA * valueB + 10
        let resultB = valueB - valueA
        let resultC = valueA / 2
        let resultD = valueB % 3

        searchImageView?.isHidden = isLoading
        if isLoading {
            loadingIndicatorView.startAnimating()
        } else {
            loadingIndicatorView.stopAnimating()
        }
    }

}

private extension BeginCardSearchingNowiSight {
    func configureActionForStringRandom() {
        let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
        ]

        let randomIndex = Int.random(in: 0..<actions.count)
        actions[randomIndex]()
    }
    func computeViews() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        backView.beginMakingViewData(in: self)
        titleLabel.prepareForConfigureLabel(in: backView)

        backView.addSubviews(searchTextField, searchCollectionView, noResultsView)
        prepareForCalculateTextPlain()
        searchTextField.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 100 : 48)
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 40 : 30)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        searchCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        noResultsView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        setNoResultsView(visible: false)

        searchCollectionView.isUserInteractionEnabled = false
    }

    func prepareForCalculateTextPlain() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let imageView = searchTextField.prepareForConfigurePhotoAssemblying(
            StubsMainImagesEnum.search.image,
            paddings: .init(top: 0, left: 8, bottom: 0, right: 16)
        )
        searchTextField.rightView?.addSubview(loadingIndicatorView)
        loadingIndicatorView.snp.makeConstraints {
            $0.center.equalTo(imageView)
        }

        searchImageView = imageView
    }
}

private extension BeginCardSearchingNowiSight {
    func filterLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(UIDevice.isIpad ? 253:162),
            heightDimension: .absolute(UIDevice.isIpad ? 464:317)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(UIDevice.isIpad ? 464:317))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: UIDevice.isIpad ? 3:2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )

        return UICollectionViewCompositionalLayout(section: section)
    }
}
