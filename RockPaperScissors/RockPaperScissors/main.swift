//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.

enum Choice: Int {
    case end = 0
    case Rock = 1
    case Paper = 2
    case Scissors = 3
}

struct RockPaperScissorsGame {
    private func getUserChoice() -> Choice? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        
        guard let inputString = readLine(), let inputNumber = Int(inputString) else { return nil }
        
        return Choice(rawValue: inputNumber)
    }
    
    private func evaluateWinner(_ userChoice: Choice) {
        guard let computerChoice = Choice(rawValue: Int.random(in: 1...3)) else { return }
        let result = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        
        switch result {
            case 0:
                print("비겼습니다!")
            case 1:
                print("이겼습니다!")
            case 2:
                print("졌습니다!")
            default:
                print("잘못된 결과입니다.")
        }
    }
    
    func start() {
        while true {
            guard let userChoice = getUserChoice() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            if userChoice == .end {
                print("게임 종료")
                break
            }
            
            evaluateWinner(userChoice)
        }
    }
}

let test = RockPaperScissorsGame()
test.start()
