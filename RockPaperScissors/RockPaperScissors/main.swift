//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 


var programRunning = true

while programRunning {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>")
    if let input: String = readLine() {
        switch input {
        case "1":
            computeGame(userInput: "1")
        case "2":
            computeGame(userInput: "2")
        case "3":
            computeGame(userInput: "3")
        case "0":
            programRunning = false
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func computeGame(userInput: String) {
    let computerNumber: Int = Int.random(in: 1...3)
    print("\(computerNumber)")
    switch computerNumber {
    case 1:
        if userInput == "1" {
            print("비겼습니다!")
        }else if userInput == "2" {
            print("이겼습니다!")
        }else {
            print("졌습니다!")
        }
    case 2:
        if userInput == "1" {
            print("졌습니다!")
        }else if userInput == "2" {
            print("비겼습니다!")
        }else {
            print("이겼습니다!")
        }
    case 3:
        if userInput == "1" {
            print("이겼습니다!")
        }else if userInput == "2" {
            print("졌습니다!")
        }else {
            print("비겼습니다!")
        }
    default:
        print("default")
    }
}
