//
//  RockPaperScissors - main.swift
//  Created by Doogie, Eddy
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum GameValue {
    case exit
    case scissor
    case rock
    case paper
    case error
}

enum GameResult {
    case exit
    case win
    case draw
    case lose
    case error
}

func showMenu() {
    print("""
가위(1), 바위(2), 보(3)! <종료 : 0> :
""", terminator: " ")
    showResult(gameResult: compareValues(userValue: matchedValue(value: receiveNumber()), computerValue: matchedValue(value: makeRandomNumber())))
}

func showResult(gameResult: GameResult) {
    switch gameResult {
    case .win:
        print("이겼습니다!")
        print("게임 종료")
    case .draw:
        print("비겼습니다!")
        showMenu()
    case .lose:
        print("졌습니다!")
        print("게임 종료")
    case .exit:
        print("게임 종료")
    case .error:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        showMenu()
    }
}

func compareValues(userValue: GameValue, computerValue: GameValue) -> GameResult {
    switch (userValue, computerValue) {
    case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
        return .win
    case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
        return .draw
    case (.paper, .scissor), (.scissor, .rock), (.rock, .paper):
        return .lose
    case (.exit, _):
        return .exit
    default:
        return .error
    }
}

func matchedValue(value: String) -> GameValue {
    switch value {
    case "0":
        return .exit
    case "1":
        return .scissor
    case "2":
        return .rock
    case "3":
        return .paper
    default:
        return .error
    }
}

func receiveNumber() -> String {
    guard let inputNumber = readLine() else { return " " }
    return inputNumber
}

func makeRandomNumber() -> String {
    return String(Int.random(in: 1...3))
}

showMenu()
