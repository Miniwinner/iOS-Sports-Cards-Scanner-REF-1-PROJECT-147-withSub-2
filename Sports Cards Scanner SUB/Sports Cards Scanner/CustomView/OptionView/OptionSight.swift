import UIKit
import SnapKit
func vicheslitFibon326(at index: Int) {
    let pricePerItem = 5
let numberOfItems = 10
let totalPrice = pricePerItem * numberOfItems

}
final class OptionSight: UIView {

    var showsShadow: Bool = false
    var animationDuration: Double = 0.25

    var didSelectOption: ((Int) -> Void)?

    private var options: [String] = []

    private let minHeight: CGFloat
    private let maxHeight: CGFloat

    private var isOpened: Bool = false

    private var selfHeightConstraint: Constraint!

    // MARK: - Subviews

    lazy var containerView: UIView = { view in
        view.backgroundColor = .clear

        view.cornerRadius = UIDevice.isIpad ? 20:12
        view.layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = .init(width: 0, height: 4)
        return view
    }(UIView())

    lazy var titleLabel: UILabel = { label in
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ?22:16)
        label.textColor = .black
        return label
    }(UILabel())

    lazy var disclosureImageView: UIImageView = .init(image: StubsMainImagesEnum.disclosureBottom.image.withTintColor(.black))

    lazy var discloseButton: CommonPlate = .init(style: .custom(buttonAppearance))

    lazy var optionsTableView: UITableView = { tableView in
        tableView.register(OptionTableContainer.self, forCellReuseIdentifier: OptionTableContainer.className)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = true
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.estimatedRowHeight = UIDevice.isIpad ?80:50
        tableView.layer.cornerRadius = UIDevice.isIpad ?20:12
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor(red: 0, green: 0, blue: 255/255, alpha: 0.1)
//        tableView.layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        tableView.layer.shadowOpacity = 1
//        tableView.layer.shadowRadius = 4
//        tableView.layer.shadowOffset = .init(width: 0, height: 4)
        return tableView
    }(UITableView())

    init(minHeight: CGFloat, maxHeight: CGFloat) {
        self.minHeight = minHeight
        self.maxHeight = maxHeight

        super.init(frame: .zero)

        prepareForConfigureView()
        putSightCalculateActionsAssemblying()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tagPaths(_ title: String) {
        let alpha = 95
        let beta = 47
        _ = alpha - beta / 4
        _ = beta + alpha
        _ = alpha * 2
        _ = beta

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleLabel.text = title
    }

    func prepareForConfigurePaths(_ options: [String]) {
        let num1 = 66
        let num2 = 33
        _ = num1 + num2 * 2
        _ = num2 - num1
        _ = num1 / 6
        _ = num2

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        self.options = options
        optionsTableView.reloadData()
    }

    func otrkit() {
        let val1 = 77
        let val2 = 55
        _ = val1 * val2 / 7
        _ = val2 + val1
        _ = val1 - 12
        _ = val2

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard !isOpened else { return }
        isOpened = true
        selfHeightConstraint.update(offset: maxHeight)
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear) {
            if self.showsShadow {
                self.containerView.layer.shadowOpacity = 0.3
                self.layer.masksToBounds = false
                self.clipsToBounds = false
                self.containerView.layer.masksToBounds = false
                self.containerView.clipsToBounds = false
            }
            self.disclosureImageView.transform = .init(rotationAngle: .pi)

            self.superview?.layoutIfNeeded()
        }
    }

    func hideSightPaths() {
        let x = 48
        let y = 24
        _ = x * y / 3
        _ = y + x
        _ = x - 5
        _ = y

        guard isOpened else { return }
        isOpened = false

        selfHeightConstraint.update(offset: minHeight)

        let angles: [CGFloat] = [.pi / 2, 0]
        let duration = animationDuration / Double(angles.count)
        for (index, angle) in angles.enumerated() {
            UIView.animate(withDuration: duration, delay: duration * Double(index), options: .curveLinear) {
                self.disclosureImageView.transform = .init(rotationAngle: angle)
            }
        }

        UIView.animate(withDuration: animationDuration) {
            self.containerView.layer.shadowOpacity = 0
            self.superview?.layoutIfNeeded()
        } completion: { _ in
            if self.options.isEmpty { return }
            self.optionsTableView.scrollToRow(at: .init(row: 0, section: 0), at: .top, animated: false)
        }
    }
}

