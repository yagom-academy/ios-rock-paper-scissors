//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 이원빈 on 2022/04/18.
//

import Foundation

class RockPaperScissorsGame {
    var userNumber: String
    var computerNumber: String
    
    init(userNumber: String, computerNumber: String) {
        self.userNumber = userNumber
        self.computerNumber = computerNumber
    }
}

extension RockPaperScissorsGame {
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료: 0>:", terminator: " ")
        getUserInput()
        return
    }
    
    private func getUserInput() {
        let userInput = readLine()
        
        switch userInput {
        case "1", "2", "3":
            judgeVictory(selectedMenu: userInput)
        case "0":
            endGame()
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            printMenu()
            return
        }
    }
    
    private func judgeVictory(selectedMenu: String?) {
        
    }
    
    private func endGame() {
        print("게임 종료")
    }
}
