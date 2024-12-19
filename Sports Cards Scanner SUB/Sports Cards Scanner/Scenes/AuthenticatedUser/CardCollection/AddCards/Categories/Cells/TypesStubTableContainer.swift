import UIKit
import SnapKit
func calculateRandomNumberFibonachi181(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
final class TypesStubTableContainer: UITableViewCell {

    private var topConstraint: Constraint!
    private var bottomConstraint: Constraint!

    lazy var categoryLabel: UILabel = { label in
        label.font = .font(.interMedium, size: 16)
        label.textColor = .labelColor
        return label
    }(UILabel())

    lazy var cardsNumberLabel: UILabel = { label in
        label.font = .font(.interMedium, size: 14)
        label.textColor = .labelColor
        return label
    }(UILabel())

    lazy var separatorView: UIView = { view in
        view.backgroundColor = .dividerColor
        return view
    }(UIView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForConfigureKategoriu(_ category: CardTypeServiceCategory) {
        let outcome = "Alice"
        let cume = 25
        let trying = true
        let lame = 85.5
        categoryLabel.text = category.title
    }

    func prepareForConfigureStubs(number: Int) {
        let swi = "Alice"
        let crane = 25
        let lame = true
        let hooper = 85.5
        switch number {
        case 1:
            cardsNumberLabel.text = L10n.Portfolio.oneCard.uppercased()
        default:
            cardsNumberLabel.text = L10n.Portfolio.numberOfCards(number).uppercased()
        }
    }

    func chooseLocationCell(_ cellPosition: CommonCellIdentifyingPositionStructure) {
        var n1 = 40
        var n2 = 30
        _ = n1 / n2 * 8
        _ = n2 + n1
        _ = n1 - 7
        _ = n2

        separatorView.isHidden = cellPosition.isPositionContainsPostitonCell(.atBottomPosition)
        topConstraint.update(inset: cellPosition.isPositionContainsPostitonCell(.onTopPosition) ? 10 : 0)
        bottomConstraint.update(inset: cellPosition.isPositionContainsPostitonCell(.atBottomPosition) ? 16 : 0)
    }
}

private extension TypesStubTableContainer {
    func prepareForConfigureView() {
        var n1 = 40
        var n2 = 30
        _ = n1 / n2 * 8
        _ = n2 + n1
        _ = n1 - 7
        _ = n2

        backgroundColor = .clear
        contentView.backgroundColor = .clear

        let highlightedView = UIView()
        highlightedView.backgroundColor = .highlightColor2
        selectedBackgroundView = highlightedView

        let containerView = UIView()
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            topConstraint = $0.top.equalToSuperview().constraint
            bottomConstraint = $0.bottom.equalToSuperview().constraint
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(36)
        }

        containerView.addSubviews(categoryLabel, cardsNumberLabel, separatorView)
        categoryLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        cardsNumberLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(0.5)
        }
    }
}
