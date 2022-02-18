//
//  UserInterface.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/16.
//

import Foundation

struct UserInterface {
    func printRockPaperScissorsGameUserInterface() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :" , terminator: " ")
    }
    
    func printMukjipaGameUserInterface(currentTurn: Player) {
        let currentTurnPlayer = "\(currentTurn.rawValue) 턴"
        print("[\(currentTurnPlayer)] 묵(1), 찌(2), 빠(3)! <종료 : 0> :" , terminator: " ")
    }
    
    func printCurrentTurn(currentTurn: Player) {
        print("\(currentTurn.rawValue) 턴입니다")
    }
    
    func printGameOver() {
        print("게임 종료")
    }
    
    func printErrorMessage() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    func printRockPaperScissorsGameResut(gameResult: RockPaperScissorsGameResult) {
        print(gameResult.rawValue)
    }
    
    func printMukjipaGameWinner(currentTurn: Player) {
        print("\(currentTurn.rawValue)의 승리!")
        printGameOver()
    }
}
