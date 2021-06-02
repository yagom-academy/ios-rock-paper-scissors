//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var userScissorsRockPaper: Int = 0
let youWin = "이겼습니다!", youLose = "졌습니다!", draw = "비겼습니다!", stopGame = "게임종료"

let stop = 0, scissors = 1, rock = 2, paper = 3
let scissorsRockPaper: Array<Int> = [stop,scissors,rock,paper]


func bindingUserInput() -> Int {
    while true {
        print("가위(1),바위(2),보(3)!<종료 : 0>", terminator: " : ")
        let userInput: String? = readLine()
        if let unWrappedUserInput: String = userInput, let userInputNum: Int = Int(unWrappedUserInput) {
            return userInputNum
        }
        print("잘못된 입력입니다.")
    }
}

func makeComputerOutput() -> Int{
    let output = scissorsRockPaper[Int.random(in: 1...3)]
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

func gameStart() {
    while true {
        let user = bindingUserInput()
        if 1 <= user && user <= 3  {
            userVsComputer(user: user, computer: makeComputerOutput())
        } else if user == 0 {
            print("게임종료")
            return
        } else {
            print("잘못된 입력입니다.")
        }
    }
}

print(makeComputerOutput())
