import Foundation

enum HandShapes: CaseIterable {
    case rock, paper, scissors
    
    var description: String {
        switch self {
        case .scissors:
            return "1"
        case .rock:
            return "2"
        case .paper:
            return "3"
        }
    }
}

func printInputGuidanceMessage() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func receiveUserInputHandShape() -> String? {
    let inputtedHandShape = readLine()?.replacingOccurrences(of: " ", with: "")
    return inputtedHandShape
}

func generatedRandomHandShape() -> String {
    if let handShape = HandShapes.allCases.randomElement()?.description {
        return handShape
    }
    return generatedRandomHandShape()
}

func compareHandShape(userHand: String, computerHand: String) {
    if userHand == computerHand {
        print("비겼습니다!")
    } else if (userHand, computerHand) == ("1", "3") ||
              (userHand, computerHand) == ("2", "1") ||
              (userHand, computerHand) == ("3", "1") {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}
