//
//  Main.swift
//  RockPaperScissors
//
//  Created by 잼킹 on 2021/03/03.
//

import Foundation

enum resultNumber: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

class RockPaperScissorsGame {
 
    var userInputNumber: resultNumber?
    
    // 게임 결과
    func gameResult(user: resultNumber, computer: Int) {
        if user.rawValue == computer {
            print("비겼습니다!")
            startGame()
        }
        
        switch user {
        case .scissors:
            if computer == 3 {
                print("이겼습니다!")
            } else if computer == 2 {
                print("졌습니다 ㅜㅜ")
            }
        case .rock:
            if computer == 1 {
                print("이겼습니다!")
            } else if computer == 3 {
                print("졌습니다 ㅜㅜ")
            }
        case .paper:
            if computer == 2 {
                print("이겼습니다!")
            } else if computer == 1 {
                print("졌습니다 ㅜㅜ")
            }
        }
        
    }
    
    func startGame() {
        print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator: "")
        let computerValue = Int.random(in: 1...3)
        let input = readLine()
        
        if input == "0" {
            print("게임 종료")
            return
        } else if input == "1" {
            userInputNumber = .scissors
        } else if input == "2" {
            userInputNumber = .rock
        } else if input == "3" {
            userInputNumber = .paper
        } else {
            print("잘못된 입력입니다. 다시 시도해 주세요.")
            startGame()
            return
        }
        
        gameResult(user: userInputNumber!, computer: computerValue)
    }
    
}

let rockPaperSissorsGame = RockPaperScissorsGame()
rockPaperSissorsGame.startGame()
