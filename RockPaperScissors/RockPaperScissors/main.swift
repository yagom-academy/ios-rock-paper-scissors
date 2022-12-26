//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RSP: Int {
    case exit
    case scissors
    case rock
    case paper
}

enum GameResult: String {
    case draw = "비겼습니다!"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func receiveUserInput() -> String {
    guard let input = readLine() else { return "" }
    return input
}

func printGameResult(gameResult: GameResult) {
    print(gameResult.rawValue)
}

func play() {
    printMenu()
}
