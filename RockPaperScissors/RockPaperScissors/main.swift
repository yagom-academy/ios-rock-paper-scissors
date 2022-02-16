import Foundation
struct HandGame {
    enum Shapes: CaseIterable, Equatable {
        case rock, paper, scissors
        // zero를 넣었더니 generated임의의수 생성할떄도 같이 섞여서 오류남
        
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
    
    enum Guide: Equatable {
        case message, one, two, three, zero
        
        var description: String {
            switch self {
            case .message:
                return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
            case .one:
                return "1"
            case .two:
                return "2"
            case .three:
                return "3"
            case .zero:
                return "0"
            }
        }
    }
    
    enum Result {
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
    
    enum Error {
        case wrongInput
        
        var description: String {
            switch self {
            case .wrongInput:
                return "잘못된 입력입니다. 다시 시도해주세요."
            }
        }
    }
}
func startGame() {
    printInputGuidanceMessage()
    let userHandShape = verifiedUserHandShape(receiveUserInputHandShape())
    let computerHand = generatedRandomHandShape()
    if isNumberZero(input: userHandShape) {
        print(HandGame.Result.endGame.description)
        return
    } else if userHandShape.description == HandGame.Guide.zero.description {
        startGame()
    } else {
        compareHandShape(userHand: userHandShape, computerHand: computerHand)
    }
}

func printInputGuidanceMessage() {
    print(HandGame.Guide.message.description, terminator: "")
}

func receiveUserInputHandShape() -> String? {
    let inputtedHandShape = readLine()?.replacingOccurrences(of: " ", with: "")
    return inputtedHandShape
}

func isNumberZero(input: HandGame.Shapes) -> Bool {
    if input.description == HandGame.Guide.zero.description {
        return true
    }
    return false
}

func verifiedUserHandShape(_ input: String?) -> HandGame.Shapes {
    switch input {
    case "1":
        return HandGame.Shapes.scissors
    case "2":
        return HandGame.Shapes.rock
    case "3":
        return HandGame.Shapes.paper
    case "0" :
        return HandGame.Guide.zero // 매개변수 안받고, 재귀함수로 진행하면 가능할수도?
    default:
        print(HandGame.Error.wrongInput.description)
        return HandGame.Shapes.zero // 매개변수 안받고, 재귀함수로 진행하면 가능할수도?
    }
}

func generatedRandomHandShape() -> HandGame.Shapes {
    if let handShape = HandGame.Shapes.allCases.randomElement() {
        return handShape
    }
    return generatedRandomHandShape()
}

func compareHandShape(userHand: HandGame.Shapes, computerHand: HandGame.Shapes) {
    if userHand == computerHand {
        print(HandGame.Result.draw.description)
        startGame()
    } else if (userHand, computerHand) ==
                (HandGame.Shapes.scissors, HandGame.Shapes.paper) ||
                (userHand, computerHand) ==
                (HandGame.Shapes.rock, HandGame.Shapes.scissors) ||
                (userHand, computerHand) ==
                (HandGame.Shapes.paper, HandGame.Shapes.rock) {
        print(HandGame.Result.win.description)
        print(HandGame.Result.endGame.description)
        return
    } else {
        print(HandGame.Result.lose.description)
        print(HandGame.Result.endGame.description)
        return
    }
}
startGame()
