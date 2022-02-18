//
//  RockPaperScissors - main.swift
//  Created by papri,Taeangel
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum Hand: CaseIterable {
    case scissors, rock , paper
}

enum MessegePrint {
    static let userWinMessege = "사용자가 승리했습니다"
    static let computerWinMessege = "컴퓨터가 승리했습니다"
    static let drawMessege = "비겼습니다"
    static let prgramExitMessege = "프로그램 종료"
    static let inputErrorMessege = "입력이 잘못되었습니다"
    static let menuDisplay = "가위(1),바위(2),보(3)!<종료 :0>: "
    static let gameErrorMessege = "게임을 실행할 수 없습니다"
}

func startGame() {
    let exitNumber = "0"
    print(MessegePrint.menuDisplay, terminator: "")
    let (userInput, userInputNumber) = convertStringToHand()
    if userInputNumber == exitNumber {
        print(MessegePrint.prgramExitMessege)
    } else {
        guard let userInput = userInput else {
            print(MessegePrint.inputErrorMessege)
            startGame()
            return
        }
        playRockPaperScissors(userHand: userInput)
    }
}

func inputValue() -> String {
    guard let inputValue = readLine() else {
        print(MessegePrint.inputErrorMessege)
        return ""
    }
    return inputValue
}

func convertStringToHand() -> (Hand?, String) {
    let handValue: Hand
    let inputValue = inputValue()
    
    switch inputValue {
    case "1":
        handValue = Hand.scissors
    case "2":
        handValue = Hand.rock
    case "3":
        handValue = Hand.paper
    default:
        return (nil, inputValue)
    }
    return (handValue, inputValue)
}

func makeComputerHand() -> Hand {
    guard let computerHand = Hand.allCases.randomElement() else {
        print(MessegePrint.gameErrorMessege)
        return .scissors
    }
    return computerHand
}

func playRockPaperScissors(userHand: Hand) {
    let computerHand = makeComputerHand()
    compareHand(userHand: userHand, to: computerHand)
}

func compareHand(userHand: Hand,to computerHand: Hand) {
    if userHand == computerHand {
        print(MessegePrint.drawMessege)
        startGame()
    } else if checkUserWinCondition(userHand, computerHand) {
        print(MessegePrint.userWinMessege)
    } else {
        print(MessegePrint.computerWinMessege)
    }
}

func checkUserWinCondition(_ userHand: Hand, _ computerHand: Hand) -> Bool {
    let condition1 = userHand == Hand.scissors && computerHand == Hand.paper
    let condition2 = userHand == Hand.rock && computerHand == Hand.scissors
    let condition3 =  userHand == Hand.paper && computerHand == Hand.rock
    return condition1 || condition2 || condition3
}

startGame()
