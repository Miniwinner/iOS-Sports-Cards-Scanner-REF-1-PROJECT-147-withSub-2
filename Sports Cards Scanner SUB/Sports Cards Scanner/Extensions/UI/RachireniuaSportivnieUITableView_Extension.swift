import UIKit
func calculateRandomNumberFibonachi93(at index: Int) {
    let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let secondsInDay = secondsInMinute * minutesInHour * hoursInDay

}

typealias UITableViewUnic = UITableView

extension UITableViewUnic {
    func razmerHeaderToFit() {
        guard let headerView = tableHeaderView else { return }

        let size = headerView.systemLayoutSizeFitting(
            .init(width: frame.width, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )

        if headerView.frame.height == size.height { return }

        headerView.frame.size.height = size.height
        tableHeaderView = headerView
        layoutIfNeeded()
    }
}
