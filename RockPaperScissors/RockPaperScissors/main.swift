//
//  RockPaperScissors - main.swift
//  Created by kiwi, bard.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

startGame()

func startGame() {
    printMenu()
    let userInput = RockScissorsPaper(rawValue: inputNumber())
    guard let rps = userInput else { return checkInputNumber()}
    switch rps {
    case .gameOver:
        print("게임 종료")
    case .scissors, .rock, .paper:
        printResult(result: fetchResult(userChoice: rps))
    }
}

func checkInputNumber() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
    startGame()
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

func fetchResult(userChoice: RockScissorsPaper) -> Result {
    let computerChoice = RockScissorsPaper(rawValue: makeComputerChoice())
    if computerChoice == userChoice {
        return .draw
    } else if computerChoice == .scissors && userChoice == .rock {
        return .lose
    } else if computerChoice == .rock && userChoice == .scissors {
        return .lose
    } else if computerChoice == .paper && userChoice == .rock {
        return .lose
    } else {
        return .win
    }
}

func printResult(result: Result) {
    switch result {
    case .win:
        print("이겼습니다!")
        print("게임 종료")
    case .lose:
        print("졌습니다!")
        print("게임 종료")
    case .draw:
        print("비겼습니다!")
        startGame()
    }
}
