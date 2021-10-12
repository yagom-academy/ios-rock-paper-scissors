//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


enum Message: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case inputError = "잘못된 입력입니다. 다시 시도해주세요."
    case gameEnd = "게임 종료"
    case userWin = "이겼습니다!"
    case userLose = "졌습니다!"
    case draw = "비겼습니다!"
}

func startGame() {
    let inputRange = 0...3
    print(Message.menu.rawValue, terminator: "")

    guard var userInput = readLine() else { return }
    userInput = String(userInput)
    
    if userInput == "0" {
        print(Message.gameEnd.rawValue)
    } else if (inputRange.map{String($0)}).contains(userInput) {
        compareEachHand(userNumber: userInput)
        print(Message.gameEnd.rawValue)
    } else {
        print(Message.inputError.rawValue)
        startGame()
    }

}

func compareEachHand(userNumber: String) {
    let computerNumber = pickComputerNumber()
    let (userHand, computerHand) = convertToHand(from: userNumber, from: computerNumber)
    
    switch userHand {
    case userHand where userHand == computerHand:
        print(Message.draw.rawValue)
        startGame()
    case "scissors" where computerHand == "rock":
        print(Message.userLose.rawValue)
    case "rock" where computerHand == "paper":
        print(Message.userLose.rawValue)
    case "paper" where computerHand == "scissors":
        print(Message.userLose.rawValue)
    default:
        print(Message.userWin.rawValue)
    }
}

func pickComputerNumber() -> String {
    let allowedNumberRange = 1...3
    let computerNumber = String(Int.random(in: allowedNumberRange))
    return computerNumber
}

func convertToHand(from userNumber: String, from computerNumber: String) -> (String, String) {
    let numbers = [userNumber, computerNumber]
    var convertedHands: [String] = []

    numbers.forEach {
        convertedHands.append($0 == "1" ? "scissors" : $0 == "2" ? "rock" : $0 == "3" ? "paper" : "Error" )
    }
    return (convertedHands[0], convertedHands[1])
}

startGame()
