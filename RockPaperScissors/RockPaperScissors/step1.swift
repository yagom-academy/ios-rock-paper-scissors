//
//  step1.swift
//  RockPaperScissors
//
//  Created by Victor on 2022/08/23.
//

import Foundation

func startRockScissorsPaperGame() {
    var computerPick: Int
    var exitGame: Bool = false

    while exitGame == false {
        computerPick = Int.random(in: 1...3)

        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")

        guard let input = readLine() else {
            continue
        }
        guard let userPick = Int(input.replacingOccurrences(of: " ", with: "")) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }

        exitGame = showGameResult(computerPick: computerPick, userPick: userPick)
    }
}

func showGameResult(computerPick: Int, userPick: Int) -> Bool {
    var exit: Bool = false
    
    if computerPick == userPick {
        print("비겼습니다!")
    }
    
    switch userPick {
    case 0:
        print("게임 종료")
        exit = true
    case 1:
        if computerPick == 2 {
            print("졌습니다!")
            exit = true
        } else if computerPick == 3 {
            print("이겼습니다!")
            exit = true
        }
    case 2:
        if computerPick == 1 {
            print("이겼습니다!")
            exit = true
        } else if computerPick == 3 {
            print("졌습니다!")
            exit = true
        }
    case 3:
        if computerPick == 1 {
            print("졌습니다!")
            exit = true
        } else if computerPick == 2 {
            print("이겼습니다!")
            exit = true
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }

    return exit
}
