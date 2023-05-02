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
    switch userInput {
    case HandSign.scissors.rawValue,
        HandSign.rock.rawValue,
        HandSign.paper.rawValue:
        showGameResult(about: checkRockPaperScissors(with: userInput, computerInput))
    default:
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

func showGameResult(about result: GameResult) {
    switch result {
    case .win:
        print("이겼습니다")
    case .lose:
        print("졌습니다")
    case .draw:
        print("비겼습니다")
    }
}

showGameMenu()
