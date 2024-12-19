import UIKit

final class GraderConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    var didSelectGrader: ((StubGradeTypesr) -> Void)?

    let card: CardMainStructureTypeData

    init(router: MainRouterOFApplication, card: CardMainStructureTypeData) {
        self.router = router
        self.card = card
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension GraderConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        var graders = card.graders
        if !graders.contains(card.selectedGrader) {
            graders.append(card.selectedGrader)
        }

        let viewController = GraderChoiceController(graders: graders)
        viewController.delegate = self
        router.beginShowingAssemblying(viewController, animated: animated, onDismissed: onDismissed)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension GraderConnector: GraderChoiceDelegat {
    func graderSelectionViewControllerreturnActionclickedPresseda(_ viewController: GraderChoiceController) {
        router.dissapearFullyFromView(animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func graderSelectionViewControllerChoosed(grader: StubGradeTypesr, in viewController: GraderChoiceController) {
        router.dissapearFullyFromView(animated: true)
        didSelectGrader?(grader)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}
