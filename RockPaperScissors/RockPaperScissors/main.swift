//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameResult {
    case draw
    case win
    case lose
}

func gameRun() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    let userInput = readLine()
    
    if let safeUserInput = userInput {
        //
        if(safeUserInput == "0") {
            print("게임 종료")
            return
        }
        
        let computerChoice = makeComputerChoice()
        
        switch (safeUserInput, computerChoice) {
        case (_, _) where safeUserInput == computerChoice:
            print("비겼습니다!")
        case ("1", "3"), ("2", "1"), ("3", "2"):
            print("이겼습니다")
        default:
            print("졌습니다.")
        }
    } else{
        print("잘못된 입력입니다. 다시 시도하여 주세요.")
    }
}

//func showResult(userInput: String) {
//    let gameResult = makeComputerChoice(userInput: userInput)
//    switch gameResult {
//    case .draw:
//        print("비겼습니다!")
//    case .win:
//        print("이겼습니다!")
//    case .lose:
//        print("졌습니다.")
//    default:
//        return
//    }
//}

func makeComputerChoice() -> String {
    let computerChoice = String(Int.random(in: 1...3))
    return String(computerChoice)
}


gameRun()
