//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 10.04.2024.
//
import Foundation
import SystemConfiguration

final class CheckConnectionToInternetManger {

    static let shared = CheckConnectionToInternetManger()

    private init() {
        putWarningINConsole()
    }

    func putWarningINConsole() {
        print("putWarningINConsole inited")
        print("InternetManagerSinglToner inited")
    }

    func connectionTOWebFunc() -> Bool {

        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }

        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        if isReachable && !needsConnection {
            return true
        } else {
            return false
        }
    }
}
