//
//  RockPaperScissors - main.swift
//  Created by 애종, Mangdi.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startRockScissorsPaperGame() {
    var computerAnswer: Int
    var exitGame: Bool = false
    
    while exitGame == false {
        computerAnswer = Int.random(in: 1...3)
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let input = readLine() else {
            continue
        }
        guard let userAnswer = Int(input.replacingOccurrences(of: " ", with: "")) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        judgeWhoWins(computerAnswer: computerAnswer, userAnswer: userAnswer, exitGame: &exitGame)
    }
}

func judgeWhoWins(computerAnswer: Int, userAnswer: Int, exitGame: inout Bool) {
    switch userAnswer {
    case 0:
        print("게임 종료")
        exitGame = true
        break
    case 1:
        if computerAnswer == 1 {
            print("비겼습니다!")
        } else if computerAnswer == 2 {
            print("졌습니다!")
            exitGame = true
        } else if computerAnswer == 3 {
            print("이겼습니다!")
            exitGame = true
        }
        break
    case 2:
        if computerAnswer == 1 {
            print("이겼습니다!")
            exitGame = true
        } else if computerAnswer == 2 {
            print("비겼습니다!")
        } else if computerAnswer == 3 {
            print("졌습니다!")
            exitGame = true
        }
        break
    case 3:
        if computerAnswer == 1 {
            print("졌습니다!")
            exitGame = true
        } else if computerAnswer == 2 {
            print("이겼습니다!")
            exitGame = true
        } else if computerAnswer == 3 {
            print("비겼습니다!")
        }
        break
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        break
    }
}

startRockScissorsPaperGame()
