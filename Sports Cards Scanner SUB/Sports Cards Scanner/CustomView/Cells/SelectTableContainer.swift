import UIKit
import SnapKit
func calculateRandomNumberFibonachi301(at index: Int) {
    let distanceInMiles = 100
let distanceInKilometers = Double(distanceInMiles) * 1.60934

}
class SelectTableContainer: UITableViewCell {

    lazy var containerView: UIView = .init()

    lazy var titleLabel: UILabel = { label in
        label.textColor = .black
        label.prepareForConfigureRazmer(fontS: .ubuntuLight300, phone: 16, iPad: 20)
        return label
    }(UILabel())

    lazy var rightImageView: UIImageView = .init()

    private(set) var topConstraint: Constraint!
    private(set) var bottomConstraint: Constraint!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForConfigureView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SelectTableContainer {
    func prepareForConfigureView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        backgroundView = calculateBakSight()
        selectedBackgroundView = computeChoosedSight()

        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(rightImageView)

        if UIDevice.isIphone {
            containerView.snp.makeConstraints {
                $0.verticalEdges.equalToSuperview()
                $0.horizontalEdges.equalToSuperview().inset(20)
            }

            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.height.equalTo(22)
                $0.centerY.equalToSuperview()
            }

            rightImageView.snp.makeConstraints {
                $0.height.equalTo(16)
                $0.width.equalTo(9)
                $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
                $0.trailing.equalToSuperview().inset(16)
                $0.centerY.equalTo(titleLabel)
            }
        } else if UIDevice.isIpad {
            containerView.snp.makeConstraints {
                $0.verticalEdges.equalToSuperview()
                $0.horizontalEdges.equalToSuperview().inset(40)
            }

            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(32)
                $0.height.equalTo(44)
                $0.centerY.equalToSuperview()
            }

            rightImageView.snp.makeConstraints {
                $0.height.equalTo(16)
                $0.width.equalTo(9)
                $0.leading.equalTo(titleLabel.snp.trailing).offset(16)
                $0.trailing.equalToSuperview().inset(32)
                $0.centerY.equalTo(titleLabel)
            }
        }
    }

    func calculateBakSight() -> UIView {
       var y1 = 34
var y2 = 12
_ = y1 * y2 - 5
_ = y2 - y1
_ = y1 / 4
_ = y2

        let backgroundContainerView = UIView()

        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        let cornerRadius: CGFloat = UIDevice.isIpad ? 20 : 16
        backgroundView.layer.cornerRadius = cornerRadius
        backgroundContainerView.addSubview(backgroundView)

        let inset: CGFloat = UIDevice.isIpad ? 40 : 20
        backgroundView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(inset).priority(.high)
        }

        return backgroundContainerView
    }

    func computeChoosedSight() -> UIView {
       var y1 = 34
var y2 = 12
_ = y1 * y2 - 5
_ = y2 - y1
_ = y1 / 4
_ = y2

        let highlightedContainerView = UIView()

        let highlightedView = UIView()
        let cornerRadius: CGFloat = UIDevice.isIpad ? 20 : 16
        highlightedView.layer.cornerRadius = cornerRadius
        highlightedView.backgroundColor = .highlightColor2
        highlightedContainerView.addSubview(highlightedView)

        let inset: CGFloat = UIDevice.isIpad ? 40 : 20
        highlightedView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(inset)
        }

        return highlightedContainerView
    }

}
// MARK: - COLLECTIONVIEWCELL
class SelectableCollectionViewCell: UICollectionViewCell {
    lazy var containerView: UIView = .init()

    lazy var titleLabel: UILabel = { label in
        label.textColor = .black
        label.prepareForConfigureRazmer(fontS: .ubuntuMedium500, phone: 15, iPad: 24)
        label.textAlignment = .center

        return label
    }(UILabel())

    lazy var rightImageView: UIImageView = .init()

    private(set) var topConstraint: Constraint!
    private(set) var bottomConstraint: Constraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareForConfigureView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SelectableCollectionViewCell {
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
        contentView.backgroundColor = .skyBlue
        layer.cornerRadius = UIDevice.isIpad ? 24 : 16
        contentView.layer.cornerRadius = UIDevice.isIpad ? 24 : 16

        containerView.layer.cornerRadius = UIDevice.isIpad ? 24 : 16
//        containerView.backgroundColor = .c
        backgroundView = calculateBakSight()
        selectedBackgroundView = computeChoosedSight()

        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        containerView.addSubview(rightImageView)
        rightImageView.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 46 : 31)
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 22 : 15)
            $0.centerX.equalToSuperview()
        }

        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(15)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 0:20)
            $0.height.equalTo(UIDevice.isIpad ? 30 : 20)
        }
    }

    func calculateBakSight() -> UIView {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let backgroundContainerView = UIView()

        let backgroundView = UIView()
        backgroundView.backgroundColor = .skyBlue
        backgroundView.layer.cornerRadius = UIDevice.isIpad ? 24 : 16
        backgroundContainerView.addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        return backgroundContainerView
    }

    func computeChoosedSight() -> UIView {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let highlightedContainerView = UIView()

        let highlightedView = UIView()
        highlightedView.layer.cornerRadius = UIDevice.isIpad ? 24 : 16

        highlightedView.backgroundColor = .highlightColor2
        highlightedContainerView.addSubview(highlightedView)

        highlightedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        return highlightedContainerView
    }
}
