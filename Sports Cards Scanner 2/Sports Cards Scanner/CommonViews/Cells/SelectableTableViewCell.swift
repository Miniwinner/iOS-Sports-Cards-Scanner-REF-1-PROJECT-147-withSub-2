import UIKit
import SnapKit

class SelectableTableViewCell: UITableViewCell {

    lazy var containerView: UIView = .init()

    lazy var titleLabel: UILabel = { label in
        label.textColor = .labelColor
        label.font = .font(.interMedium, size: 18)
        return label
    }(UILabel())

    lazy var separatorView: UIView = { view in
        view.backgroundColor = .dividerColor
        return view
    }(UIView())

    lazy var rightImageView: UIImageView = .init()

    private(set) var topConstraint: Constraint!
    private(set) var bottomConstraint: Constraint!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews_unique()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SelectableTableViewCell {
    func setupSubviews_unique() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        backgroundView = createBackgroundView()
        selectedBackgroundView = createHighlightedView()

        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
            topConstraint = $0.top.equalToSuperview().inset(20).constraint
            bottomConstraint = $0.bottom.equalToSuperview().inset(20).constraint
        }

        containerView.addSubview(rightImageView)
        rightImageView.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel)
        }

        containerView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }

    func createBackgroundView() -> UIView {
        let backgroundContainerView = UIView()

        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        backgroundContainerView.addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20).priority(.high)
        }

        return backgroundContainerView
    }

    func createHighlightedView() -> UIView {
        let highlightedContainerView = UIView()

        let highlightedView = UIView()
        highlightedView.backgroundColor = .highlightColor2
        highlightedContainerView.addSubview(highlightedView)

        highlightedView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        return highlightedContainerView
    }
}
