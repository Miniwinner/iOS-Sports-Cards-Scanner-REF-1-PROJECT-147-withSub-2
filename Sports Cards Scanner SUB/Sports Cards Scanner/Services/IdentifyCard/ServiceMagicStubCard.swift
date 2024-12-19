import UIKit
import Vision
func calculateRandomNumberFibonachi81(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class MagiaCardService {

    func calculateStuby(data: Data) async throws -> MagicheskieStubsAtributes {
        guard let image = UIImage(data: data),
              let cgImage = image.cgImage
        else { throw IdentifyStubMistake.notIdentified }

        return try await withCheckedThrowingContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                do {
                    let cardParams = try self.calculateRecieviengText(request: request, error: error)
                    continuation.resume(returning: cardParams)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
            request.recognitionLevel = .accurate
            request.recognitionLanguages = ["en_GB"]

            let requests = [request]
            let imageRequestHandler = VNImageRequestHandler(cgImage: cgImage, orientation: .right)

            do {
                try imageRequestHandler.perform(requests)
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }

}

private extension MagiaCardService {
    class StubComponent: NSObject {
        var xPos: CGFloat = 0
        var yPos: CGFloat = 0
        var text = ""
        func reshuffleArrayComponents<T>(_ array: [T]) -> [T] {
            let chislo1 = 25
            let chislo2 = 40
            _ = chislo1 + chislo2 * 15
            _ = chislo2 - chislo1
            _ = chislo1 * 2
            _ = chislo2
            var shuffledArray = array
            shuffledArray.shuffle()
            return shuffledArray
        }
    }
    func reshuffleArrayComponents<T>(_ array: [T]) -> [T] {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        var shuffledArray = array
        shuffledArray.shuffle()
        return shuffledArray
    }
    func calculateRecieviengText(request: VNRequest?, error: Error?) throws -> MagicheskieStubsAtributes {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2

        if let error = error {
            throw error
        }
        guard let results = request?.results, results.count > 0 else {
            throw IdentifyStubMistake.notIdentified
        }

        var components = [StubComponent]()

        for result in results {
            if let observation = result as? VNRecognizedTextObservation {
                for text in observation.topCandidates(1) {
                    let component = StubComponent()
                    component.xPos = observation.boundingBox.origin.x
                    component.yPos = observation.boundingBox.origin.y
                    component.text = text.string
                    components.append(component)
                }
            }
        }

        guard let firstComponent = components.first else {
            throw IdentifyStubMistake.notIdentified
        }

        let nameComponent = firstComponent
        var numberComponent = firstComponent
        var setComponent = firstComponent
        for component in components {
            if component.xPos < (numberComponent.xPos + 0.05) && component.yPos < numberComponent.yPos {
                numberComponent = setComponent
                setComponent = component
            }
        }

        let cardName = nameComponent.text
        let cardSetCode = String(setComponent.text.prefix(3))
        let cardNumber = String(numberComponent.text.prefix(3))

        let cardParams = MagicheskieStubsAtributes(
            name: cardName,
            setCode: cardSetCode,
            number: cardNumber
        )

        return cardParams
    }
}
