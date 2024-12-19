import Foundation

struct MultiTypesDaraRequestsStubs {
    private let boundary: String = UUID().uuidString
    private var httpBody = NSMutableData()
    let url: URL

    init(url: URL) {
        self.url = url
    }

    func putINTextPlain(named name: String, value: String) {
        httpBody.putINStroky(textFormaPlain(named: name, value: value))
    }

    func putINDataPlain(named name: String, filename: String, data: Data, mimeType: String) {

        httpBody.append(dataFormaPlain(named: name, filename: filename, data: data, mimeType: mimeType))
    }

    func asURLRequest() -> URLRequest {
        var request = URLRequest(url: url)

        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        httpBody.putINStroky("--\(boundary)--")
        request.httpBody = httpBody as Data
        return request
    }

    private func textFormaPlain(named name: String, value: String) -> String {
        var fieldString = "--\(boundary)\r\n"
        fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
        fieldString += "Content-Type: text/plain; charset=ISO-8859-1\r\n"
        fieldString += "Content-Transfer-Encoding: 8bit\r\n"
        fieldString += "\r\n"
        fieldString += "\(value)\r\n"

        return fieldString
    }

    private func dataFormaPlain(
        named name: String,
        filename: String,
        data: Data,
        mimeType: String
    ) -> Data {
        let fieldData = NSMutableData()

        fieldData.putINStroky("--\(boundary)\r\n")
        fieldData.putINStroky("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\n")
        fieldData.putINStroky("Content-Type: \(mimeType)\r\n")
        fieldData.putINStroky("\r\n")
        fieldData.append(data)
        fieldData.putINStroky("\r\n")

        return fieldData as Data
    }
}

extension NSMutableData {
    func putINStroky(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
