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
    init(rockScissorPaperOption: String) {
        switch rockScissorPaperOption {
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
    init(mukChiBaOption: String) {
        switch mukChiBaOption {
        case "0":
            self = .exit
        case "1":
            self = .rock
        case "2":
            self = .scissor
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

enum RockScissorPaperPrintMessage {
    static let winText = "이겼습니다!"
    static let drawText = "비겼습니다!"
    static let loseText = "졌습니다!"
    static let endText = "게임 종료"
    static let errorText = "잘못된 입력입니다. 다시 시도해주세요."
    static func printWin() {
        print(winText)
        turn = true
        showMukChiBaMenu()
    }
    static func printDraw() {
        print(drawText)
        showRockScissorPaperMenu()
    }
    static func printLose() {
        print(loseText)
        turn = false
        showMukChiBaMenu()
    }
    static func printError() {
        print(errorText)
        showRockScissorPaperMenu()
    }
}

enum MukChiBaPrintMessage {
    static let userTurnText = "사용자의 턴입니다"
    static let computerTurnText = "컴퓨터의 턴입니다"
    static let userWinText = "사용자의 승리!"
    static let computerWinText = "컴퓨터의 승리!"
    static func printRockScissorPaperWin() {
        if turn {
            print(userTurnText)
            showMukChiBaMenu()
        } else {
            print(computerTurnText)
            showMukChiBaMenu()
        }
    }
    static func printRockScissorPaperDraw() {
        if turn {
            print(userWinText)
            print(RockScissorPaperPrintMessage.endText)
        } else {
            print(computerWinText)
            print(RockScissorPaperPrintMessage.endText)
        }
    }
    static func printRockScissorPaperLose() {
        if turn {
            print(computerTurnText)
            turn = false
            showMukChiBaMenu()
        } else {
            print(userTurnText)
            turn = true
            showMukChiBaMenu()
        }
    }
    static func printError() {
        print(RockScissorPaperPrintMessage.errorText)
        print(computerTurnText)
        turn = false
        showMukChiBaMenu()
    }
}

var turn = true
func showRockScissorPaperMenu() {
    print("""
가위(1), 바위(2), 보(3)! <종료 : 0> :
""", terminator: " ")
    showRockScissorPaperResult(
        compareRockScissorPaper(
            userOption: matchedRockScissorPaperHand(receiveNumber()),
            computerOption: matchedRockScissorPaperHand(makeRandomNumber())
        )
    )
}

func showMukChiBaMenu() {
    if turn {
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        showMukChiBaResult(
            compareMukChiBa(
                attackOption: matchedMukChiBaHand(receiveNumber()),
                defenseOption: matchedMukChiBaHand(makeRandomNumber())
            )
        )
    } else {
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        showMukChiBaResult(
            compareMukChiBa(
                attackOption: matchedMukChiBaHand(makeRandomNumber()),
                defenseOption: matchedMukChiBaHand(receiveNumber())
            )
        )
    }
}

func showRockScissorPaperResult(_ gameResult: GameResult) {
    switch gameResult {
    case .exit:
        print(RockScissorPaperPrintMessage.endText)
    case .win:
        RockScissorPaperPrintMessage.printWin()
    case .draw:
        RockScissorPaperPrintMessage.printDraw()
    case .lose:
        RockScissorPaperPrintMessage.printLose()
    case .error:
        RockScissorPaperPrintMessage.printError()
    }
}

func showMukChiBaResult(_ gameResult: GameResult) {
    switch gameResult {
    case .exit:
        print(RockScissorPaperPrintMessage.endText)
    case .win:
        MukChiBaPrintMessage.printRockScissorPaperWin()
    case .draw:
        MukChiBaPrintMessage.printRockScissorPaperDraw()
    case .lose:
        MukChiBaPrintMessage.printRockScissorPaperLose()
    case .error:
        MukChiBaPrintMessage.printError()
    }
}

func compareRockScissorPaper(userOption: GameOptions, computerOption: GameOptions) -> GameResult {
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

func compareMukChiBa(attackOption: GameOptions, defenseOption: GameOptions) -> GameResult {
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

func matchedRockScissorPaperHand(_ hand: String) -> GameOptions {
    GameOptions(rockScissorPaperOption: hand)
}

func matchedMukChiBaHand(_ hand: String) -> GameOptions {
    GameOptions(mukChiBaOption: hand)
}

func receiveNumber() -> String {
    return readLine() ?? " "
}

func makeRandomNumber() -> String {
    return String(Int.random(in: 1...3))
}

showRockScissorPaperMenu()
