//
//  startMenu.swift
//  RockPaperScissors
//
//  Created by 김영훈 on 2022/02/16.
//

import Foundation

var computerRockScissorsPaper: ClosedRange<Int> = 1...3


func compare(userInput: String?) {
    let computerCard = Int.random(in: computerRockScissorsPaper)
    
    guard let userInput = userInput else {
        return
    }

    if computerCard == Int(userInput) {
        print("비겼습니다!")
    }
    if computerCard == 1 && Int(userInput) == 2 {
        print("이겼습니다!")
    }
    if computerCard == 1 && Int(userInput) == 3 {
        print("졌습니다!")
    }
    if computerCard == 2 && Int(userInput) == 3 {
        print("이겼습니다!")
    }
    if computerCard == 3 && Int(userInput) == 1 {
        print("이겼습니다!")
    }
    if computerCard == 2 && Int(userInput) == 1 {
        print("졌습니다!")
    }
    if computerCard == 3 && Int(userInput) == 2 {
        print("졌습니다!")
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    let userInput = readLine()
    
    switch userInput {
    case "1","2","3":
        compare(userInput: userInput)
    case "0":
        print("종료되었습니다.")
    default:
        print("입력이 잘못되었습니다.")
    }
}

