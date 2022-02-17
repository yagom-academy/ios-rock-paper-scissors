//
//  RockPaperScissors - main.swift
//  Created by Doogie, Eddy
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var turn = true
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

enum StepOneResultTexts {
    static let winText = "이겼습니다!"
    static let drawText = "비겼습니다!"
    static let loseText = "졌습니다!"
    static let endText = "게임 종료"
    static let errorText = "잘못된 입력입니다. 다시 시도해주세요."
    static func printWin() {
        print(winText)
        turn = true
        showStepTwoMenu()
    }
    static func printDraw() {
        print(drawText)
        showStepOneMenu()
    }
    static func printlose() {
        print(loseText)
        turn = false
        showStepTwoMenu()
    }
    static func printEnd() {
        print(endText)
    }
    static func printError() {
        print(errorText)
        showStepOneMenu()
    }
}

enum StepTwoResultTexts {
    static let userTurnText = "사용자의 턴입니다"
    static let computerTurnText = "컴퓨터의 턴입니다"
    static let userWinText = "사용자의 승리!"
    static let computerWinText = "컴퓨터의 승리!"
    
    static func printStepOneWin() {
        if turn {
            print(userTurnText)
            showStepTwoMenu()
        } else {
            print(computerTurnText)
            showStepTwoMenu()
        }
    }
    static func printStepOneDraw() {
        if turn {
            print(userWinText)
            StepOneResultTexts.printEnd()
        } else {
            print(computerWinText)
            StepOneResultTexts.printEnd()
        }
    }
    static func printStepOneLose() {
        if turn {
            print(computerTurnText)
            turn = false
            showStepTwoMenu()
        } else {
            print(userTurnText)
            turn = true
            showStepTwoMenu()
        }
    }
    static func printError() {
        print(StepOneResultTexts.errorText)
        turn = false
        showStepTwoMenu()
    }
}

func showStepOneMenu() {
    print("""
가위(1), 바위(2), 보(3)! <종료 : 0> :
""", terminator: " ")
    showStepOneResult(compareStepOne(userOption: matchedHand(receiveNumber()), computerOption: matchedHand(makeRandomNumber())))
}

func showStepTwoMenu() {
    if turn {
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        showStepTwoResult(compareStepTwo(attackOption: matchedHand(receiveNumber()), defenseOption: matchedHand(makeRandomNumber())))
    } else {
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        showStepTwoResult(compareStepTwo(attackOption: matchedHand(makeRandomNumber()), defenseOption: matchedHand(receiveNumber())))
    }
}

func showStepOneResult(_ gameResult: GameResult) {
    switch gameResult {
    case .win:
        StepOneResultTexts.printWin()
    case .draw:
        StepOneResultTexts.printDraw()
    case .lose:
        StepOneResultTexts.printlose()
    case .exit:
        StepOneResultTexts.printEnd()
    case .error:
        StepOneResultTexts.printError()
    }
}

func showStepTwoResult(_ gameResult: GameResult) {
    switch gameResult {
    case .exit:
        StepOneResultTexts.printEnd()
    case .win:
        StepTwoResultTexts.printStepOneWin()
    case .draw:
        StepTwoResultTexts.printStepOneDraw()
    case .lose:
        StepTwoResultTexts.printStepOneLose()
    case .error:
        StepOneResultTexts.printError()
    }
}

func compareStepOne(userOption: GameOptions, computerOption: GameOptions) -> GameResult {
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

func compareStepTwo(attackOption: GameOptions, defenseOption: GameOptions) -> GameResult {
    switch (attackOption, defenseOption) {
    case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
        return .draw
    case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
        return .win
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

showStepOneMenu()
