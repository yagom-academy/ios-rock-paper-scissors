//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 


var programRunning = true

while programRunning {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    if let input: String = readLine() {
        switch input {
        case "1":
            computeGame(userInput: 1)
        case "2":
            computeGame(userInput: 2)
        case "3":
            computeGame(userInput: 3)
        case "0":
            programRunning = false
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func computeGame(userInput: Int) {
    let computerNumber: Int = Int.random(in: 1...3)
    if userInput == computerNumber {
        print("비겼습니다!")
    } else if (userInput == 1 && computerNumber == 3)
                 || (userInput == 2 && computerNumber == 1)
                 || (userInput == 3 && computerNumber == 2) {
        print("이겼습니다!")
        return
    } else {
        print("졌습니다!")
        return
    }
}
