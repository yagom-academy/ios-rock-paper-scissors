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

enum Winner: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

private func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    playGame()
}

private func playGame() {
    let userHand = inputUserHand()
        switch userHand {
        case 1, 2, 3 :
            return comparePlayerAndComputerHand(userHand: convertUserInputToHand(input: userHand), computerHand: convertComputerNumberToHand())
        case 0 :
            printExitMessage()
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
            printGameMenu()
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

private func comparePlayerAndComputerHand(userHand: Hand?, computerHand: Hand?) {
    if computerHand == .scissors && userHand == .rock || computerHand == .rock && userHand == .paper ||
        computerHand == .paper && userHand == .scissors {
        printResult(gameResult: GameResult.win)
    } else if computerHand == userHand {
        printResult(gameResult: GameResult.draw)
        printGameMenu()
    } else {
        printResult(gameResult: GameResult.lose)
    }
}

private func printResult(gameResult: GameResult) {
    switch gameResult {
    case .draw:
        print("\(GameResult.draw.rawValue)")
    case .win:
        print("\(GameResult.win.rawValue)")
        printWinner(winner: Winner.user)
    case .lose:
        print("\(GameResult.lose.rawValue)")
        printWinner(winner: Winner.computer)
    }
}

private func printExitMessage() {
    print("게임 종료")
}

func printWinner(winner: Winner) {
    switch winner {
    case .user:
        print("\(Winner.user.rawValue) 턴")
    case .computer:
        print("\(Winner.computer.rawValue) 턴")
    }
}

printGameMenu()
