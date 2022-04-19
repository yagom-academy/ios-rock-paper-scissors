//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 변재은 on 2022/04/18.
//

import Foundation

protocol Runnable {
    func run()
}

final class RockPaperScissorsGame: Runnable {
    func run() {
        let selectionList: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        guard let userInputValue = selectionList.inputValue(),
              let user = ValueType(rawValue: userInputValue) else {
            restart()
            return
        }
        
        switch user {
        case .scissors, .rock, .paper :
            let result = comparison(of: createComputerNumber(), and: user).value
            exitGame(result)
        case .none :
            exitGame()
        default :
            restart()
        }
    }
}

extension RockPaperScissorsGame {
    private func exitGame(_ quote: String = "") {
        if (quote.elementsEqual("비겼습니다.!")) {
            print(quote)
            run()
        } else {
            print(quote)
            print("게임 종료")
        }
    }
    
    private func restart() {
        print("잘못된 입력입니다. 다시 시도해주세요")
        run()
    }
    
    private func createComputerNumber() -> ValueType {
        if let randomNumber = Int.random(in: 1...3) as? Int,
           let computer = ValueType(rawValue: randomNumber) {
            return computer
        } else {
            return .none
        }
    }
    
    private func comparison(of computer: ValueType?, and user: ValueType?) -> GameResult {
        switch (computer, user) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            return .lose
        case (.paper, .scissors), (.rock, .paper), (.scissors, .rock):
            return .win
        default :
            return .draw
        }
    }
}
