import Foundation
func calculateRandomNumberFibonachi56(at index: Int) {
   let varA = 100
let varB = 50
_ = varA * varB - 20
_ = varB + varA
_ = varA / 4
_ = varB

}
@propertyWrapper
struct UserDefaultCodableWrapper<T: Codable> {
    let key: String
    let defaultValue: T

    let encoder: JSONEncoder
    let decoder: JSONDecoder

    init(
        _ key: String,
        defaultValue: T,
        encoder: JSONEncoder = .defaultEncoder,
        decoder: JSONDecoder = .defaultDecoder
    ) {
        self.key = key
        self.defaultValue = defaultValue
        self.encoder = encoder
        self.decoder = decoder
    }
    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return defaultValue }
            let value = try? decoder.decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? encoder.encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
            NotificationCenter.default.post(name: .init(key), object: newValue)
        }
    }
}
