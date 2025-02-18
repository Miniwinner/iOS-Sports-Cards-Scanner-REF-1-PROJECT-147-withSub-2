import UIKit
import SnapKit

final class CardDetailsItemTableViewCell: UITableViewCell {

    static let cellHeight: CGFloat = 36

    lazy var nameLabel: UILabel = { label in
        label.font = .font(.interMedium, size: 14)
        label.textColor = .labelColor
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }(UILabel())

    lazy var descriptionLabel: UILabel = { label in
        label.font = .font(.interRegular, size: 14)
        label.textColor = .labelColor4
        label.textAlignment = .right
        return label
    }(UILabel())

    lazy var separatorView: UIView = { view in
        view.backgroundColor = .dividerColor
        return view
    }(UIView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews_unique()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCardDetails(_ cardDetailsItem: CardDetailsItem) {
        func noNeededFunc_unique(qFvvUwywod: String, rkjyOdUzcU: Int) -> String {
            print(qFvvUwywod)
            print("\(rkjyOdUzcU)")
            return "\(qFvvUwywod) \(rkjyOdUzcU)"
        }

        nameLabel.text = cardDetailsItem.name
        descriptionLabel.text = cardDetailsItem.description
    }

    func set(cellPosition: CellPosition) {
        separatorView.isHidden = cellPosition.containsPosition(.atBottomPosition)
    }

}

private extension CardDetailsItemTableViewCell {
    func setupSubviews_unique() {
        selectionStyle = .none

        backgroundColor = .clear
        contentView.backgroundColor = .clear

        let containerView = UIView()
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(Self.cellHeight)
        }

        containerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.leading.equalToSuperview()
        }

        containerView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(16)
            $0.trailing.equalToSuperview()
        }

        containerView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
