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

enum RockScissorPaper메세지 {
    static func printWin() {
        print("이겼습니다!")
        whoseTurn = true
        gameMode = false
        showMukChiBaMenu()
    }
    static func printDraw() {
        print("비겼습니다!")
        showRockScissorPaperMenu()
    }
    static func printLose() {
        print("졌습니다!")
        whoseTurn = false
        gameMode = false
        showMukChiBaMenu()
    }
    static func printError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        showRockScissorPaperMenu()
    }
}

enum MukChiBa메세지 {
    static func resumeRockScissorPaperWin() {
        if whoseTurn {
            print("사용자의 턴입니다")
            showMukChiBaMenu()
        } else {
            print("컴퓨터의 턴입니다")
            showMukChiBaMenu()
        }
    }
    static func printRockScissorPaperDraw() {
        if whoseTurn {
            print("사용자의 승리!")
            print("게임 종료")
        } else {
            print("컴퓨터의 승리!")
            print("게임 종료")
        }
    }
    static func printRockScissorPaperLose() {
        if whoseTurn {
            print("컴퓨터의 턴입니다")
            whoseTurn = false
            showMukChiBaMenu()
        } else {
            print("사용자의 턴입니다")
            whoseTurn = true
            showMukChiBaMenu()
        }
    }
    static func printError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        print("컴퓨터의 턴입니다")
        whoseTurn = false
        showMukChiBaMenu()
    }
}
    
enum 실행모음 {
    static func rockScissorPaperWin(mode: Bool) {
        if mode {
            RockScissorPaper메세지.printWin()
        } else {
            MukChiBa메세지.resumeRockScissorPaperWin()
        }
    }
    static func rockScissorPaperDraw(mode: Bool) {
        if mode {
            RockScissorPaper메세지.printDraw()
        } else {
            MukChiBa메세지.printRockScissorPaperDraw()
        }
    }
    static func rockScissorPaperLose(mode: Bool) {
        if mode {
            RockScissorPaper메세지.printLose()
        } else {
            MukChiBa메세지.printRockScissorPaperLose()
        }
    }
    static func printError(mode: Bool) {
        if mode {
            RockScissorPaper메세지.printError()
        } else {
            MukChiBa메세지.printError()
        }
    }
}

var gameMode = true
var whoseTurn = true
func showRockScissorPaperMenu() {
    print("""
가위(1), 바위(2), 보(3)! <종료 : 0> :
""", terminator: " ")
    showGameResult(
        compareRockScissorPaper(
            userOption: matchedRockScissorPaperHand(receiveNumber()),
            computerOption: matchedRockScissorPaperHand(makeRandomNumber())
        )
    )
}

func showMukChiBaMenu() {
    if whoseTurn {
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        showGameResult(
            compareMukChiBa(
                attackOption: matchedMukChiBaHand(receiveNumber()),
                defenseOption: matchedMukChiBaHand(makeRandomNumber())
            )
        )
    } else {
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        showGameResult(
            compareMukChiBa(
                attackOption: matchedMukChiBaHand(makeRandomNumber()),
                defenseOption: matchedMukChiBaHand(receiveNumber())
            )
        )
    }
}

func showGameResult(_ gameResult: GameResult) {
    switch gameResult {
    case .exit:
        print("게임 종료")
    case .win:
        실행모음.rockScissorPaperWin(mode: gameMode)
    case .draw:
        실행모음.rockScissorPaperDraw(mode: gameMode)
    case .lose:
        실행모음.rockScissorPaperLose(mode: gameMode)
    case .error:
        실행모음.printError(mode: gameMode)
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
    case (.exit, _), (_, .exit):
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
