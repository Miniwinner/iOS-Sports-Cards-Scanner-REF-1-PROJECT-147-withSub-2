import Foundation
import UIKit

final class SubsScrollCollectionCellSight: UIView {

    private var textColot: UIColor = UIColor.white

    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Gilroy-Black", size: 12)
        label.textColor = textColot
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .natural
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Gilroy", size: 10)
        label.textColor = textColot
        label.textAlignment = .natural
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        return label
    }()

    private lazy var starIcon: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 3
        return stack
    }()

    convenience init(title: NSAttributedString, subTitle: String, imageName: String) {
        self.init()
        self.titleLabel.attributedText = title
        self.subTitleLabel.text = subTitle
        self.starIcon.image = UIImage(named: imageName)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        addSubview(starIcon)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)

        starIcon.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(stackView)
            make.width.height.equalTo(18)
        }

        stackView.snp.remakeConstraints { make in
            make.leading.equalTo(starIcon.snp.trailing).offset(8)
            make.top.bottom.trailing.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
