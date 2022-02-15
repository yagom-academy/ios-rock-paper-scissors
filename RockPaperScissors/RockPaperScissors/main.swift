import Foundation

enum HandShapes: CaseIterable {
    case rock, paper, scissors
}

func printInputGuidanceMessage() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func receiveUserInputHandShape() -> String? {
    let inputtedHandShape = readLine()?.replacingOccurrences(of: " ", with: "")
    return inputtedHandShape
}

func generatedRandomHandShape() -> HandShapes {
    if let handShape = HandShapes.allCases.randomElement() {
        return handShape
    }
    return generatedRandomHandShape()
}


