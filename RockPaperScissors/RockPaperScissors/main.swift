//
//  RockPaperScissors - main.swift
//  Created by yy-ss99, Hemg.
//  Copyright © yagom academy. All rights reserved.
// 

func showGameMune() {
    var isGameOn: Bool = true
    let gameEnd: String = "0"
    
    while isGameOn {
        print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
        
        guard let userNumber: String = readLine() else { return }
        let computerNumber: String = String(Int.random(in: 1...3))

        if userNumber == gameEnd {
            isGameOn = false
            print("게임종료")
        } else if userNumber == "1" ||
                    userNumber == "2" ||
                    userNumber == "3" {
            checkRockPaperScissors(with: userNumber, computerNumber)
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func checkRockPaperScissors(with userInput: String, _ computerInput: String) {
    if userInput == computerInput {
        print("비겼습니다!")
    } else if userInput == "1" && computerInput == "3" ||
                userInput == "2" && computerInput == "1" ||
                userInput == "3" && computerInput == "2" {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

showGameMune()
