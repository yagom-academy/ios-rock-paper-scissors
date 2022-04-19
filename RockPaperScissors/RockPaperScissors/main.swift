//
//  RockPaperScissors - main.swift
//  Created by kiwi, bard.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func makeComputerChoice() -> Int {
    let computerNumber = getComputerNumber()
    return computerNumber
}

gameStart()

func gameStart() {
    printMenu()
    let userInput = inputNumber()
    switch userInput {
    case 0:
        print("게임 종료")
    case 1, 2, 3:
        printResult(input: getResult(userNumber: userInput))
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        gameStart()
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func inputNumber() -> Int {
    guard let inputNumber = readLine()?.trimmingCharacters(in: .whitespaces) else { return 4 }
    guard let number = Int(inputNumber) else { return 4 }
    return number
}

func getResult(userNumber: Int) -> Int {
    let computerNumber = makeComputerChoice()
    if computerNumber == userNumber {
        return 3
    } else if computerNumber == RockScissorsPaper.scissors && userNumber == RockScissorsPaper.rock {
        return 2
    } else if computerNumber == RockScissorsPaper.rock && userNumber == RockScissorsPaper.scissors {
        return 2
    } else if computerNumber == RockScissorsPaper.paper && userNumber == RockScissorsPaper.rock {
        return 2
    } else {
        return 1
    }
}

func printResult(input: Int) {
    switch input {
    case 1:
        print(Result.win)
        print(Result.gameOver)
    case 2:
        print(Result.lose)
        print(Result.gameOver)
    case 3:
        print(Result.draw)
        gameStart()
    default:
        break
    }
}

func getComputerNumber() -> Int {
    let computerRandomNumber = Int.random(in: Numbers.range)
    return computerRandomNumber
}

enum Numbers {
    static let range = 1...3
}

enum RockScissorsPaper {
    static let scissors = 1
    static let rock = 2
    static let paper = 3
}

enum Result {
    static let win = "이겼습니다!"
    static let lose = "졌습니다!"
    static let draw = "비겼습니다!"
    static let gameOver = "게임 종료"
}


