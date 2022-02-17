//
//  RockPaperScissors - main.swift
//  Created by Doogie, Eddy
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum GameOptions {
    case exit
    case scissor
    case rock
    case paper
    case error
    init(option: String) {
        switch option {
        case "0":
            self = .exit
        case "1":
            self = .scissor
        case "2":
            self = .rock
        case "3":
            self = .paper
        default:
            self = .error
        }
    }
}

enum GameResult {
    case exit
    case win
    case draw
    case lose
    case error
}

enum ResultTexts {
    static let winText = "이겼습니다!"
    static let drawText = "비겼습니다!"
    static let loseText = "졌습니다!"
    static let endText = "게임 종료"
    static let errorText = "잘못된 입력입니다. 다시 시도해주세요."
    static func printWin() {
        print(winText)
        print(endText)
    }
    static func printDraw() {
        print(drawText)
        showMenu()
    }
    static func printlose() {
        print(loseText)
        print(endText)
    }
    static func printEnd() {
        print(endText)
    }
    static func printError() {
        print(errorText)
        showMenu()
    }
}

func showMenu() {
    print("""
가위(1), 바위(2), 보(3)! <종료 : 0> :
""", terminator: " ")
    showResult(compare(userOption: matchedHand(receiveNumber()), computerOption: matchedHand(makeRandomNumber())))
}

func showResult(_ gameResult: GameResult) {
    switch gameResult {
    case .win:
        ResultTexts.printWin()
    case .draw:
        ResultTexts.printDraw()
    case .lose:
        ResultTexts.printlose()
    case .exit:
        ResultTexts.printEnd()
    case .error:
        ResultTexts.printError()
    }
}

func compare(userOption: GameOptions, computerOption: GameOptions) -> GameResult {
    switch (userOption, computerOption) {
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

func matchedHand(_ hand: String) -> GameOptions {
    GameOptions(option: hand)
}

func receiveNumber() -> String {
    return readLine() ?? " "
}

func makeRandomNumber() -> String {
    return String(Int.random(in: 1...3))
}

showMenu()
