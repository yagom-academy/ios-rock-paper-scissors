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

func generateComputerCard() -> Int? {
    RockPaperScissors.allCases.randomElement()?.extractValue()
}

func receiveInputFromUser() -> String? {
    readLine()
}

func receiveAndCheckUserInput() -> Int? {
    guard let userInput = receiveInputFromUser(), let userCard = Int(userInput), RockPaperScissors.isExist(userCard) && userCard == GameSettingValues.exitCondition else {
        return nil
    }
    return userCard
}

func printGameMessage(of message: String, end: String = "\n") {
    print(message, terminator: end)
}

func printGameResult(of result: String) {
    print(result)
}

func receiveAndValidateUserInput() -> Int {
    printGameMessage(of: GameMessages.rockPaperScissorsMessage, end: GameMessages.noTerminator)
    guard let userCard = receiveAndCheckUserInput() else {
        printGameMessage(of: GameMessages.wrongInputMessage)
        return receiveAndValidateUserInput()
    }
    return userCard
}

func judgeGameResult(computerCard: Int, userCard: Int) -> GameResult {
    let offset = GameSettingValues.correctingOffset
    return gameResultTable[userCard - offset][computerCard - offset]
}

func gameStart() {
    let userHand = receiveAndValidateUserInput()
    if userHand == GameSettingValues.exitCondition {
        printGameResult(of: GameMessages.endMessage)
        return
    }
    guard let computerHand = generateComputerCard() else {
        return
    }

    let gameResult = judgeGameResult(computerCard: computerHand, userCard: userHand)
    printGameResult(of: gameResult.rawValue)
    gameStart()
}

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1, rock, paper
    
    func extractValue() -> Int {
        self.rawValue
    }
    static func isExist(_ value: Int) -> Bool {
        RockPaperScissors(rawValue: value) != nil
    }
}

enum GameSettingValues {
    static let exitCondition = 0
    static let correctingOffset = RockPaperScissors.scissors.extractValue()
}

enum GameMessages {
    static let rockPaperScissorsMessage = "가위(\(RockPaperScissors.scissors.extractValue())), 바위(\(RockPaperScissors.rock.extractValue())), 보(\(RockPaperScissors.paper.extractValue()))! <종료 : \(GameSettingValues.exitCondition)>: "
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
