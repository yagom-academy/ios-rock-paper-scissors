//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum StartAndEndMessage {
    static let startOfFirstGame = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    static let startOfSecondGame = "묵(1), 찌(2), 빠(3)! <종료 : 0>"
    static let endOfGame = "게임 종료"
}

enum ErrorMessage {
    static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
}

enum GameResultMessage {
    static let win = "이겼습니다!"
    static let defeat = "졌습니다!"
    static let draw = "비겼습니다!"
}

enum PunctuationMarks {
    static let colon = " : "
    static let emptyString = ""
}

enum Decision {
    static let winNumber = [1, -2]
    static let defeatNumber = [2, -1]
}

func selectFirstGameMenu() -> String {
    print(StartAndEndMessage.startOfFirstGame, terminator: PunctuationMarks.colon)
    guard let userInput = readLine() else { return PunctuationMarks.emptyString }
    return userInput
}

func selectSecondGameMenu() -> String {
    print(StartAndEndMessage.startOfSecondGame, terminator: PunctuationMarks.colon)
    guard let userInput = readLine() else { return PunctuationMarks.emptyString }
    return userInput
}

func checkValidity(of userInput: String) -> Int? {
    let validNumbersForGame = ["0", "1", "2", "3"]
    if validNumbersForGame.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print(ErrorMessage.wrongInput)
        startFirstGame(selectFirstGameMenu())
        return nil
    }
}

func checkValidity2(of userInput: String) -> Int? {
    let validNumbersForGame = ["0", "1", "2", "3"]
    if validNumbersForGame.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print(ErrorMessage.wrongInput)
        startSecondGame(selectSecondGameMenu())
        return nil
    }
}

func startFirstGame(_ userInput: String) {
    let endingNumber = 0
    guard let validNumber = checkValidity(of: userInput) else { return }
    if validNumber == endingNumber {
        print(StartAndEndMessage.endOfGame)
        return
    } else {
        decideFirstWinner(validNumber)
    }
}

func decideFirstWinner(_ validNumber: Int) -> Bool {
    let allowedNumberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: allowedNumberRange)
    let numberToDecideWinner: Int = validNumber - computerNumber
    var turnOfUser: Bool = true
    switch numberToDecideWinner {
    case Decision.winNumber[0], Decision.winNumber[1]:
        print(GameResultMessage.win)
        turnOfUser = true
    case Decision.defeatNumber[0], Decision.defeatNumber[1]:
        print(GameResultMessage.defeat)
        turnOfUser = false
    default:
        print(GameResultMessage.draw)
        startFirstGame(selectFirstGameMenu())
    }
    return turnOfUser
}

func startSecondGame(_ userInput: String) {
    let endingNumber = 0
    guard let validNumber = checkValidity2(of: userInput) else { return }
    if validNumber == endingNumber {
        print(StartAndEndMessage.endOfGame)
        return
    } else {
        
    }
}

func decideSecondWinner(_ validNumber: Int) {
    let allowedNumberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: allowedNumberRange)
    if validNumber == computerNumber {
        
    }
}

func decideTurn(_ turnOfUser: Bool) -> String {
    if turnOfUser == true {
        return "사용자"
    } else {
        return "컴퓨터"
    }
}

startFirstGame(selectFirstGameMenu())
startSecondGame(selectSecondGameMenu())
