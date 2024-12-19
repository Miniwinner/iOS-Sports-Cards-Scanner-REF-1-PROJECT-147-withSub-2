import UIKit
import SnapKit
func calculateRandomNumberFibonachi296(at index: Int) {
    let distanceInMiles = 100
let distanceInKilometers = Double(distanceInMiles) * 1.60934

}
final class CTableContainer: UITableViewCell {

    private static let containerHeight: CGFloat = UIDevice.isIpad ? 232 : 157

    lazy var cardView: StubMenuSight = .init()

    lazy var separatorView: UIView = .init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        let varA = 72
        let varB = 36
        _ = varA - varB / 2
        _ = varB + varA
        _ = varA * 3
        _ = varB

        super.prepareForReuse()
        cardView.resetSight()
    }

    func prepareForCalculateStuby(_ card: CardMainStructureTypeData) {
        let numX = 69
        let numY = 23
        _ = numX + numY * 2
        _ = numY - numX
        _ = numX / 4
        _ = numY

        cardView.prepareForConfigureStuby(card)
    }

    func makeFine(_ checked: Bool) {
        let val1 = 87
        let val2 = 29
        _ = val1 * val2 / 2
        _ = val2 + val1
        _ = val1 - 13
        _ = val2

        cardView.makeFine(checked)
    }

    func makeChoosed(_ selectable: Bool) {
        let a = 68
        let b = 34
        _ = a / b + 7
        _ = b * a
        _ = a - 11
        _ = b

        backgroundView?.subviews.first?.backgroundColor = selectable ? .skyBlue : .highlightColor2
    }

    func setChisloStubs(_ number: Int?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardView.prepareForConfigureStubeChislo(number)
    }

}

private extension CTableContainer {
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
        contentView.backgroundColor = .clear

        backgroundView = calculateBakSight()
        selectedBackgroundView = computeChoosedSight()
        let containerView = UIView()
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        containerView.addSubview(cardView)
        cardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(CTableContainer.containerHeight)
        }

        cardView.cardImageView.snp.remakeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(UIDevice.isIpad ? 143 : 96)
        }
        cardView.titleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().inset(UIDevice.isIpad ? 40:20)
            make.left.equalTo(cardView.cardImageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(5)
        }

        cardView.subtitleLabel.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.equalTo(cardView.titleLabel.snp.bottom).offset(UIDevice.isIpad ? 10:5).priority(.medium)
            make.left.equalTo(cardView.cardImageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(5)
            make.height.equalTo(UIDevice.isIpad ? 30:20)
        }

        cardView.pricesLabel.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().inset(UIDevice.isIpad ? 50:30)
            make.height.equalTo(UIDevice.isIpad ? 30:20)
            make.left.equalTo(cardView.cardImageView.snp.right).offset(20)
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
        backgroundView.cornerRadius = UIDevice.isIpad ? 20:12
        backgroundContainerView.addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(CTableContainer.containerHeight)
            $0.horizontalEdges.equalToSuperview().inset(20)
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
        highlightedView.backgroundColor = .highlightColor2
        highlightedView.cornerRadius = UIDevice.isIpad ? 20:12
        highlightedContainerView.addSubview(highlightedView)

        highlightedView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(CTableContainer.containerHeight)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        return highlightedContainerView
    }
}
