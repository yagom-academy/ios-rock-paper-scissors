//
//  RockPaperScissors - main.swift
//  Created by papri,Taeangel
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum Hand: String {
    case scissors, rock , paper
    case extraordinary
    case exit
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
    print(MessegePrint.menuDisplay, terminator: "")
    let userInput = convertStringToHand()
    
    switch userInput {
    case Hand.scissors, Hand.rock, Hand.paper:
        playRockPaperScissors(userHand: userInput)
    case Hand.exit:
        print(MessegePrint.prgramExitMessege)
        return
    default:
        print(MessegePrint.inputErrorMessege)
        startGame()
    }
}

func inputValue() -> String {
    guard let inputValue = readLine() else {
        print(MessegePrint.inputErrorMessege)
        return ""
    }
    return inputValue
}

func convertStringToHand() -> Hand {
    let handValue: Hand
    
    let inputValue = inputValue()
    if inputValue == "1" {
        handValue = Hand.scissors
    } else if inputValue == "2" {
        handValue = Hand.rock
    } else if inputValue == "3" {
        handValue = Hand.paper
    } else if inputValue == "0" {
        handValue = Hand.exit
    } else {
        handValue = Hand.extraordinary
    }
    return handValue
}

func makeComputerHand() -> Hand {
    let rockScissorsPaper: Set<Hand> = [Hand.rock, Hand.scissors, Hand.paper]
    
    guard let computerHand = rockScissorsPaper.randomElement() else {
        print(MessegePrint.gameErrorMessege)
        return Hand.extraordinary
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
    return userHand == Hand.scissors && computerHand == Hand.paper || userHand == Hand.rock && computerHand == Hand.scissors || userHand == Hand.paper && computerHand == Hand.rock
}

startGame()
