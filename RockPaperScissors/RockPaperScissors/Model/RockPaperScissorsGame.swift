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
        
        switch userInputValue {
        case 1, 2, 3 :
          break
        case 0 :
            print("게임 종료")
        default :
            restart()
        }
    }
}

extension RockPaperScissorsGame {
    private func restart() {
        print("잘못된 입력입니다. 다시 시도해주세요")
        run()
    }
}
