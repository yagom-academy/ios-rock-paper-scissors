//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Message: String {
    case rockScissorsPaper = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case endOfGame = "게임 종료"
    case win = "이겼습니다!\n게임 종료"
    case defeat = "졌습니다!\n게임 종료"
    case draw = "비겼습니다!"
}

enum PunctuationMarks: String {
    case colon = " : "
    case emptyString = ""
}

func selectGameMenu() -> String {
    print(Message.rockScissorsPaper.rawValue, terminator: PunctuationMarks.colon.rawValue)
    guard let userInput = readLine() else { return PunctuationMarks.emptyString.rawValue }
    return userInput
}

func checkValidity(userInput: String) -> Int? {
    let arrayOfValidNumbers = ["0", "1", "2", "3"]
    if arrayOfValidNumbers.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print(Message.wrongInput.rawValue)
        return checkValidity(userInput: selectGameMenu())
    }
}

func startGame(userInput: String) {
    let endingNumber = "0"
    if userInput == endingNumber {
        print(Message.endOfGame.rawValue)
        return
    } else {
        decideWinner(userNumber: userInput)
    }
}

func decideWinner(userNumber: String) {
    guard let validNumber = checkValidity(userInput: userNumber) else { return }
    let numberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: numberRange)
    let number: Int = validNumber - computerNumber
    switch number {
    case 1, -2:
        print(Message.win.rawValue)
    case 2, -1:
        print(Message.defeat.rawValue)
    default:
        print(Message.draw.rawValue)
    }
}

startGame(userInput: selectGameMenu())
