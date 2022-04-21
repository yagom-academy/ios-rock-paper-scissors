//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameResult: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!" 
    case lose = "졌습니다!"
}

enum Hand: Int {
    case scissors = 1
    case rock
    case paper
}

struct Turn {
    var winner: String = ""
    
    mutating func inputWinner(winner: String) {
        self.winner = winner
    }
}

var turn = Turn()

private func printGameMenu(game: String) {
    switch game {
    case "rockpaperscissors":
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        playRockPaperScissors()
    case "mookjjibba":
        print("[\(turn.winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
        playMookjjibba()
    default:
        break
    }
}

private func playRockPaperScissors() {
    let userHand = inputUserHand()
    switch userHand {
    case 1, 2, 3 :
        comparePlayerAndComputerRockPaperScissors(userHand: convertUserInputToHand(input: userHand), computerHand: convertComputerNumberToHand())
    case 0 :
        printExitMessage()
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        printGameMenu(game: "rockpaperscissors")
    }
}

private func inputUserHand() -> Int {
    guard let convertedInput = Int(readLine() ?? "") else { return 4 }
    return convertedInput
}

private func convertUserInputToHand(input: Int) -> Hand? {
    return Hand(rawValue: input)
}

private func convertComputerNumberToHand() -> Hand? {
    return Hand(rawValue: Int.random(in: 1...3))
}

private func comparePlayerAndComputerRockPaperScissors(userHand: Hand?, computerHand: Hand?) {
    if computerHand == .scissors && userHand == .rock || computerHand == .rock && userHand == .paper ||
        computerHand == .paper && userHand == .scissors {
        printResultAndGameMenu(gameResult: GameResult.win, winner: "사용자")
    } else if computerHand == userHand {
        printResultAndGameMenu(gameResult: GameResult.draw)
    } else {
        printResultAndGameMenu(gameResult: GameResult.lose, winner: "컴퓨터")
    }
}

private func printResultAndGameMenu(gameResult: GameResult, winner: String = "") {
    if gameResult == GameResult.win || gameResult == GameResult.lose {
        turn.inputWinner(winner: winner)
        printResult(gameResult: gameResult)
        printGameMenu(game: "mookjjibba")
        playMookjjibba()
    } else {
        printResult(gameResult: gameResult)
        printGameMenu(game: "rockpaperscissors")
    }
}

private func printResult(gameResult: GameResult) {
    switch gameResult {
    case .draw:
        print("\(GameResult.draw.rawValue)")
    case .win:
        print("\(GameResult.win.rawValue)")
    case .lose:
        print("\(GameResult.lose.rawValue)")
    }
}

private func printExitMessage() {
    print("게임 종료")
}

private func playMookjjibba() {
    let userHand = inputUserHand()
    switch userHand {
    case 1, 2, 3 :
        comparePlayerAndComputerMookjjibba(userHand: convertUserInputToHand(input: userHand), computerHand: convertComputerNumberToHand())
    case 0 :
        printExitMessage()
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        turn.inputWinner(winner: "컴퓨터")
        printGameMenu(game: "mookjjibba")
    }
}

private func comparePlayerAndComputerMookjjibba(userHand: Hand?, computerHand: Hand?) {
    if computerHand == .rock && userHand == .scissors || computerHand == .scissors && userHand == .paper ||
        computerHand == .paper && userHand == .rock {
        print("사용자의 턴입니다")
        changeTurn(winner: "사용자")
    } else if computerHand == userHand {
        print("\(turn.winner)의 승리!")
    } else {
        print("컴퓨터의 턴입니다")
        changeTurn(winner: "컴퓨터")
    }
}

private func changeTurn(winner: String) {
    turn.inputWinner(winner: winner)
    printGameMenu(game: "mookjjibba")
    playMookjjibba()
}

printGameMenu(game: "rockpaperscissors")
