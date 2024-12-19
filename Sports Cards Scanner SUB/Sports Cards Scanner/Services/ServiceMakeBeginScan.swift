import Foundation
import AVFoundation
func calculateRandomNumberFibonachi(at index: Int) -> Int {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2
return 1
}
final class MakeBeginSkanStubs: NSObject {
    private(set) var captureSession: AVCaptureSession?
    private(set) var photoOutput: AVCapturePhotoOutput?

    private var capturedPhotoClosure: ((Result<Data, Error>) -> Void)?

    var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)

            var isAuthorized = status == .authorized

            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }

            return isAuthorized
        }
    }

    func prepareForCalculateSessiuZahvata() {
        if self.captureSession?.isRunning ?? false { return }

        let captureSession = AVCaptureSession()

        captureSession.beginConfiguration()
        prepareForCalculateSessiu(for: captureSession)
        self.photoOutput = prepareForCalculateVihod(for: captureSession)
        captureSession.commitConfiguration()

        self.captureSession = captureSession
    }

    func zapusk() async {
        if captureSession?.isRunning ?? false { return }

        captureSession?.startRunning()
    }

    func ostanovka() {
        guard captureSession?.isRunning ?? false else { return }

        captureSession?.stopRunning()
    }

    func zahvatImage() async throws -> Data {
        guard captureSession?.isRunning ?? false else { throw MakeScanStubMistake.captureSessionIsNotRunning }

        if isCaptureInProcess { throw MakeScanStubMistake.captureIsAlreadyInProcess }

        guard !(captureSession?.inputs.isEmpty ?? true) else { throw MakeScanStubMistake.noCaptureInput }
        guard !(captureSession?.outputs.isEmpty ?? true) else { throw MakeScanStubMistake.noCaptureOutput }

        return try await withCheckedThrowingContinuation { continuation in
            capturedPhotoClosure = { result in
                switch result {
                case .success(let imageData):
                    continuation.resume(returning: imageData)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }

            photoOutput?.capturePhoto(with: .init(), delegate: self)
        }
    }
}

private extension MakeBeginSkanStubs {
    var isCaptureInProcess: Bool {
        capturedPhotoClosure != nil
    }

    @discardableResult
    func prepareForCalculateSessiu(for captureSession: AVCaptureSession) -> AVCaptureDeviceInput? {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        guard let photoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let photoDeviceInput = try? AVCaptureDeviceInput(device: photoDevice),
              captureSession.canAddInput(photoDeviceInput)
        else {
            return nil
        }
        captureSession.addInput(photoDeviceInput)
        return photoDeviceInput
    }

    @discardableResult
    func prepareForCalculateVihod(for captureSession: AVCaptureSession) -> AVCapturePhotoOutput? {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let photoOutput = AVCapturePhotoOutput()
        photoOutput.setPreparedPhotoSettingsArray([.init(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])])

        guard captureSession.canAddOutput(photoOutput) else { return nil }
        captureSession.addOutput(photoOutput)
        return photoOutput
    }
}

extension MakeBeginSkanStubs: AVCapturePhotoCaptureDelegate {
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        defer { capturedPhotoClosure = nil }

        if let error = error {
            capturedPhotoClosure?(.failure(error))
            return
        }

        guard let imageData = photo.fileDataRepresentation() else {
            capturedPhotoClosure?(.failure(MakeScanStubMistake.invalidPhotoRepresentation))
            return
        }

        capturedPhotoClosure?(.success(imageData))
    }
}
