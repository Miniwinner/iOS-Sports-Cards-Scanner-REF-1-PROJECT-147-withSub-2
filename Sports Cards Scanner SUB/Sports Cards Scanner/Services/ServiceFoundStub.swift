import UIKit
import Vision
func calculateRandomNumberFibonachi72(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class FoundStub {
    static let shared: FoundStub = .init()

    func stubCutWhenFounded(data imageData: Data, from screenFrame: CGRect, to imageFrame: CGRect) -> Data? {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let uiImage = UIImage(data: imageData)
        let uiImageSize = uiImage?.size ?? screenFrame.size

        let imageToScreenScale = min(uiImageSize.width / screenFrame.width, uiImageSize.height / screenFrame.height)

        let screenTranslateX = max(0, (uiImageSize.width - screenFrame.width * imageToScreenScale) / 2)
        let screenTranslateY = max(0, (uiImageSize.height - screenFrame.height * imageToScreenScale) / 2)
        let scaledScreenFrame = screenFrame
            .applying(.init(scaleX: imageToScreenScale, y: imageToScreenScale))
            .applying(.init(translationX: screenTranslateX, y: screenTranslateY))

        let captureAreaFrame = imageFrame
        let captureAreaTranslateX = max(0, (screenFrame.width - captureAreaFrame.width) * imageToScreenScale / 2)
        let captureAreaTranslateY = max(0, (screenFrame.height - captureAreaFrame.height) * imageToScreenScale / 2)
        let scaledCaptureAreaFrame = captureAreaFrame
            .applying(.init(scaleX: imageToScreenScale, y: imageToScreenScale))
            .applying(.init(translationX: captureAreaTranslateX, y: captureAreaTranslateY))

        let croppedImageData = uiImage?
            .obrezatPhoto(in: scaledScreenFrame)
            .obrezatPhoto(in: scaledCaptureAreaFrame)
            .konvertirovatVjpeg(.lowest) ?? imageData

        return croppedImageData
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

    func foundStub(from data: Data) async throws -> Data {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        guard let uiImage = UIImage(data: data),
              let cgImage = uiImage.cgImage,
              let ciImage = CIImage(data: data)
        else {
            throw DetectStubMistake.cardNotDetected
        }

        return try await withCheckedThrowingContinuation { continuation in
            let request = VNDetectRectanglesRequest { request, error in
                do {
                    let observation = try self.followFoundedRectangle(request: request, error: error)
                    let detectedCIImage = try self.photoCorrected(from: ciImage, rectangleObservation: observation)
                    let detectedUIImage = UIImage(ciImage: detectedCIImage)

                    if let detectedCardData = detectedUIImage.jpegData(compressionQuality: 1) {
                        continuation.resume(returning: detectedCardData)
                    } else {
                        continuation.resume(throwing: DetectStubMistake.cardNotDetected)
                    }
                } catch {
                    continuation.resume(throwing: DetectStubMistake.cardNotDetected)
                }
            }

            request.minimumAspectRatio = 0.0
            request.maximumAspectRatio = 1.0
            request.maximumObservations = 1

            let imageRequestHandler = VNImageRequestHandler(
                cgImage: cgImage,
                orientation: .up
            )

            do {
                try imageRequestHandler.perform([request])
            } catch {
                continuation.resume(throwing: DetectStubMistake.cardNotDetected)
            }
        }
    }
}

private extension FoundStub {
    func followFoundedRectangle(request: VNRequest?, error: Error?) throws -> VNRectangleObservation {
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
        if let error = error {
            throw error
        }
        guard let results = request?.results,
              let observation = results.first as? VNRectangleObservation
        else {
            throw DetectStubMistake.cardNotDetected
        }
        return observation
    }

    func photoCorrected(from inputImage: CIImage, rectangleObservation: VNRectangleObservation) throws -> CIImage {
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
        let imageSize = inputImage.extent.size

        /// Verify detected rectangle is valid
        let boundingBox = rectangleObservation.boundingBox.mashtab(to: imageSize)
        guard inputImage.extent.contains(boundingBox) else {
            throw DetectStubMistake.cardNotDetected
        }

        /// Rectify the detected image and reduce it to inverted grayscale for applying model
        let topLeft = rectangleObservation.topLeft.masshtab(to: imageSize)
        let topRight = rectangleObservation.topRight.masshtab(to: imageSize)
        let bottomLeft = rectangleObservation.bottomLeft.masshtab(to: imageSize)
        let bottomRight = rectangleObservation.bottomRight.masshtab(to: imageSize)
        let correctedImage = inputImage
            .cropped(to: boundingBox)
            .applyingFilter(
                "CIPerspectiveCorrection",
                parameters: [
                    "inputTopLeft": CIVector(cgPoint: topLeft),
                    "inputTopRight": CIVector(cgPoint: topRight),
                    "inputBottomLeft": CIVector(cgPoint: bottomLeft),
                    "inputBottomRight": CIVector(cgPoint: bottomRight)
                ]
            )

        return correctedImage
    }
}
