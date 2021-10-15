//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum MenuMessage: String {
    case startGame = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case inputError = "잘못된 입력입니다. 다시 시도해주세요."
}

enum ResultMessage: String {
    case userWin = "이겼습니다!"
    case userLose = "졌습니다!"
    case draw = "비겼습니다!"
    case gameEnd = "게임 종료"
}

enum Hand : Int {
    case scissors
    case rock
    case paper
    case none
}

enum GameResult : String {
    case userWin
    case userLose
    case draw
}

func runProgram() {
    var gameResult: GameResult
    let shutDown = "0"
    
    while true {
        print(MenuMessage.startGame.rawValue, terminator: "")
        
        guard let userInput = receiveInput() else { print(MenuMessage.inputError.rawValue)
            continue
        }
        if userInput == shutDown {
            print(ResultMessage.gameEnd.rawValue)
            break
        }
        
        gameResult = startFirstGame(userNumber: userInput)
        if gameResult == .draw {
            continue
        } else {
            print(ResultMessage.gameEnd.rawValue)
            break
        }
    }
}

func receiveInput() -> String? {
    let allowedInputRange = 0...3
    let userInput = readLine()
    let inputRangeVerification: Bool = (allowedInputRange.map{ String($0) }).contains(userInput)
    
    guard inputRangeVerification else { return nil }
    return userInput
}

func startFirstGame(userNumber: String?) -> GameResult {
    let allowedNumberRange = 1...3
    let computerNumber = String(Int.random(in: allowedNumberRange))
    
    let userHand = convertNumberToHandName(oneNumber: userNumber)
    let computerHand = convertNumberToHandName(oneNumber: computerNumber)
    let gameResult = fightHandsGame(userHand: userHand, computerHand: computerHand)
    return gameResult
}

func convertNumberToHandName(oneNumber: String?) -> Hand {
    switch oneNumber {
    case "1":
        return .scissors
    case "2":
        return .rock
    case "3":
        return .paper
    default:
        return .none
    }
}

func fightHandsGame(userHand: Hand, computerHand: Hand) -> GameResult {
    switch (userHand, computerHand) {
    case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
        print(ResultMessage.userWin.rawValue)
        return .userWin
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        print(ResultMessage.userLose.rawValue)
        return .userLose
    default:
        print(ResultMessage.draw.rawValue)
        return .draw
    }
}

runProgram()
