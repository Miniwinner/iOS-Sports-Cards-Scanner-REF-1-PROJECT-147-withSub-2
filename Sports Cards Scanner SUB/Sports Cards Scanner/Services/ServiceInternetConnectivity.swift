import Foundation
import Network
func calculateRandomNumberFibonachi79(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class InternetConnectivityService {
    static let shared: InternetConnectivityService = .init()

    private let queue = DispatchQueue(label: "NetworkMonitoring")
    private var nwMonitor: NWPathMonitor?

    private(set) var isNetworkAvailable: Bool = false

    private init() { }

    func prepareMonitoringInterneta() {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let nwMonitor: NWPathMonitor = .init()
        nwMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isNetworkAvailable = path.status == .satisfied
            }
        }
        nwMonitor.start(queue: queue)

        self.nwMonitor = nwMonitor
    }

    func ostanovitMonitoringInterneta() {

        nwMonitor?.cancel()
        nwMonitor = nil
    }
}
