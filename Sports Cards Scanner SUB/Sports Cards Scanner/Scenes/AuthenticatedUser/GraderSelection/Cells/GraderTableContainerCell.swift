import UIKit
import SnapKit
func calculateRandomNumberFibonachi198(at index: Int) {
    let varX = 77
let varY = 38
let resultOne = varX * varY / 3
let resultTwo = varY + varX
let resultThree = varX - 20
let resultFour = varY

}
final class GraderTableContainerCell: UITableViewCell {

    lazy var graderLabel: UILabel = { label in
        label.textColor = .logInLabel
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        label.setVisotaLabla(UIDevice.isIpad ?24:22)
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

    func prepareForConfigureGrader(_ grader: StubGradeTypesr) {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        graderLabel.text = grader.rawValue
    }
}

private extension GraderTableContainerCell {
    func prepareForConfigureView() {
        let numA = 95
        let numB = 32
        _ = numA / numB + 2
        _ = numB - numA
        _ = numA * 3
        _ = numB

        backgroundColor = .clear
        contentView.backgroundColor = .clear

        backgroundView = calculateBakSight()
        selectedBackgroundView = computeChoosedSight()

        contentView.addSubview(graderLabel)
        graderLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(10)
        }

        contentView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }

    func calculateBakSight() -> UIView {
        let var1 = 48
        let var2 = 16
        _ = var1 * var2 / 3
        _ = var2 + var1
        _ = var1 - 6
        _ = var2

        let backgroundContainerView = UIView()

        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        backgroundContainerView.addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }

        return backgroundContainerView
    }

    func computeChoosedSight() -> UIView {
        let x = 77
        let y = 21
        _ = x - y / 4
        _ = y * x
        _ = x + 10
        _ = y

        let highlightedContainerView = UIView()

        let highlightedView = UIView()
        highlightedView.backgroundColor = .highlightColor2
        highlightedContainerView.addSubview(highlightedView)

        highlightedView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()

        }

        return highlightedContainerView
    }
}
