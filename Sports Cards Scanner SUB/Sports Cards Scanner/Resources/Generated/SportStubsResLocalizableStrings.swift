// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_Atributes_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
    
    internal enum AddCards {
        /// All Cards
        internal static var allCards: String { L10n.tr("AdoptableLanguage", "addCards_allCards") }
        /// No Results Found
        internal static var noResult: String { L10n.tr("AdoptableLanguage", "addCards_noResult") }
        /// %d Cards Selected
        internal static func numberOfCardsSelected(_ p1: Int) -> String {
            return L10n.tr("AdoptableLanguage", "addCards_numberOfCardsSelected", p1)
        }
        /// 1 Card Selected
        internal static var oneCardSelected: String { L10n.tr("AdoptableLanguage", "addCards_oneCardSelected") }
        /// Add Cards to "%@"
        internal static func title(_ p1: Any) -> String {
            return L10n.tr("AdoptableLanguage", "addCards_title", String(describing: p1))
        }
        internal enum Action {
            /// Select All
            internal static var selectAll: String { L10n.tr("AdoptableLanguage", "addCards_action_selectAll") }
        }
        internal enum Search {
            /// Search for a card
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "addCards_search_placeholder") }
        }
        internal enum TitleNoName {
            /// Add Cards to Collection
            internal static var collection: String { L10n.tr("AdoptableLanguage", "addCards_titleNoName_collection") }
            /// Add Cards to Deck
            internal static var deck: String { L10n.tr("AdoptableLanguage", "addCards_titleNoName_deck") }
        }
    }
    
    internal enum Alert {
        internal enum NeedRecentLogin {
            /// To delete an account, a recent login is required
            internal static var message: String { L10n.tr("AdoptableLanguage", "alert_needRecentLogin_message") }
            /// Re-authenticate
            internal static var title: String { L10n.tr("AdoptableLanguage", "alert_needRecentLogin_title") }
            internal enum Action {
                /// Log Out
                internal static var logOut: String { L10n.tr("AdoptableLanguage", "alert_needRecentLogin_action_logOut") }
            }
        }
        internal enum NoInternetConnection {
            /// Internet connection appears to be offline ☹️
            internal static var message: String { L10n.tr("AdoptableLanguage", "alert_noInternetConnection_message") }
            /// Connectivity Issue
            internal static var title: String { L10n.tr("AdoptableLanguage", "alert_noInternetConnection_title") }
        }
    }
    
    internal enum Card {
        /// Missing
        /// Image
        internal static var missingImage: String { L10n.tr("AdoptableLanguage", "card_missingImage") }
    }
    
    internal enum CardCategories {
        /// Select and order the card types you collect. This order will be reflected in your scanner and Portfolio
        internal static var description: String { L10n.tr("AdoptableLanguage", "cardCategories_description") }
        /// You must always have at least one active category.
        internal static var minEnabledCategories: String { L10n.tr("AdoptableLanguage", "cardCategories_minEnabledCategories") }
        /// Card Categories
        internal static var title: String { L10n.tr("AdoptableLanguage", "cardCategories_title") }
    }
    
    internal enum CardCategory {
        /// Baseball
        internal static var baseball: String { L10n.tr("AdoptableLanguage", "cardCategory_baseball") }
        /// Basketball
        internal static var basketball: String { L10n.tr("AdoptableLanguage", "cardCategory_basketball") }
        /// Football
        internal static var football: String { L10n.tr("AdoptableLanguage", "cardCategory_football") }
        /// Hockey
        internal static var hockey: String { L10n.tr("AdoptableLanguage", "cardCategory_hockey") }
        /// Magic: The Gathering
        internal static var magic: String { L10n.tr("AdoptableLanguage", "cardCategory_magic") }
        /// Pokemon
        internal static var pokemon: String { L10n.tr("AdoptableLanguage", "cardCategory_pokemon") }
        /// Soccer
        internal static var soccer: String { L10n.tr("AdoptableLanguage", "cardCategory_soccer") }
        internal enum Magic {
            /// MTG
            internal static var short: String { L10n.tr("AdoptableLanguage", "cardCategory_magic_short") }
        }
    }
    
    internal enum CardCollection {
        /// Estimated Value
        internal static var estimatedValue: String { L10n.tr("AdoptableLanguage", "cardCollection_estimatedValue") }
        /// There are no cards in this collection
        internal static var noCards: String { L10n.tr("AdoptableLanguage", "cardCollection_noCards") }
        internal enum Action {
            /// Add Cards
            internal static var addCards: String { L10n.tr("AdoptableLanguage", "cardCollection_action_addCards") }
        }
    }
    
    internal enum CardDeck {
        /// There are no cards in this deck
        internal static var noCards: String { L10n.tr("AdoptableLanguage", "cardDeck_noCards") }
        internal enum Action {
            /// Add Cards
            internal static var addCards: String { L10n.tr("AdoptableLanguage", "cardDeck_action_addCards") }
        }
    }
    
    internal enum CardDetail {
        /// Card #
        internal static var cardNumber: String { L10n.tr("AdoptableLanguage", "cardDetail_cardNumber") }
        /// Color
        internal static var color: String { L10n.tr("AdoptableLanguage", "cardDetail_color") }
        /// Colors
        internal static var colors: String { L10n.tr("AdoptableLanguage", "cardDetail_colors") }
        /// Grade
        internal static var grade: String { L10n.tr("AdoptableLanguage", "cardDetail_grade") }
        /// Mana Value
        internal static var manaValue: String { L10n.tr("AdoptableLanguage", "cardDetail_manaValue") }
        /// Parallel
        internal static var parallel: String { L10n.tr("AdoptableLanguage", "cardDetail_parallel") }
        /// Power
        internal static var power: String { L10n.tr("AdoptableLanguage", "cardDetail_power") }
        /// Rarity
        internal static var rarity: String { L10n.tr("AdoptableLanguage", "cardDetail_rarity") }
        /// Series
        internal static var series: String { L10n.tr("AdoptableLanguage", "cardDetail_series") }
        /// Set
        internal static var `set`: String { L10n.tr("AdoptableLanguage", "cardDetail_set") }
        /// Toughness
        internal static var toughness: String { L10n.tr("AdoptableLanguage", "cardDetail_toughness") }
        /// Type
        internal static var type: String { L10n.tr("AdoptableLanguage", "cardDetail_type") }
        /// Ungraded
        internal static var ungraded: String { L10n.tr("AdoptableLanguage", "cardDetail_ungraded") }
        /// Card Year
        internal static var year: String { L10n.tr("AdoptableLanguage", "cardDetail_year") }
    }
    
    internal enum CardDetails {
        internal enum Action {
            /// Add to Portfolio
            internal static var addCard: String { L10n.tr("AdoptableLanguage", "cardDetails_action_addCard") }
            /// Edit Card & Grade
            internal static var editCard: String { L10n.tr("AdoptableLanguage", "cardDetails_action_editCard") }
            /// Find Card
            internal static var findCard: String { L10n.tr("AdoptableLanguage", "cardDetails_action_findCard") }
            /// Remove from Portfolio
            internal static var removeCard: String { L10n.tr("AdoptableLanguage", "cardDetails_action_removeCard") }
        }
    }
    
    internal enum CardLegality {
        /// Legal
        internal static var legal: String { L10n.tr("AdoptableLanguage", "cardLegality_legal") }
        /// Not Legal
        internal static var notLegal: String { L10n.tr("AdoptableLanguage", "cardLegality_notLegal") }
    }
    
    internal enum Common {
        /// Cancel
        internal static var cancel: String { L10n.tr("AdoptableLanguage", "common_cancel") }
        /// Close
        internal static var close: String { L10n.tr("AdoptableLanguage", "common_close") }
        /// Done
        internal static var done: String { L10n.tr("AdoptableLanguage", "common_done") }
        /// Oops, something went wrong
        internal static var error: String { L10n.tr("AdoptableLanguage", "common_error") }
        /// Ok
        internal static var ok: String { L10n.tr("AdoptableLanguage", "common_ok") }
        /// Reset
        internal static var reset: String { L10n.tr("AdoptableLanguage", "common_reset") }
    }
    
    internal enum CreateCollection {
        /// Create New Collection
        internal static var title: String { L10n.tr("AdoptableLanguage", "createCollection_title") }
        internal enum Action {
            /// Create
            internal static var create: String { L10n.tr("AdoptableLanguage", "createCollection_action_create") }
        }
        internal enum CollectionName {
            /// Name your collection
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "createCollection_collectionName_placeholder") }
        }
    }
    
    internal enum CreateDeck {
        /// Create New Deck
        internal static var title: String { L10n.tr("AdoptableLanguage", "createDeck_title") }
        internal enum Action {
            /// Create
            internal static var create: String { L10n.tr("AdoptableLanguage", "createDeck_action_create") }
        }
        internal enum DeckName {
            /// Enter a name
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "createDeck_deckName_placeholder") }
            /// Name your deck
            internal static var title: String { L10n.tr("AdoptableLanguage", "createDeck_deckName_title") }
        }
        internal enum DeckType {
            /// Select a card category
            internal static var select: String { L10n.tr("AdoptableLanguage", "createDeck_deckType_select") }
            /// Deck Type
            internal static var title: String { L10n.tr("AdoptableLanguage", "createDeck_deckType_title") }
        }
        internal enum Description {
            /// Enter a description for your Deck
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "createDeck_description_placeholder") }
            /// Description (optional)
            internal static var title: String { L10n.tr("AdoptableLanguage", "createDeck_description_title") }
        }
    }
    
    internal enum CurrentValue {
        /// Current Value
        internal static var title: String { L10n.tr("AdoptableLanguage", "currentValue_title") }
        /// Value by Category
        internal static var valueByCategory: String { L10n.tr("AdoptableLanguage", "currentValue_valueByCategory") }
    }
    
    internal enum Dashboard {
        /// Current Value
        internal static var currentValue: String { L10n.tr("AdoptableLanguage", "dashboard_currentValue") }
        /// Highest Value
        internal static var highestValue: String { L10n.tr("AdoptableLanguage", "dashboard_highestValue") }
        /// Recently Added
        internal static var recentlyAdded: String { L10n.tr("AdoptableLanguage", "dashboard_recentlyAdded") }
        /// Tap to open the scanner and your first card
        internal static var scanInstructions: String { L10n.tr("AdoptableLanguage", "dashboard_scanInstructions") }
        /// Dashboard
        internal static var title: String { L10n.tr("AdoptableLanguage", "dashboard_title") }
        internal enum Action {
            /// Scan Card
            internal static var scanCard: String { L10n.tr("AdoptableLanguage", "dashboard_action_scanCard") }
        }
        internal enum Welcome {
            /// Scan a card to build your collection
            internal static var description: String { L10n.tr("AdoptableLanguage", "dashboard_welcome_description") }
            /// Welcome to the future of card collecting
            internal static var title: String { L10n.tr("AdoptableLanguage", "dashboard_welcome_title") }
        }
    }
    
    internal enum EditCard {
        /// Set custom price
        internal static var customPrice: String { L10n.tr("AdoptableLanguage", "editCard_customPrice") }
        /// Grade
        internal static var grade: String { L10n.tr("AdoptableLanguage", "editCard_grade") }
        /// Parallel
        internal static var parallel: String { L10n.tr("AdoptableLanguage", "editCard_parallel") }
        /// Edit Details
        internal static var title: String { L10n.tr("AdoptableLanguage", "editCard_title") }
        /// Value Estimate Pending
        internal static var valueEstimating: String { L10n.tr("AdoptableLanguage", "editCard_valueEstimating") }
        internal enum Action {
            /// Update Details
            internal static var updateDetails: String { L10n.tr("AdoptableLanguage", "editCard_action_updateDetails") }
        }
    }
    
    internal enum EditCardSet {
        internal enum Menu {
            /// Add Cards
            internal static var addCards: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_addCards") }
            /// Delete Collection
            internal static var deleteCollection: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_deleteCollection") }
            /// Delete Deck
            internal static var deleteDeck: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_deleteDeck") }
            /// Edit Deck
            internal static var editDeck: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_editDeck") }
            /// Remove Cards
            internal static var removeCards: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_removeCards") }
            /// Rename Collection
            internal static var renameCollection: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_renameCollection") }
            /// Sort Cards
            internal static var sortCards: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_sortCards") }
            /// Total Price Estimate
            internal static var totalPrice: String { L10n.tr("AdoptableLanguage", "editCardSet_menu_totalPrice") }
        }
    }
    
    internal enum EditCollection {
        /// Update Collection
        internal static var title: String { L10n.tr("AdoptableLanguage", "editCollection_title") }
        internal enum CollectionName {
            /// Rename your collection
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "editCollection_collectionName_placeholder") }
        }
    }
    
    internal enum EditDeck {
        /// Update Deck
        internal static var title: String { L10n.tr("AdoptableLanguage", "editDeck_title") }
    }
    
    internal enum ForgotPassword {
        /// Enter the email address for your account and we'll send you instructions to reset your password
        internal static var description: String { L10n.tr("AdoptableLanguage", "forgotPassword_description") }
        /// Forgot Password
        internal static var title: String { L10n.tr("AdoptableLanguage", "forgotPassword_title") }
        internal enum Action {
            /// Send
            internal static var send: String { L10n.tr("AdoptableLanguage", "forgotPassword_action_send") }
        }
        internal enum Email {
            /// Enter your email address
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "forgotPassword_email_placeholder") }
            /// Email address
            internal static var title: String { L10n.tr("AdoptableLanguage", "forgotPassword_email_title") }
        }
        internal enum Error {
            /// Please enter a valid email address
            internal static var invalidEmail: String { L10n.tr("AdoptableLanguage", "forgotPassword_error_invalidEmail") }
            /// There are no users with this email address
            internal static var userNotFound: String { L10n.tr("AdoptableLanguage", "forgotPassword_error_userNotFound") }
        }
    }
    
    internal enum GradeSelection {
        /// Select Grade
        internal static var selectGrade: String { L10n.tr("AdoptableLanguage", "gradeSelection_selectGrade") }
        /// Select Grader
        internal static var selectGrader: String { L10n.tr("AdoptableLanguage", "gradeSelection_selectGrader") }
        /// Grade
        internal static var title: String { L10n.tr("AdoptableLanguage", "gradeSelection_title") }
    }
    
    internal enum HighestValue {
        /// Highest Value Cards
        internal static var title: String { L10n.tr("AdoptableLanguage", "highestValue_title") }
    }
    
    internal enum IdentifyingCard {
        /// Identifying card...
        internal static var processTitle: String { L10n.tr("AdoptableLanguage", "identifyingCard_processTitle") }
        /// %@ Card Captured
        internal static func title(_ p1: Any) -> String {
            return L10n.tr("AdoptableLanguage", "identifyingCard_title", String(describing: p1))
        }
        internal enum Action {
            /// Cancel SCAN
            internal static var cancel: String { L10n.tr("AdoptableLanguage", "identifyingCard_action_cancel") }
        }
    }
    
    internal enum LegalityOption {
        /// Alchemy
        internal static var alchemy: String { L10n.tr("AdoptableLanguage", "legalityOption_alchemy") }
        /// Brawl
        internal static var brawl: String { L10n.tr("AdoptableLanguage", "legalityOption_brawl") }
        /// Commander
        internal static var commander: String { L10n.tr("AdoptableLanguage", "legalityOption_commander") }
        /// Explorer
        internal static var explorer: String { L10n.tr("AdoptableLanguage", "legalityOption_explorer") }
        /// Historic
        internal static var historic: String { L10n.tr("AdoptableLanguage", "legalityOption_historic") }
        /// Legacy
        internal static var legacy: String { L10n.tr("AdoptableLanguage", "legalityOption_legacy") }
        /// Modern
        internal static var modern: String { L10n.tr("AdoptableLanguage", "legalityOption_modern") }
        /// Oathbreaker
        internal static var oathbreaker: String { L10n.tr("AdoptableLanguage", "legalityOption_oathbreaker") }
        /// Pauper
        internal static var pauper: String { L10n.tr("AdoptableLanguage", "legalityOption_pauper") }
        /// Penny
        internal static var penny: String { L10n.tr("AdoptableLanguage", "legalityOption_penny") }
        /// Pioneer
        internal static var pioneer: String { L10n.tr("AdoptableLanguage", "legalityOption_pioneer") }
        /// Standard
        internal static var standard: String { L10n.tr("AdoptableLanguage", "legalityOption_standard") }
        /// Vintage
        internal static var vintage: String { L10n.tr("AdoptableLanguage", "legalityOption_vintage") }
    }
    
    internal enum MagicCard {
        internal enum Color {
            /// Black
            internal static var black: String { L10n.tr("AdoptableLanguage", "magicCard_color_black") }
            /// Blue
            internal static var blue: String { L10n.tr("AdoptableLanguage", "magicCard_color_blue") }
            /// Colorless
            internal static var colorless: String { L10n.tr("AdoptableLanguage", "magicCard_color_colorless") }
            /// Green
            internal static var green: String { L10n.tr("AdoptableLanguage", "magicCard_color_green") }
            /// Red
            internal static var red: String { L10n.tr("AdoptableLanguage", "magicCard_color_red") }
            /// White
            internal static var white: String { L10n.tr("AdoptableLanguage", "magicCard_color_white") }
        }
    }
    
    internal enum More {
        /// More
        internal static var title: String { L10n.tr("AdoptableLanguage", "more_title") }
        internal enum Item {
            /// Card Categories
            internal static var cardCategories: String { L10n.tr("AdoptableLanguage", "more_item_cardCategories") }
            /// Delete Account
            internal static var deleteAccount: String { L10n.tr("AdoptableLanguage", "more_item_deleteAccount") }
            /// Logout
            internal static var logout: String { L10n.tr("AdoptableLanguage", "more_item_logout") }
            /// Privacy Policy
            internal static var privacyPolicy: String { L10n.tr("AdoptableLanguage", "more_item_privacyPolicy") }
            /// Enable Push Notifications
            internal static var pushNotifications: String { L10n.tr("AdoptableLanguage", "more_item_pushNotifications") }
            /// Terms & Conditions
            internal static var termsAndConditions: String { L10n.tr("AdoptableLanguage", "more_item_termsAndConditions") }
            /// Update Password
            internal static var updatePassword: String { L10n.tr("AdoptableLanguage", "more_item_updatePassword") }
        }
    }
    
    internal enum ParallelSelection {
        /// All Options
        internal static var allOptions: String { L10n.tr("AdoptableLanguage", "parallelSelection_allOptions") }
        /// Missing sample
        internal static var missingSample: String { L10n.tr("AdoptableLanguage", "parallelSelection_missingSample") }
        /// No Results Found
        internal static var noResult: String { L10n.tr("AdoptableLanguage", "parallelSelection_noResult") }
        /// Parallel
        internal static var title: String { L10n.tr("AdoptableLanguage", "parallelSelection_title") }
        internal enum Action {
            /// None
            internal static var `none`: String { L10n.tr("AdoptableLanguage", "parallelSelection_action_none") }
        }
        internal enum Search {
            /// Search
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "parallelSelection_search_placeholder") }
        }
    }
    
    internal enum Portfolio {
        /// All Cards
        internal static var allCards: String { L10n.tr("AdoptableLanguage", "portfolio_allCards") }
        /// Cards
        internal static var cards: String { L10n.tr("AdoptableLanguage", "portfolio_cards") }
        /// Total Estimated Value
        internal static var estimatedValue: String { L10n.tr("AdoptableLanguage", "portfolio_estimatedValue") }
        /// %d Cards
        internal static func numberOfCards(_ p1: Int) -> String {
            return L10n.tr("AdoptableLanguage", "portfolio_numberOfCards", p1)
        }
        /// 1 Card
        internal static var oneCard: String { L10n.tr("AdoptableLanguage", "portfolio_oneCard") }
        /// Tap to open the scanner and your first card
        internal static var scanInstructions: String { L10n.tr("AdoptableLanguage", "portfolio_scanInstructions") }
        /// Scan a card to add to your collection
        internal static var scanToAdd: String { L10n.tr("AdoptableLanguage", "portfolio_scanToAdd") }
        /// Portfolio
        internal static var title: String { L10n.tr("AdoptableLanguage", "portfolio_title") }
        internal enum Collection {
            /// Create
            /// Collection
            internal static var create: String { L10n.tr("AdoptableLanguage", "portfolio_collection_create") }
            /// Custom Collection
            internal static var description: String { L10n.tr("AdoptableLanguage", "portfolio_collection_description") }
        }
        internal enum Deck {
            /// Create
            /// Deck
            internal static var create: String { L10n.tr("AdoptableLanguage", "portfolio_deck_create") }
            /// Trading card game deck
            internal static var description: String { L10n.tr("AdoptableLanguage", "portfolio_deck_description") }
        }
    }
    
    internal enum PricingReport {
        /// Edit custom price
        internal static var editCustomPrice: String { L10n.tr("AdoptableLanguage", "pricingReport_editCustomPrice") }
        /// Set custom price
        internal static var setCustomPrice: String { L10n.tr("AdoptableLanguage", "pricingReport_setCustomPrice") }
        /// Value Estimate Pending
        internal static var valueEstimating: String { L10n.tr("AdoptableLanguage", "pricingReport_valueEstimating") }
        /// View Pricing Report
        internal static var viewReport: String { L10n.tr("AdoptableLanguage", "pricingReport_viewReport") }
        internal enum Details {
            /// Last Sold Date
            internal static var lastSoldDate: String { L10n.tr("AdoptableLanguage", "pricingReport_details_lastSoldDate") }
            /// Last Sold Price
            internal static var lastSoldPrice: String { L10n.tr("AdoptableLanguage", "pricingReport_details_lastSoldPrice") }
            /// No recent sales
            internal static var noSales: String { L10n.tr("AdoptableLanguage", "pricingReport_details_noSales") }
            /// Price Report
            internal static var priceReport: String { L10n.tr("AdoptableLanguage", "pricingReport_details_priceReport") }
            /// Recent Sales
            internal static var recentSales: String { L10n.tr("AdoptableLanguage", "pricingReport_details_recentSales") }
        }
    }
    
    internal enum Prompt {
        /// Are you sure?
        internal static var title: String { L10n.tr("AdoptableLanguage", "prompt_title") }
        internal enum Action {
            /// Cancel
            internal static var cancel: String { L10n.tr("AdoptableLanguage", "prompt_action_cancel") }
        }
        internal enum DeleteAccount {
            /// Delete
            internal static var confirmAction: String { L10n.tr("AdoptableLanguage", "prompt_deleteAccount_confirmAction") }
            /// Are you sure you want to delete your account?
            internal static var description: String { L10n.tr("AdoptableLanguage", "prompt_deleteAccount_description") }
            /// Keep
            internal static var keepAction: String { L10n.tr("AdoptableLanguage", "prompt_deleteAccount_keepAction") }
            /// SureAction
            internal static var sureAction: String { L10n.tr("AdoptableLanguage", "prompt_deleteAccount_sure") }
        }
        internal enum DeleteCollection {
            /// Delete
            internal static var confirmAction: String { L10n.tr("AdoptableLanguage", "prompt_deleteCollection_confirmAction") }
            /// Deleting the collection will not delete the cards within the collection. The cards will remain in your portfolio.
            internal static var description: String { L10n.tr("AdoptableLanguage", "prompt_deleteCollection_description") }
            /// Keep
            internal static var keepAction: String { L10n.tr("AdoptableLanguage", "prompt_deleteCollection_keepAction") }
        }
        internal enum DeleteDeck {
            /// Delete
            internal static var confirmAction: String { L10n.tr("AdoptableLanguage", "prompt_deleteDeck_confirmAction") }
            /// Deleting the deck will not delete the cards within the deck. The cards will remain in your portfolio.
            internal static var description: String { L10n.tr("AdoptableLanguage", "prompt_deleteDeck_description") }
            /// Keep
            internal static var keepAction: String { L10n.tr("AdoptableLanguage", "prompt_deleteDeck_keepAction") }
        }
        internal enum Logout {
            /// Log Out
            internal static var confirmAction: String { L10n.tr("AdoptableLanguage", "prompt_logout_confirmAction") }
            /// Are you sure you want to log out of your account?
            internal static var description: String { L10n.tr("AdoptableLanguage", "prompt_logout_description") }
        }
        internal enum RemoveCard {
            /// Remove
            internal static var confirmAction: String { L10n.tr("AdoptableLanguage", "prompt_removeCard_confirmAction") }
            /// You are about to remove this card from your portfolio. This card would need to be scanned again to add back to your portfolio.
            internal static var description: String { L10n.tr("AdoptableLanguage", "prompt_removeCard_description") }
            /// Keep
            internal static var keepAction: String { L10n.tr("AdoptableLanguage", "prompt_removeCard_keepAction") }
        }
    }
    
    internal enum RecentlyAdded {
        /// Recently Added Cards
        internal static var title: String { L10n.tr("AdoptableLanguage", "recentlyAdded_title") }
    }
    
    internal enum ResetPassword {
        /// Password reset instructions have been sent to the email address: %@
        internal static func emailSent(_ p1: Any) -> String {
            return L10n.tr("AdoptableLanguage", "resetPassword_emailSent", String(describing: p1))
        }
        /// Reset Password
        internal static var title: String { L10n.tr("AdoptableLanguage", "resetPassword_title") }
    }
    
    internal enum ScanCard {
        internal enum Action {
            /// Open Settings
            internal static var openSettings: String { L10n.tr("AdoptableLanguage", "scanCard_action_openSettings") }
        }
        internal enum CardSide {
            /// Front of Card
            internal static var front: String { L10n.tr("AdoptableLanguage", "scanCard_cardSide_front") }
        }
        internal enum GradeType {
            /// Graded
            internal static var graded: String { L10n.tr("AdoptableLanguage", "scanCard_gradeType_graded") }
            /// Raw
            internal static var raw: String { L10n.tr("AdoptableLanguage", "scanCard_gradeType_raw") }
        }
        internal enum NoAuthorization {
            /// This lets you scan cards
            internal static var description: String { L10n.tr("AdoptableLanguage", "scanCard_noAuthorization_description") }
            /// Allow %@ to access your camera
            internal static func title(_ p1: Any) -> String {
                return L10n.tr("AdoptableLanguage", "scanCard_noAuthorization_title", String(describing: p1))
            }
        }
    }
    
    internal enum SearchCard {
        /// Search Card
        internal static var title: String { L10n.tr("AdoptableLanguage", "searchCard_title") }
        internal enum Error {
            /// Try again! Keep searching!
            internal static var tryAgain: String { L10n.tr("AdoptableLanguage", "searchCard_error_tryAgain") }
        }
        internal enum Search {
            /// Search for a card
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "searchCard_search_placeholder") }
        }
    }
    
    internal enum SignIn {
        /// Don't have an account?
        internal static var noAccount: String { L10n.tr("AdoptableLanguage", "signIn_noAccount") }
        /// Sign in with
        internal static var signInWith: String { L10n.tr("AdoptableLanguage", "signIn_signInWith") }
        /// Sign In
        internal static var title: String { L10n.tr("AdoptableLanguage", "signIn_title") }
        internal enum Action {
            /// Sign In
            internal static var signIn: String { L10n.tr("AdoptableLanguage", "signIn_action_signIn") }
            /// Sign Up
            internal static var signUp: String { L10n.tr("AdoptableLanguage", "signIn_action_signUp") }
        }
        internal enum Email {
            /// Enter email
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "signIn_email_placeholder") }
            /// Enter email
            internal static var title: String { L10n.tr("AdoptableLanguage", "signIn_email_title") }
        }
        internal enum Error {
            /// Please enter a valid email address
            internal static var invalidEmail: String { L10n.tr("AdoptableLanguage", "signIn_error_invalidEmail") }
            /// Please enter a valid email and password
            internal static var userNotFound: String { L10n.tr("AdoptableLanguage", "signIn_error_userNotFound") }
            /// Please enter correct password
            internal static var wrongPassword: String { L10n.tr("AdoptableLanguage", "signIn_error_wrongPassword") }
        }
        internal enum Password {
            /// Forgot Password?
            internal static var forgot: String { L10n.tr("AdoptableLanguage", "signIn_password_forgot") }
            /// Enter password
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "signIn_password_placeholder") }
            /// Enter password
            internal static var title: String { L10n.tr("AdoptableLanguage", "signIn_password_title") }
        }
    }
    
    internal enum SignUp {
        /// Already have an account?
        internal static var haveAccount: String { L10n.tr("AdoptableLanguage", "signUp_haveAccount") }
        /// Sign in with
        internal static var signInWith: String { L10n.tr("AdoptableLanguage", "signUp_signInWith") }
        /// Sign Up
        internal static var title: String { L10n.tr("AdoptableLanguage", "signUp_title") }
        internal enum Action {
            /// Sign In
            internal static var signIn: String { L10n.tr("AdoptableLanguage", "signUp_action_signIn") }
            /// Sign Up
            internal static var signUp: String { L10n.tr("AdoptableLanguage", "signUp_action_signUp") }
        }
        internal enum ConfirmPassword {
            /// Enter your password confirmation
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "signUp_confirmPassword_placeholder") }
            /// Password confirmation
            internal static var title: String { L10n.tr("AdoptableLanguage", "signUp_confirmPassword_title") }
        }
        internal enum Email {
            /// Enter your email address
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "signUp_email_placeholder") }
            /// Email address
            internal static var title: String { L10n.tr("AdoptableLanguage", "signUp_email_title") }
        }
        internal enum Error {
            /// An account already exists with this email address
            internal static var existUser: String { L10n.tr("AdoptableLanguage", "signUp_error_existUser") }
            /// Please enter a valid email address
            internal static var invalidEmail: String { L10n.tr("AdoptableLanguage", "signUp_error_invalidEmail") }
            /// Password must meet password requirements
            internal static var noPasswordRequirements: String { L10n.tr("AdoptableLanguage", "signUp_error_noPasswordRequirements") }
            /// Passwords must match
            internal static var passwordsMismatch: String { L10n.tr("AdoptableLanguage", "signUp_error_passwordsMismatch") }
        }
        internal enum Password {
            /// Enter your password
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "signUp_password_placeholder") }
            /// Passwords must be at least %d characters and contain at least one uppercase letter (A-Z), one lowercase letter (a-z), one digit (0-9), and one special character (such as ! %% @ or #)
            
            internal static var requirements: String { L10n.tr("AdoptableLanguage", "signUp_password_requirements")}
            
            /// Password
            internal static var title: String { L10n.tr("AdoptableLanguage", "signUp_password_title") }
        }
    }
    
    internal enum SortCards {
        /// Sort by
        internal static var title: String { L10n.tr("AdoptableLanguage", "sortCards_title") }
        internal enum Option {
            /// Date Saved: Oldest-Recent
            internal static var dateOldest: String { L10n.tr("AdoptableLanguage", "sortCards_option_dateOldest") }
            /// Date Saved: Recent-Oldest
            internal static var dateRecent: String { L10n.tr("AdoptableLanguage", "sortCards_option_dateRecent") }
            /// Card Name: A-Z
            internal static var nameDirect: String { L10n.tr("AdoptableLanguage", "sortCards_option_nameDirect") }
            /// Card Name: Z-A
            internal static var nameReverse: String { L10n.tr("AdoptableLanguage", "sortCards_option_nameReverse") }
            /// Card Year: Oldest-Recent
            internal static var yearOldest: String { L10n.tr("AdoptableLanguage", "sortCards_option_yearOldest") }
            /// Card Year: Recent-Oldest
            internal static var yearRecent: String { L10n.tr("AdoptableLanguage", "sortCards_option_yearRecent") }
        }
    }
    
    internal enum Splash {
        /// Loading
        internal static var loading: String { L10n.tr("AdoptableLanguage", "splash_loading") }
    }
    
    internal enum UpdatePassword {
        /// Update Password
        internal static var title: String { L10n.tr("AdoptableLanguage", "updatePassword_title") }
        internal enum Action {
            /// Save
            internal static var save: String { L10n.tr("AdoptableLanguage", "updatePassword_action_save") }
        }
        internal enum ConfirmNewPassword {
            /// Re-enter new password
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "updatePassword_confirmNewPassword_placeholder") }
            /// Confirm new password
            internal static var title: String { L10n.tr("AdoptableLanguage", "updatePassword_confirmNewPassword_title") }
        }
        internal enum Error {
            /// Please reauthenticate to change your password
            internal static var needReauthenticate: String { L10n.tr("AdoptableLanguage", "updatePassword_error_needReauthenticate") }
            /// Password must meet password requirements
            internal static var noPasswordRequirements: String { L10n.tr("AdoptableLanguage", "updatePassword_error_noPasswordRequirements") }
            /// Passwords must match
            internal static var passwordsMismatch: String { L10n.tr("AdoptableLanguage", "updatePassword_error_passwordsMismatch") }
        }
        internal enum NewPassword {
            /// Enter new password
            internal static var placeholder: String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_placeholder") }
            /// Passwords must be at least %d characters and contain at least one uppercase letter (A-Z), one lowercase letter (a-z), one digit (0-9), and one special character (such as ! %% @ or #)
            
            internal static var requierements:String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_requirements") }
            
            ///cutText in Blue
            internal static var updatePassword_newPassword_cut1: String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_cut1") }
            internal static var updatePassword_newPassword_cut2: String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_cut2") }
            internal static var updatePassword_newPassword_cut3: String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_cut3") }
            internal static var updatePassword_newPassword_cut4: String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_cut4") }
            internal static var updatePassword_newPassword_cut5: String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_cut5") }

            /// Create new password
            internal static var title: String { L10n.tr("AdoptableLanguage", "updatePassword_newPassword_title") }
        }
    }
}
// swiftlint:enable explicit_type_interface function_Atributes_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
    static func tr(_ key: String) -> String {
        tr("AdoptableLanguage", key)
    }
    
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: BundleToken.self)
#endif
    }()
}
// swiftlint:enable convenience_type

