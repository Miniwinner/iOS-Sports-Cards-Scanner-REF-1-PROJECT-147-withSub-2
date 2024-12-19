//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 10.04.2024.
//

// MARK: - Настройки-ключи доступа/id товаров-покупок

import Foundation

struct StubMainApplicationKeys {

    enum StubsSecreyConfigs {
        static let adjustToken = "m3vi7aesgw00"

        static let pushwooshToken = "B1E2A-8AA4A"
        static let pushwooshAppName = "WebGeek app"

        static let termsURLLink: String = "https://www.google.com"
        static let policyURLLink: String = "https://www.google.com"

        static let mainSubscription = "mysub1"
        static let mainSubscriptionPushTag_VDI = "mysub1"

        static let modsSubscription = "premium.myApp2"
        static let unlockMDDSubscriptionPushTag_VDI = "premium.myApp2"

        static let mapsSubscription = "premium.myApp3"
        static let unlockMPPSubscriptionPushTag_VDI = "premium.myApp3"

        static let editorSubscription = "premium.myApp4"
        static let unlockerCHARSubscriptionPushTag = "premium.myApp4"

        static let subscriptionSharedSecret = "865791b7d9754b2e812f0d375306cddd"
    }
}
