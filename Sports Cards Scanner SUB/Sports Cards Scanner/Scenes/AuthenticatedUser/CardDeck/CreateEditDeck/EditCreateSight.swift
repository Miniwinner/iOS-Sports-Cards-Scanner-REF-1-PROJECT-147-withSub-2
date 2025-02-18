import UIKit
import SnapKit
func calculateRandomNumberFibonachi261(at index: Int) {
    let width = 20
let height = 10
let area = width * height
let perimeter = 2 * (width + height)

}
final class EditCreateSight: UIView {

    lazy var titleLabel: TitleLabel = .init()

    lazy var titleImage: UIImageView = .init(image: StubsMainImagesEnum.cardNocards.image)
    lazy var deckImage: UIImageView = .init(image: StubsMainImagesEnum.deckSign.image)
    lazy var descriptionImage: UIImageView = .init(image: StubsMainImagesEnum.MenuContainerTypeCollection.renameCollection.image)

    lazy var containerView: UIView = .init()

    lazy var nameView: TTextPlainSight = { view in
        view.title = L10n.CreateDeck.DeckName.title
        view.titleLabel.textAlignment = .center
        view.titleLabel.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 22:16)
        view.placeholder = L10n.CreateDeck.DeckName.placeholder
        view.textField.autocorrectionType = .no
        view.textField.returnKeyType = .done
        view.textField.autocapitalizationType = .sentences
        return view
    }(TTextPlainSight())

    lazy var deckTypeLabel: UILabel = { label in
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 22:16)
        label.text = L10n.CreateDeck.DeckType.title
        label.textColor = .black
        label.textAlignment = .center
        label.setVisotaLabla(UIDevice.isIpad ? 28:22)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var deckTypeView: OptionSight = { view in
        view.tagPaths(L10n.CreateDeck.DeckType.select)
        view.showsShadow = true
        view.titleLabel.textColor = .singINLabel
        view.discloseButton.layer.cornerRadius = 12

        return view
    }(OptionSight(minHeight: UIDevice.isIpad ? 80:54, maxHeight: UIDevice.isIpad ? 300:170))

    lazy var descriptionLabel: UILabel = { label in
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 22:16)
        label.text = L10n.CreateDeck.Description.title
        label.textColor = .black
        label.textAlignment = .center
        label.setVisotaLabla(UIDevice.isIpad ? 28:22)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var descriptionTextView: BaseTextSight = { textView in
        textView.placeholder = L10n.CreateDeck.Description.placeholder
        textView.autocorrectionType = .no
        textView.backgroundColor = .skyBlue
        return textView
    }(BaseTextSight())

    lazy var createButton: CommonPlate = { button in
        button.setButtonTitle(L10n.CreateDeck.Action.create)
        button.setImage(StubsMainImagesEnum.collectionCards.image, for: .normal)
        button.configuration?.imagePadding = 20
        return button
    }(CommonPlate(style: .default))

    lazy var cancelButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.cancel)
        return button
    }(CommonPlate(style: .cancel))

    lazy var doneButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.done)
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func setupForCreation() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        addSubviews(deckImage, deckTypeLabel, deckTypeView, createButton)
        deckImage.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIDevice.isIpad ? 48:33)
            $0.width.equalTo(UIDevice.isIpad ? 68:48)
        }
        deckTypeLabel.snp.makeConstraints {
            $0.top.equalTo(deckImage.snp.bottom).offset(UIDevice.isIpad ? 15:5)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(descriptionLabel.snp.top).inset(UIDevice.isIpad ? -106:-76)
        }
        deckTypeView.snp.makeConstraints {
            $0.top.equalTo(deckTypeLabel.snp.bottom).offset(UIDevice.isIpad ? 18:8)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        createButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(descriptionTextView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 40:20)
            $0.height.equalTo(UIDevice.isIpad ? 80:54)
        }
        bringSubviewToFront(deckTypeView)
    }

    func setupForEditing() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let buttonsStackView = UIStackView(arrangedSubviews: [cancelButton, doneButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10

        addSubview(buttonsStackView)
        buttonsStackView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(descriptionTextView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 40:20)
            $0.height.equalTo(UIDevice.isIpad ? 172:128)
        }
    }

}

private extension EditCreateSight {
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
        titleLabel.prepareForConfigureLabel(in: self)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIDevice.isIpad ? 40:20)
        }
        addSubview(titleImage)
        titleImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            make.centerX.equalToSuperview()
            make.size.equalTo(UIDevice.isIpad ? 45:32)
        }
        // descriptionImage
        addSubviews(nameView, descriptionLabel, descriptionTextView)
        nameView.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(UIDevice.isIpad ? 15:5)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.height.equalTo(UIDevice.isIpad ? 120:80)
        }

//        descriptionImage.snp.makeConstraints { make in
//            make.top.greaterThanOrEqualTo(nameView.snp.bottom).offset(500)
//            make.centerX.equalToSuperview()
//            make.size.equalTo(32)
//        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(UIDevice.isIpad ? 40:20).priority(.high)
            $0.centerX.equalToSuperview()
        }
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(UIDevice.isIpad ? 18:8)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.height.equalTo(UIDevice.isIpad ? 400:214).priority(.high)
        }
    }
}
