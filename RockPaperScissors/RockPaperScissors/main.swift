//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum StartAndEndMessage {
    static let startOfGame = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    static let endOfGame = "게임 종료"
}

enum ErrorMessage {
    static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
}

enum GameResultMessage {
    static let win = "이겼습니다!\n게임 종료"
    static let defeat = "졌습니다!\n게임 종료"
    static let draw = "비겼습니다!"
}

enum PunctuationMarks {
    static let colon = " : "
    static let emptyString = ""
}

func selectGameMenu() -> String {
    print(StartAndEndMessage.startOfGame, terminator: PunctuationMarks.colon)
    guard let userInput = readLine() else { return PunctuationMarks.emptyString }
    return userInput
}

func checkValidity(_ userInput: String) -> Int? {
    let validNumbersForGame = ["0", "1", "2", "3"]
    if validNumbersForGame.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print(ErrorMessage.wrongInput)
        return checkValidity(selectGameMenu())
    }
}

func startGame(userInput: String) {
    let endingNumber = "0"
    if userInput == endingNumber {
        print(StartAndEndMessage.endOfGame)
        return
    } else {
        decideWinner(userNumber: userInput)
    }
}

func decideWinner(userNumber: String) {
    guard let validNumber = checkValidity(userNumber) else { return }
    let allowedNumberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: allowedNumberRange)
    let numberToDecideWinner: Int = validNumber - computerNumber
    switch numberToDecideWinner {
    case 1, -2:
        print(GameResultMessage.win)
    case 2, -1:
        print(GameResultMessage.defeat)
    default:
        print(GameResultMessage.draw)
    }
}

startGame(userInput: selectGameMenu())
