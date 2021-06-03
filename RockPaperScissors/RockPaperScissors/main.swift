//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let gameResultTable: Array<Array<GameResult>> = [
    [.draw, .computerWin, .userWin],
    [.userWin, .draw, .computerWin],
    [.computerWin, .userWin, .draw]
]

func generateComputerCard() -> Int {
    Int.random(in: 1...3)
}

func receiveInputFromUser() -> String? {
    readLine()
}

func receiveAndCheckUserInput() -> Int? {
    guard let userInput = receiveInputFromUser(), let userCard = Int(userInput), userCard <= 3 && userCard >= 0 else {
        return nil
    }
    return userCard
}

func receiveAndValidateUserInput() -> Int {
    print(GameMessages.rockPaperScissorsMessage, terminator: GameMessages.noTerminator)
    guard let userCard = receiveAndCheckUserInput() else {
        print(GameMessages.wrongInputMessage)
        return receiveAndValidateUserInput()
    }
    return userCard
}

func judgeGameResult(computerCard: Int, userCard: Int) -> GameResult {
    let offset = 1
    return gameResultTable[userCard - offset][computerCard - offset]
}

func gameStart() {
    let userHand = receiveAndValidateUserInput()
    if userHand == 0 {
        print(GameMessages.endMessage)
        return
    }
    let computerHand = generateComputerCard()

    let gameResult = judgeGameResult(computerCard: computerHand, userCard: userHand)
    print(gameResult.rawValue)
    gameStart()
}

enum GameMessages {
    static let rockPaperScissorsMessage = "가위(1), 바위(2), 보(3)! <종료 : 0>: "
    static let wrongInputMessage = "잘못된 입력입니다. 다시 시도해주세요."
    static let noTerminator = ""
    static let endMessage = "게임 종료"
}

enum GameResult: String {
    case userWin = "이겼습니다!"
    case computerWin = "졌습니다!"
    case draw = "비겼습니다!"
}

gameStart()