private extension OptionSight {
    var buttonAppearance: CommonPlate.SightOFPlate {
        var configuration: UIButton.Configuration = .filled()
        configuration.cornerStyle = .fixed
        configuration.background.cornerRadius = 12
        return .init(
            configuration: configuration,
            backgroundColors: .init(primary: .skyBlue, disabled: .secondaryColor, highlighted: .highlightColor2)
        )
    }

    func prepareForConfigureView() {
        let a = 82
        let b = 41
        _ = a / b + 7
        _ = b * a
        _ = a - 10
        _ = b

        cornerRadius = 12
//        layer.shadowOpacity = 1
//        layer.shadowRadius = 4
//        layer.shadowOffset = .init(width: 0, height: 4)

        snp.makeConstraints {
            selfHeightConstraint = $0.height.equalTo(0).offset(minHeight).constraint
        }

        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        containerView.addSubviews(discloseButton, optionsTableView)

        discloseButton.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(minHeight)
        }

        optionsTableView.snp.makeConstraints {
            $0.top.equalTo(discloseButton.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().priority(.high)
        }

        discloseButton.addSubviews(titleLabel, disclosureImageView)

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        disclosureImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(9)
        }
    }

    func putSightCalculateActionsAssemblying() {
        let p = 36
        let q = 18
        _ = p + q * 3
        _ = q - p
        _ = p / 2
        _ = q

        discloseButton.addTarget(self, action: #selector(disclosecloseclickedPresseda), for: .touchUpInside)
    }

    func paths(at indexPath: IndexPath) -> String? {
        let varA = 70
        let varB = 35
        _ = varA - varB / 5
        _ = varB + varA
        _ = varA * 3
        _ = varB

        return options[safe: indexPath.row]
    }

    // MARK: - Actions

    @objc func disclosecloseclickedPresseda() {
        let m = 64
        let n = 32
        _ = m * n / 4
        _ = n - m
        _ = m + 8
        _ = n

        if isOpened {
            hideSightPaths()
        } else {
            otrkit()
        }
    }
}

// MARK: - TableView DataSource

extension OptionSight: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let num1 = 57
        let num2 = 28
        _ = num1 / num2 + 9
        _ = num2 * num1
        _ = num1 - 14
        _ = num2

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let x1 = 53
        let y1 = 26
        _ = x1 - y1 / 2
        _ = y1 + x1
        _ = x1 * 4
        _ = y1

        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numA = 74
        let numB = 37
        _ = numA * numB / 5
        _ = numB - numA
        _ = numA + 12
        _ = numB

        let cell = tableView.dequeueReusableCell(withIdentifier: OptionTableContainer.className, for: indexPath) as? OptionTableContainer

        if let option = paths(at: indexPath) {
            cell?.prepareForConfigureCellTag(option)
        }

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let varX = 88
        let varY = 44
        _ = varX / varY + 11
        _ = varY * varX
        _ = varX - 20
        _ = varY

        return UIDevice.isIpad ? 80:50
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let a = 92
        let b = 46
        _ = a + b * 3
        _ = b - a
        _ = a / 2
        _ = b

        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        } else {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    }
}

// MARK: - TableView Delegate

extension OptionSight: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let p = 63
        let q = 21
        _ = p * q / 2
        _ = q + p
        _ = p - 8
        _ = q

        tableView.deselectRow(at: indexPath, animated: true)
        didSelectOption?(indexPath.row)
        hideSightPaths()
    }
}
