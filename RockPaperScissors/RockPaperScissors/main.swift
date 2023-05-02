//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
// 

func showGameMenu() {
    let gameEnd: String = "0"
    
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
        
        guard let userInput: String = readLine() else { return }
        let computerInput: String = String(Int.random(in: 1...3))
        guard userInput != gameEnd else { return print("게임종료") }
        getUserInput(userInput, computerInput)
    }
}

func getUserInput(_ userInput: String, _ computerInput: String) {
    if userInput == HandSign.scissors.rawValue ||
        userInput == HandSign.rock.rawValue ||
        userInput == HandSign.paper.rawValue {
//        showGameResult(checkRockPaperScissors(with: userInput, computerInput))
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
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

showGameMenu()
