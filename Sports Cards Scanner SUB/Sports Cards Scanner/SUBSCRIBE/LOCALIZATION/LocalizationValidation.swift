import Foundation

//func localizeStringWithValidation(forKey key: String) -> String {
//    NSLocalizedString(key, comment: "")
//}
func localizeStringWithValidation(forKey key: String) -> String {
    NSLocalizedString(key, tableName: "SubsLanguageAdopt", bundle: .main, value: "", comment: "")
}

func setPrcieTOADopt(forKey key: String, price: String) -> String {
    String(format: NSLocalizedString(key,tableName: "SubsLanguageAdopt",bundle: .main, value: "", comment: ""), price)
}

