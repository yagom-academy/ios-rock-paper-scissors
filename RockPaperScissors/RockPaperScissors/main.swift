//
//  RockPaperScissors - main.swift
//  Created by kiwi, bard.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

startGame()

func startGame() {
    printMenu()
    let userInput = inputNumber()
    switch userInput {
    case 0:
        print("게임 종료")
    case 1, 2, 3:
        printResult(input: fetchResult(userChoice: userInput))
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
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

func makeComputerChoice() -> Int {
    let computerRandomNumber = Int.random(in: Numbers.range)
    return computerRandomNumber
}

func fetchResult(userChoice: Int) -> Int {
    let computerChoice = makeComputerChoice()
    if computerChoice == userChoice {
        return 3
    } else if computerChoice == RockScissorsPaper.scissors && userChoice == RockScissorsPaper.rock {
        return 2
    } else if computerChoice == RockScissorsPaper.rock && userChoice == RockScissorsPaper.scissors {
        return 2
    } else if computerChoice == RockScissorsPaper.paper && userChoice == RockScissorsPaper.rock {
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
        startGame()
    default:
        break
    }
}
