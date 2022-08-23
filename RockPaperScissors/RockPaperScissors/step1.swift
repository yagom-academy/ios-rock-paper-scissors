//
//  step1.swift
//  RockPaperScissors
//
//  Created by Victor on 2022/08/23.
//

import Foundation

let rockScissorsPaper: [Int:String] = [1:"가위", 2:"바위", 3:"보"]

func startRockScissorsPaperGame() {
    var computerNumber: Int
    var exitGame: Bool = false

    while exitGame == false {
        computerNumber = Int.random(in: 1...3)

        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")

        guard let input = readLine() else {
            continue
        }
        guard let userNumber = Int(input.replacingOccurrences(of: " ", with: "")) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }

        exitGame = showGameResult(computerNumber: computerNumber, userNumber: userNumber)
    }
}

func showGameResult(computerNumber: Int, userNumber: Int) -> Bool {
    var exit: Bool = true
    let selectMenu = userNumber
    let computerPick = rockScissorsPaper[computerNumber]
    let userPick = rockScissorsPaper[userNumber]
    let compareTwoThings = (컴퓨터가낸것: computerPick, 유저가낸것: userPick)
    
    if selectMenu == 0 {
        print("게임 종료")
        return exit
    } else if computerPick == userPick {
        print("비겼습니다!")
        exit = false
        return exit
    }
    
    switch compareTwoThings {
    case (컴퓨터가낸것: "가위", 유저가낸것: "바위"),
        (컴퓨터가낸것: "바위", 유저가낸것: "보"),
        (컴퓨터가낸것: "보", 유저가낸것: "가위"):
        print("이겼습니다!")
    case (컴퓨터가낸것: "가위", 유저가낸것: "보"),
        (컴퓨터가낸것: "바위", 유저가낸것: "가위"),
        (컴퓨터가낸것: "보", 유저가낸것: "바위"):
        print("졌습니다!")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        exit = false
    }

    return exit
}
