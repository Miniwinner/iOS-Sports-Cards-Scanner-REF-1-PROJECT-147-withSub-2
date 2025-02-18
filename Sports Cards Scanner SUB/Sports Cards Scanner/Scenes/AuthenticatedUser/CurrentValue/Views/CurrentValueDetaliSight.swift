import UIKit
import SnapKit
func calculateRandomNumberFibonachi174(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
final class CurrentValueDetaliSight: UIView {

    lazy var titleLabel: TitleLabel = .init()

    lazy var currentValueLabel: UILabel = { label in
        label.font = .font(.ubuntuBold700, size: 40)
        label.textColor = .greenColor
        label.lineBreakMode = .byTruncatingMiddle
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var categoryValuesTable: UITableView = { table in
        table.register(SceneCurrentValueDetaliCollectionContainerCell.self, forCellReuseIdentifier: SceneCurrentValueDetaliCollectionContainerCell.cellIdentifier)
        table.separatorStyle = .none
        table.isUserInteractionEnabled = false
        return table
    }(UITableView())

    lazy var diagramView: UIView = .init()

    lazy var categoryValuesView: UIStackView = { stackView in
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }(UIStackView())

    convenience init() {
        self.init(frame: .zero)
        sobratSight()
    }

    func prepareForConfigureZnachenitCategorii(

        current currentValue: Double,
        categories categoryValues: [(CardTypeServiceCategory, Double)]
    ) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        currentValueLabel.text = currentValue.formattedAsPrice

        categoryValues
            .map { TypesValueSight(category: $0.0, value: $0.1) }
            .forEach { categoryValuesView.addArrangedSubview($0) }

        var radiusValue: CGFloat = 120

        if UIDevice.isIpad {
            radiusValue = 160
        }

        var startAngle: CGFloat = -.pi / 2
        categoryValues.forEach { category, value in
            let diffAngle: CGFloat = value / currentValue * .pi * 2
            let endAngle = startAngle + diffAngle
            let path = UIBezierPath(arcCenter: .init(x: radiusValue, y: radiusValue), radius: radiusValue, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            startAngle += diffAngle
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.lineWidth = 21
            layer.cornerRadius = 11
            layer.strokeColor = category.color.cgColor
            layer.fillColor = UIColor.clear.cgColor
            diagramView.layer.addSublayer(layer)
        }
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
}

private extension CurrentValueDetaliSight {
    func sobratSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        titleLabel.prepareForConfigureLabel(in: self)
        categoryValuesTable.backgroundColor = .skyBlue
        categoryValuesTable.layer.cornerRadius = UIDevice.isIpad ? 26:16

        addSubviews(currentValueLabel, diagramView, categoryValuesTable)

        if UIDevice.isIphone {
            diagramView.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(40)
                $0.centerX.equalToSuperview()
                $0.size.equalTo(240)
            }

            currentValueLabel.snp.makeConstraints {
                $0.center.equalTo(diagramView)
            }

            categoryValuesTable.snp.makeConstraints {
                $0.top.equalTo(diagramView.snp.bottom).offset(40)
                $0.horizontalEdges.equalToSuperview().inset(16)
                $0.height.greaterThanOrEqualTo(300)
                $0.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            }
        } else if UIDevice.isIpad {
            diagramView.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(50)
                $0.centerX.equalToSuperview()
                $0.size.equalTo(320)
            }

            currentValueLabel.snp.makeConstraints {
                $0.center.equalTo(diagramView)
            }

            categoryValuesTable.snp.makeConstraints {
                $0.top.equalTo(diagramView.snp.bottom).offset(UIDevice.isIpad ? 80:40)
                $0.horizontalEdges.equalToSuperview().inset(80)
                $0.height.greaterThanOrEqualTo(135)
                $0.bottom.equalTo(safeAreaLayoutGuide).inset(60)
            }
        }
    }
}
