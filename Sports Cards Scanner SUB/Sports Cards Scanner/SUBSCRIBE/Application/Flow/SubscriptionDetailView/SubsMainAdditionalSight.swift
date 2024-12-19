//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 10.04.2024.
//

import UIKit

enum SubsTypeOFScreen {
    case first
    case second
    case transaction
}

protocol SubsMainAdditionalSightDelegat: AnyObject {
    func nextScreenFuncPressed(config: SubsTypeOFScreen)
}

struct SubsMainAdditionalDataModel {
    var title: String
    var items: [SubsMainAdditionalContentVM]
}

struct SubsMainAdditionalContentVM {
    var title: String
    var image: UIImage
    var selectedImage: UIImage
}

final class SubsMainAdditionalSight: UIView, StubSubsAnimatePlateDelegat {

    private enum CollectionLayoutConstants {
        static var spacing: CGFloat = 14
        static let sectionInsets = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 35)
    }

    @IBOutlet private unowned var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var nextStepBtn: StubSubsAnimatePlateSight!
    @IBOutlet weak var bgView: UIView!

    @IBOutlet private weak var titleWight: NSLayoutConstraint!
    @IBOutlet private weak var buttonBottom: NSLayoutConstraint!
    @IBOutlet private weak var leadingBtn: NSLayoutConstraint!
    @IBOutlet private weak var trailingBtn: NSLayoutConstraint!

    weak var protocolElement: SubsMainAdditionalSightDelegat?

    private let locale = NSLocale.current.languageCode
    private let cellName = "SubsSingleItemCollectionContainer"
    private var selectedStorage: [Int] = []
    var selectedIndexPaths: [IndexPath] = []

    private let multic: CGFloat = 0.94

    var configurationViewType: SubsTypeOFScreen = .first
    var viewModel: SubsMainAdditionalDataModel? {
        didSet {
            prepareLanguageAdaptableVideo()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareInitialization()
        nextStepBtn.prepareAnimatebPlateAnimation()
    }

    override func layoutSubviews() {
        nextStepBtn.prepareAnimatebPlateAnimation()

        for sublayer in bgView.layer.sublayers ?? [] {
            if sublayer is CAGradientLayer {
                sublayer.removeFromSuperlayer()
            }
        }
        let gradietnMaskLayer = CAGradientLayer()
        gradietnMaskLayer.frame = bgView.bounds
        gradietnMaskLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradietnMaskLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradietnMaskLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradietnMaskLayer.locations = [0, 0.25, 1]
        bgView.layer.mask = gradietnMaskLayer
        bgView.layer.masksToBounds = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareInitialization()
    }

    func prepapreConfigSightOFVideo(config: SubsTypeOFScreen) {
        let currentConfigureation = config
        self.configurationViewType = currentConfigureation
    }

    // MARK: Нажимаем кнопку ПРОДОЛЖИТЬ/CONTINUE
    func stubsPlateAnimationWasClicked() {
        print("stubsPlateAnimationWasClicked")
        let configurationViewType = configurationViewType
        protocolElement?.nextScreenFuncPressed(config: configurationViewType)
    }

    private func prepareInitialization() {

        Bundle.main.loadNibNamed("SubsMainAdditionalSight", owner: self, options: nil)
        if deviceIsIPAD {
            leadingBtn.constant = 180
            trailingBtn.constant = 180
        } else {
            if UIScreen.main.nativeBounds.height >= 2436 {
                // Устройство без физической кнопки "Home" (например, iPhone X и новее)
            } else {
                // Устройство с физической кнопкой "Home"
                buttonBottom?.constant = 47
            }
        }

        contentView.calculateSubSightINSuperSight(self)
        nextStepBtn.delegate = self
        nextStepBtn.style = .native
        nextStepBtn.prepareAnimatebPlateAnimation()

        contentView.backgroundColor = .clear
        bgView.backgroundColor = .black.withAlphaComponent(0.0)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12

        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SubsSingleItemCollectionContainer.self, forCellWithReuseIdentifier: cellName)
        collectionView.backgroundColor = .clear

        titleLabel.makeShadowForSight()

        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Gilroy-Black", size: 24)
        titleLabel.adjustsFontSizeToFitWidth = true
        prepareLanguageAdaptableVideo()
        calculateScreenView()
        checkSightForMirrorLanguages()
    }

    // MARK: Отзеркаливание экрана при смене языка на арабский/хинди
    private func checkSightForMirrorLanguages() {
        if locale == "he" || locale == "ar" {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            calcualteCollectionSight()
        }
    }

    // MARK: Отзеркаливание коллекции
    private func calcualteCollectionSight() {
        let layout = MainSubsCollectionSight()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12

        collectionView.collectionViewLayout = layout
    }

    private func prepareTitleLabelText() {
        titleLabel.makeShadowForSight()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Gilroy-Black", size: 24)
        titleLabel.adjustsFontSizeToFitWidth = true
        prepareLanguageAdaptableVideo()
    }

    // MARK: ТЕКСТ НАД КАРТОЧКАМИ
    private func prepareLanguageAdaptableVideo() {
        titleLabel.text = viewModel?.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Gilroy-Black", size: 24)
        titleLabel.adjustsFontSizeToFitWidth = true
    }

    // MARK: - Screen configs

    private func calculateScreenView() {
        guard UIDevice.current.userInterfaceIdiom == .pad else {
            titleWight.setValue(0.7, forKey: "multiplier")
            return
        }
        titleWight.setValue(0.35, forKey: "multiplier")
    }
}

// MARK: - Setups UICollectionView

extension SubsMainAdditionalSight: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if let viewModel {
            return viewModel.items.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SubsSingleItemCollectionContainer = collectionView.calculateForReusingCellCollection(for: indexPath)
        let content = viewModel?.items[indexPath.item]
        cell.calculateContainer(content, isSelected: selectedIndexPaths.contains(indexPath))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndexPaths.contains(indexPath) {
            selectedIndexPaths.removeAll(where: { $0 == indexPath })
        } else {
            selectedIndexPaths.append(indexPath)
        }

        UIApplication.shared.prepareResponseGenSubs(type: .light)

        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let baseSize: CGFloat = deviceIsIPAD ? 0.60 : 0.73
//        let scaleFactor: CGFloat = selectedIndexPaths.contains(indexPath) ? 1.2 : 1.0
//
//        let width = collectionView.frame.height * baseSize * scaleFactor
//        let height = collectionView.frame.height * (deviceIsIPAD ? 0.73 : 0.81) * scaleFactor

        return selectedIndexPaths.contains(indexPath) ?
        CGSize(
            width: deviceIsIPAD ? collectionView.frame.height * 0.85 :
            ((collectionView.frame.width - 55) / 3),
            height: collectionView.frame.height) : CGSize(width: collectionView.frame.height * 0.7, height: collectionView.frame.height * 0.85)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat { CollectionLayoutConstants.spacing }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { CollectionLayoutConstants.spacing }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets { CollectionLayoutConstants.sectionInsets }

}

class MainSubsCollectionSight: UICollectionViewFlowLayout {
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
}
