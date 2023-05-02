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

func checkRockPaperScissors(with userInput: String, _ computerInput: String) -> GameResult {
    switch (userInput, computerInput) {
    case (userInput, computerInput) where userInput == computerInput:
        return .draw
    case (HandSign.scissors.rawValue, HandSign.paper.rawValue),
        (HandSign.rock.rawValue, HandSign.scissors.rawValue),
        (HandSign.paper.rawValue, HandSign.rock.rawValue):
        return .win
    default:
        return .lose
    }
}
//refactor: 가위바위보 승패 결정 if문에서 switch문으로 변경
showGameMenu()
