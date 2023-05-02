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
        
        guard let input = readLine(), let choiceNumber = Int(input) else { return nil }
        
        return Choice(rawValue: choiceNumber)
    }
    
    private func checkWinner(_ userChoice: Choice) -> Result {
        guard let computerChoice = Choice(rawValue: Int.random(in: 1...3)) else { return .invalid }
        
        let resultValue = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        let result: Result
        
        switch resultValue {
            case 0:
                result = .draw
            case 1:
                result = .win
            case 2:
                result = .lose
            default:
                result = .invalid
        }
        
        return result
    }
    
    private func isMookJjiBbaGameOver() -> Bool {
        while true {
            guard let userChoice = getUserChoice(.mookJjiBba) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                turn = .computer
                continue
            }
            
            if userChoice == .end {
                print("게임 종료")
                return true
            }
            
            let resultMookJjiBba = checkWinner(userChoice)
            
            switch resultMookJjiBba {
            case .win:
                turn = .user
            case .lose:
                turn = .computer
            case .draw, .invalid:
                if turn == .user {
                    print("사용자의 승리!")
                }
                else {
                    print("컴퓨터의 승리!")
                }
                return true
            }
        }
    }
    
    func start() {
        while true {
            guard let userChoice = getUserChoice(.rockPaperScissors) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            if userChoice == .end {
                print("게임 종료")
                break
            }
            
            let result = checkWinner(userChoice)
            
            switch result {
                case .win:
                    turn = .user
                    print("이겼습니다!")
                case .lose:
                    turn = .computer
                    print("졌습니다!")
                case .draw, .invalid:
                    continue
            }
            
            // mookJjiBba
            if isMookJjiBbaGameOver() {
                break
            }
        }
    }
}
