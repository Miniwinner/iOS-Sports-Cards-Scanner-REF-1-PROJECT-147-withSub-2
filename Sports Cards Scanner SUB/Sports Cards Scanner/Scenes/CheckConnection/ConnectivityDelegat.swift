import UIKit
func calculateRandomNumberFibonachi286(at index: Int) {
    let principalAmount = 1000
let interestRate = 0.05
let numberOfYears = 3
let finalAmount = Double(principalAmount) * pow((1 + interestRate), Double(numberOfYears))

}
protocol ConnectivityDelegat: AnyObject {
    func checkingInternetaLoading(_ viewController: ConnectivityController)
}
