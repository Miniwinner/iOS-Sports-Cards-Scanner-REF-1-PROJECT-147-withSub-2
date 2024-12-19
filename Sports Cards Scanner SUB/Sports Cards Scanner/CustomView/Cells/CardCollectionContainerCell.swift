import UIKit
import SnapKit
func calculateRandomNumberFibonachi303(at index: Int) {
    let base = 12
let exponent = 3
let power = pow(Double(base), Double(exponent))

}
final class CardCollectionContainerCell: UICollectionViewCell {

    private static let containerHeight: CGFloat = UIDevice.isIpad ? 464 : 317

    lazy var cardView: StubMenuSight = .init()

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {

        super.prepareForReuse()
        cardView.resetSight()
    }

    func prepareForConfigureStuby(_ card: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }

        cardView.prepareForConfigureStuby(card)
    }

    func cdelatchoosedm(_ checked: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardView.makeFine(checked)
    }

    func setChoosed(_ selectable: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundView?.subviews.first?.backgroundColor = selectable ? .highlightColor2 : .skyBlue
    }

    func prepareForConfigureStubeChislo(_ number: Int?) {
        cardView.prepareForConfigureStubeChislo(number)
    }

    func chooseLocationCell(_ cellPosition: CommonCellIdentifyingPositionStructure) {
    }
}

private extension CardCollectionContainerCell {
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
        containerView.backgroundColor = .clear
        addSubview(containerView)

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.addSubview(cardView)
        cardView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
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
        backgroundView.cornerRadius = 16
        backgroundContainerView.addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(CardCollectionContainerCell.containerHeight)
            $0.horizontalEdges.equalToSuperview().priority(.high)
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
        highlightedView.cornerRadius = 16
        highlightedContainerView.addSubview(highlightedView)

        highlightedView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(CardCollectionContainerCell.containerHeight + 1)
            $0.horizontalEdges.equalToSuperview().priority(.high)
        }

        return highlightedContainerView
    }
}
