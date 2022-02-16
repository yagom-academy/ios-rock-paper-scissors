//
//  RockPaperScissors - main.swift
//  Created by papri,Taeangel
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Userinput: String, CaseIterable {
    case scissors = "1", rock = "2", paper = "3"
    static let exit = "0"
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
    let userInput = inputValue()
    switch userInput {
    case Userinput.scissors.rawValue, Userinput.rock.rawValue, Userinput.paper.rawValue :
        playRockPaperScissors(userHand: userInput)
    case Userinput.exit :
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

func makeComputerHand() -> String {
    guard let computerHand = Userinput.allCases.randomElement()?.rawValue else {
        print(MessegePrint.gameErrorMessege)
        return ""
    }
    return computerHand
}

func playRockPaperScissors(userHand: String) {
    let computerHand = makeComputerHand()
    compareHand(userHand: userHand, computerHand: computerHand)
}

func compareHand(userHand: String, computerHand: String) {
    if userHand == computerHand {
        print(MessegePrint.drawMessege)
        startGame()
    } else if checkUserWinCondition(userHand, computerHand) {
        print(MessegePrint.userWinMessege)
    } else {
        print(MessegePrint.computerWinMessege)
    }
}

func checkUserWinCondition(_ userHand: String, _ computerHand: String) -> Bool {
    return userHand == Userinput.scissors.rawValue && computerHand == Userinput.paper.rawValue || userHand == Userinput.rock.rawValue && computerHand == Userinput.scissors.rawValue || userHand == Userinput.paper.rawValue && computerHand == Userinput.rock.rawValue
}

startGame()
