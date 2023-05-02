//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Hyungmin Lee on 2023/05/02.
//

enum Choice: Int {
    case end = 0
    case rock = 1
    case paper = 2
    case scissors = 3
}

enum Result {
    case win
    case lose
    case draw
    case invalid
}

enum Turn {
    case computer
    case user
}

enum GameType {
    case rockPaperScissors
    case mookJjiBba
}

class RockPaperScissors {
    var turn: Turn = .user
    
    private func printInputMessage(_ type: GameType) {
        let message = type == .rockPaperScissors ? "가위(1), 바위(2), 보(3)! <종료 : 0>" :
                                                "[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>"
        
        print(message, terminator: " : ")
    }
    
    private func getUserChoice(_ type: GameType) -> Choice? {
        printInputMessage(type)
        
        guard let input = readLine(), let choiceNumber = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getUserChoice(type)
        }
        
        if let choice = Choice(rawValue: choiceNumber) {
            return choice
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getUserChoice(type)
        }
    }
    
    private func checkWinner(_ userChoice: Choice) -> Result {
        guard let computerChoice = Choice(rawValue: Int.random(in: 1...3)) else { return .invalid }
        
        let resultValue = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        
        switch resultValue {
            case 0:
                return .draw
            case 1:
                return .win
            case 2:
                return .lose
            default:
                return .invalid
        }
    }
    
    private func handleResult(_ result: Result) {
        switch result {
            case .win:
                turn = .user
                print("이겼습니다!")
            case .lose:
                turn = .computer
                print("졌습니다!")
            case .draw:
                print("비겼습니다!")
            case .invalid:
                print("잘못된 결과입니다.")
        }
    }
        
    private func isMookJjiBbaGameOver() -> Bool {
        while let userChoice = getUserChoice(.mookJjiBba), userChoice != .end {
            let resultMookJjiBba = checkWinner(userChoice)
            handleResult(resultMookJjiBba)
            
            if resultMookJjiBba == .draw || resultMookJjiBba == .invalid {
                return true
            }
        }
        
        print("게임 종료")
        return true
    }

    func start() {
        while let userChoice = getUserChoice(.rockPaperScissors), userChoice != .end {
            handleResult(checkWinner(userChoice))
            
            if isMookJjiBbaGameOver() { break }
        }
        
        print("게임 종료")
    }
}
