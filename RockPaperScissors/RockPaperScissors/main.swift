//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var userScissorsRockPaper: Int = 0
let youWin = "이겼습니다!", youLose = "졌습니다!", draw = "비겼습니다!", stopGame = "게임종료"

let scissors = 1, rock = 2, paper = 3
let scissorsRockPaper: Array<Int> = [scissors,rock,paper]

// 입력 후 바인딩
func bindingUserInput() -> Int {
    while true {
        print("가위(1),바위(2),보(3)!<종료 : 0>", terminator: " : ")
        let userInput: String? = readLine()
        switch userInput {
        case "0" :
            print("게임종료")
            break
        case "1" :
            return 1
        case "2" :
            return 2
        case "3" :
            return 3
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
//        if let unWrappedUserInput: String = userInput, let userInputNum: Int = Int(unWrappedUserInput) {
//            return userInputNum
//        }
    }
}

func makeComputerOutput() -> Int{
    let output = scissorsRockPaper[Int.random(in: 0...2)]
    return output
}

func userVsComputer(user: Int, computer: Int) {
    switch (user, computer) {
    case (scissors, scissors), (rock, rock), (paper, paper):
        print(draw)
    case (scissors, rock), (rock, paper), (paper, scissors):
        print(youLose)
    default :
        print(youWin)
    }
}
