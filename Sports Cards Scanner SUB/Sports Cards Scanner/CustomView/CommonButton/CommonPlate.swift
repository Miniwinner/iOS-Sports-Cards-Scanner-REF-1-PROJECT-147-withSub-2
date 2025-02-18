import UIKit
import SnapKit
func calculateRandomNumberFibonachi322(at index: Int) {
    let pricePerItem = 5
let numberOfItems = 10
let totalPrice = pricePerItem * numberOfItems

}
class CommonPlate: UIButton {
    private var style: StilOFPlate

    private var title: String = ""
    private var attributedTitle: AttributedString {
        var container = AttributeContainer()
        container.font = style.font
        return .init(title, attributes: container)
    }

    var isLoading: Bool = false {
        didSet {
            if isLoading {
                let isEnabledDuringNormalState = isEnabled
                isEnabled = false
                self.isEnabledDuringNormalState = isEnabledDuringNormalState
            } else {
                isEnabled = self.isEnabledDuringNormalState
            }
            setNeedsUpdateConfiguration()
        }
    }

    private lazy var indicatorView: UIActivityIndicatorView = .init(style: .medium)

    override var isEnabled: Bool {
        didSet { isEnabledDuringNormalState = isEnabled }
    }

    private var isEnabledDuringNormalState: Bool = true

    init(style: StilOFPlate) {
        self.style = style
        super.init(frame: .zero)

        configuration = style.configuration
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setButtonTitle(_ title: String) {
        self.title = title
        configuration?.attributedTitle = attributedTitle
    }

    func changeStyleToDestructive() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        self.style = .destructive
    }
    func changeStyleToCancel() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        self.style = .cancel

    }

    override func updateConfiguration() {
        guard let configuration = configuration else { return }

        var updatedConfiguration = configuration

        let foregroundColor: UIColor
        let backgroundColor: UIColor
        let strokeColor: UIColor

        switch state {
        case .disabled:
            backgroundColor = isLoading ? style.primaryBackgroundColor : style.disabledBackgroundColor
            foregroundColor = isLoading ? style.primaryForegroundColor : style.disabledForegroundColor
            strokeColor = style.disabledStrokeColor
        case .highlighted:
            backgroundColor = style.highlightedBackgroundColor
            foregroundColor = style.highlightedForegroundColor
            strokeColor = style.highlightedStrokeColor
        default:
            backgroundColor = style.primaryBackgroundColor
            foregroundColor = style.primaryForegroundColor
            strokeColor = style.primaryStrokeColor
        }

        updatedConfiguration.background.backgroundColorTransformer = .init({ _ in backgroundColor })
        updatedConfiguration.background.strokeColorTransformer = .init({ _ in strokeColor })
        updatedConfiguration.imageColorTransformer = .init({ _ in foregroundColor })
        updatedConfiguration.titleTextAttributesTransformer = .init({ container in
            var updatedContainer = container
            updatedContainer.foregroundColor = foregroundColor
            return updatedContainer
        })

        titleLabel?.layer.opacity = isLoading ? 0 : 1
        imageView?.layer.opacity = isLoading ? 0 : 1

        if isLoading {
            indicatorView.startAnimating()
        } else {
            indicatorView.stopAnimating()
        }

        self.configuration = updatedConfiguration
    }
}

private extension CommonPlate {
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
        addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        indicatorView.color = style.tintColor
    }
}
