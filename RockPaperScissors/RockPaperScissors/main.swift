
//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

let youWin = "이겼습니다!", youLose = "졌습니다!", draw = "비겼습니다!"

let stop = 0, scissors = 1, rock = 2, paper = 3
let scissorsRockPaper: Array<Int> = [stop,scissors,rock,paper]

func unWrappedUserInput(_ userInput: String?) -> Int {
    if let unWrappedUserInput: String = userInput, let userInputNum: Int = Int(unWrappedUserInput) {
        return userInputNum
    }
    return -1
}

func printMenu() -> String?{
    print("가위(1),바위(2),보(3)!<종료 : 0>", terminator: " : ")
    let userInput: String? = readLine()
    return userInput
}

func makeRandomComputerOutput() -> Int {
    return scissorsRockPaper[Int.random(in: 1...3)]
}

func judgeGame(user: Int, computer: Int) {
    switch (user, computer) {
    case (scissors, scissors), (rock, rock), (paper, paper):
        print(draw)
    case (scissors, rock), (rock, paper), (paper, scissors):
        print(youLose)
    default :
        print(youWin)
    }
}

func checkUserInput(_ bindingUserInput: Int) -> Bool{
    if 1 <= bindingUserInput && bindingUserInput <= 3 {
        judgeGame(user: bindingUserInput, computer: makeRandomComputerOutput())
    } else if bindingUserInput == 0 {
        print("게임종료")
        return false
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    return true
}


func gameStart() {
    var check = true
    repeat {
        let menu = printMenu()
        let user = unWrappedUserInput(menu)
        check = checkUserInput(user)
    } while check
}

print(makeComputerOutput())
