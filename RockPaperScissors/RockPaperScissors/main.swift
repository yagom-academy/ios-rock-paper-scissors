import Foundation

enum Hands: CaseIterable {
    case rock, paper, scissors
    
    var description: String {
        switch self {
        case .scissors:
            return "가위"
        case .rock:
            return "바위"
        case .paper:
            return "보"
        }
    }
}

enum GameGuide {
    case message
    
    var description: String {
        switch self {
        case .message:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        }
    }
}

enum GameResult {
    case win, lose, draw, endGame
    
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .endGame:
            return "게임종료"
        }
    }
}

enum GameError {
    case wrongInput
    
    var description: String {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}

func startGame() {
    printInputGuidanceMessage()
    guard let userHandShape = verifiedUserHandShape(receiveUserInputHandShape()) else {
        return
    }
    let computerHand = generatedRandomHandShape()
    if isNumberZero(input: userHandShape) {
        print(GameResult.endGame.description)
        return
    } else if userHandShape == GameError.wrongInput.description {
        startGame()
    } else {
        compareHandShape(userHand: userHandShape, computerHand: computerHand)
    }
}

func printInputGuidanceMessage() {
    print(GameGuide.message.description, terminator: "")
}

func receiveUserInputHandShape() -> String? {
    let inputtedHandShape = readLine()?.replacingOccurrences(of: " ", with: "")
    return inputtedHandShape
}

func isNumberZero(input: String) -> Bool {
    if input == "0" {
        return true
    }
    return false
}

func verifiedUserHandShape(_ input: String?) -> String? {
    switch input {
    case "1":
        return Hands.scissors.description
    case "2":
        return Hands.rock.description
    case "3":
        return Hands.paper.description
    case "0" :
        return input
    default:
        print(GameError.wrongInput.description)
        return GameError.wrongInput.description
    }
}

func generatedRandomHandShape() -> String {
    if let handShape = Hands.allCases.randomElement()?.description {
        return handShape
    }
    return generatedRandomHandShape()
}

func compareHandShape(userHand: String, computerHand: String) {
    if userHand == computerHand {
        print(GameResult.draw.description)
    } else if (userHand, computerHand) ==
                (Hands.scissors.description, Hands.paper.description) ||
                (userHand, computerHand) ==
                (Hands.rock.description, Hands.scissors.description) ||
                (userHand, computerHand) ==
                (Hands.paper.description, Hands.rock.description) {
        print(GameResult.win.description)
    } else {
        print(GameResult.lose.description)
    }
}
