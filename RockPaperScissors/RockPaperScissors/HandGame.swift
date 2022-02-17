import Foundation

struct HandGame {
    enum kinds {
        case rockPaperScissors, mukjipa
    }
    
    enum Hand: CaseIterable {
        case rock, paper, scissors, end
        
        var description: String {
            switch self {
            case .scissors:
                return "가위"
            case .rock:
                return "바위"
            case .paper:
                return "보"
            case .end:
                return "종료"
            }
        }
    }
    
    enum Players {
        case userTurn, computerTurn
        
        var description: String {
            switch self {
            case .userTurn:
                return "사용자 턴"
            case .computerTurn:
                return "컴퓨터 턴"
            }
        }
    }
    
    enum Guide {
        case rockPaperScissorsMessage, mukjipaMessage, numberOne, numberTwo, numberThree, numberZero
        
        var description: String {
            switch self {
            case .rockPaperScissorsMessage:
                return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
            case .mukjipaMessage:
                return "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
            case .numberOne:
                return "1"
            case .numberTwo:
                return "2"
            case .numberThree:
                return "3"
            case .numberZero:
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
                return "게임 종료"
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
    
    func play() {
        printInputGuidanceMessage(gameKind: .rockPaperScissors)
        let userHand = verifiedUserHand(receiveUserInputHand())
        let computerHand = generatedRandomHand()
        if isNumberZero(userInputtedValue: userHand) {
            print(HandGame.Result.endGame.description)
            return
        }
        let userGameResult = judgeUserGameResult(userHand: userHand, computerHand: computerHand)
        printGameResult(user: userGameResult)
    }
    
    func printInputGuidanceMessage(gameKind: kinds) {
        if gameKind == .rockPaperScissors {
            print(HandGame.Guide.rockPaperScissorsMessage.description, terminator: "")
        } else if gameKind == .mukjipa {
            print(HandGame.Guide.mukjipaMessage.description, terminator: "")
        }
    }
    
    func receiveUserInputHand() -> String? {
        let inputtedHand = readLine()?.replacingOccurrences(of: " ", with: "")
        return inputtedHand
    }
    
    func isNumberZero(userInputtedValue: HandGame.Hand) -> Bool {
        if userInputtedValue.description == HandGame.Hand.end.description {
            return true
        }
        return false
    }

    func verifiedUserHand(_ inputtedValue: String?) -> HandGame.Hand {
        switch inputtedValue {
        case HandGame.Guide.numberOne.description:
            return HandGame.Hand.scissors
        case HandGame.Guide.numberTwo.description:
            return HandGame.Hand.rock
        case HandGame.Guide.numberThree.description:
            return HandGame.Hand.paper
        case HandGame.Guide.numberZero.description:
            return HandGame.Hand.end
        default:
            print(HandGame.Error.wrongInput.description)
            return verifiedUserHand(receiveUserInputHand())
        }
    }

    func generatedRandomHand() -> HandGame.Hand {
        if let hand = HandGame.Hand.allCases.filter({ (hand: Hand) in
            return hand.description != HandGame.Hand.end.description})
            .randomElement() {
            return hand
        }
        return generatedRandomHand()
    }

    func judgeUserGameResult(userHand: HandGame.Hand, computerHand: HandGame.Hand) -> HandGame.Result {
        if userHand == computerHand {
            return HandGame.Result.draw
        } else if (userHand, computerHand) ==
                    (HandGame.Hand.scissors, HandGame.Hand.paper) ||
                    (userHand, computerHand) ==
                    (HandGame.Hand.rock, HandGame.Hand.scissors) ||
                    (userHand, computerHand) ==
                    (HandGame.Hand.paper, HandGame.Hand.rock) {
            return HandGame.Result.win
        } else {
            return HandGame.Result.lose
        }
    }
    //턴 알려줌
    func printRockPaperScissorsWinnerTurn(userGameResult: Result) {
        if userGameResult == .win {
            print(Players.userTurn.description, terminator: "")
        } else if userGameResult == .lose {
            print(Players.computerTurn.description, terminator: "")
        }
    }
    
    func printGameResult(user: HandGame.Result) {
        if user == .draw {
            print(HandGame.Result.draw.description)
            play()
        } else if user == .win {
            print(HandGame.Result.win.description)
            print(HandGame.Result.endGame.description)
        } else {
            print(HandGame.Result.lose.description)
            print(HandGame.Result.endGame.description)
        }
    }
}
