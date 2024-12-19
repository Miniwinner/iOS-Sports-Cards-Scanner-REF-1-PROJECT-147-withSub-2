import UIKit
import SnapKit
func calculateRandomNumberFibonachi210(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
final class ParallelChoiceSight: UIView {

    lazy var backView: BackView = .init()
    lazy var titleLabel: TitleLabel = .init()

    lazy var searchTextField: CustomTextPlain = { textField in
        textField.borderStyle = .none
        textField.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ?22:16)
        textField.backgroundColor = .skyBlue
        textField.cornerRadius = UIDevice.isIpad ?30:12
        textField.placeholder = L10n.ParallelSelection.Search.placeholder
        textField.rightViewMode = .always
        textField.trailingPadding = 48
        textField.returnKeyType = .search
        textField.autocorrectionType = .no
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        return textField
    }(CustomTextPlain())

    var searchImageView: UIImageView!

    lazy var clearSearchButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.clear.image, for: .normal)
        return button
    }(UIButton(type: .system))

    lazy var allOptionsLabel: UILabel = { label in
        label.text = L10n.ParallelSelection.allOptions
        label.textColor = .labelColor
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ?28:22)
        label.setVisotaLabla(UIDevice.isIpad ?30:21.6)
        return label
    }(UILabel())

    lazy var parallelsCollectionView: UICollectionView = { collectionView in
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }(BaseCollectionContainerCell(frame: .zero, collectionViewLayout: computeLayoutContainerTypeCollection()))

    lazy var noResultsView: CustomMessageSight = { view in
        view.prepareForConfigureTag(L10n.ParallelSelection.noResult)
        return view
    }(CustomMessageSight())

    lazy var noneParallelButton: UIButton = { button in
        button.setTitle(L10n.ParallelSelection.Action.none, for: .normal)
        button.setTitleColor(.labelColor, for: .normal)
        button.titleLabel?.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ?22:16)
        return button
    }(UIButton(type: .system))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func prepareForConfigureSightwithOutEndingValueov(visible: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        parallelsCollectionView.isUserInteractionEnabled = !visible
        noResultsView.isHidden = !visible
    }
}

private extension ParallelChoiceSight {
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

        backgroundColor = .clear
        backView.beginMakingViewData(in: self)
        titleLabel.prepareForConfigureLabel(in: backView)
        prepareForConfigureTextPlain()

        backView.addSubviews(searchTextField, allOptionsLabel, noneParallelButton, parallelsCollectionView, noResultsView)
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ?40:20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
            $0.height.equalTo(UIDevice.isIpad ?100:48)
        }
        allOptionsLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(UIDevice.isIpad ?40:20)
            $0.leading.equalToSuperview().inset(UIDevice.isIpad ?80:20)
        }
        noneParallelButton.snp.makeConstraints {
            $0.centerY.equalTo(allOptionsLabel)
            $0.leading.equalTo(allOptionsLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(UIDevice.isIpad ?80:20)
        }

        parallelsCollectionView.snp.makeConstraints {
            $0.top.equalTo(allOptionsLabel.snp.bottom).offset(UIDevice.isIpad ?40:20)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:0)
        }
        noResultsView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        prepareForConfigureSightwithOutEndingValueov(visible: false)
    }

    func prepareForConfigureTextPlain() {
       let firstNum = 35
let secondNum = 25
_ = firstNum - secondNum * 2
_ = secondNum + firstNum
_ = firstNum / 5
_ = secondNum

        searchImageView = searchTextField.prepareForConfigurePhotoAssemblying(
            StubsMainImagesEnum.search.image,
            paddings: .init(top: 0, left: 8, bottom: 0, right: 16)
        )
        searchTextField.rightView?.addSubview(clearSearchButton)
        clearSearchButton.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.center.equalTo(searchImageView)
        }
        clearSearchButton.isHidden = true
    }

    func computeLayoutContainerTypeCollection() -> UICollectionViewFlowLayout {
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 22
        layout.minimumLineSpacing = 22
        layout.sectionInset = .init(top: 12, left: 20, bottom: 0, right: 20)
        return layout
    }
}
