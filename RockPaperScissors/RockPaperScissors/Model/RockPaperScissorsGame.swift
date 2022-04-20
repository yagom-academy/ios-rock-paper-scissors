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
        selectionList.printSelf()
        
        guard let userInputValue = inputValue(),
              let user = RockPaperScissors(rawValue: userInputValue) else {
            restart(as: "잘못된 입력입니다. 다시 시도해주세요")
            return
        }
        
        switch user {
        case .scissors, .rock, .paper:
            let result = comparison(of: createComputerNumber(), and: user).value
            judge(result)
        case .none:
            judge()
        }
    }
}

//MARK: RockPaperScissorsGame 클래스 내에서 사용될 함수.
extension RockPaperScissorsGame {
    private func judge(_ result: String = "") {
        if (result.elementsEqual("비겼습니다.!")) {
           restart(as: result)
        } else {
            print(result)
            print("게임 종료")
        }
    }
    
    private func inputValue() -> Int? {
        let value: String = readLine()?.replacingOccurrences(of: " ", with: "") ?? "0"
        return value.convertAsInt()
    }
    
    private func restart(as quote: String) {
        print(quote)
        run()
    }
    
    private func createComputerNumber() -> RockPaperScissors {
        let computer = RockPaperScissors(rawValue: Int.random(in: 1...3))
        return computer ?? .scissors
    }
    
    private func comparison(of computer: RockPaperScissors?, and user: RockPaperScissors?) -> GameResult {
        switch (computer, user) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            return .lose
        case (.paper, .scissors), (.rock, .paper), (.scissors, .rock):
            return .win
        default:
            return .draw
        }
    }
}
