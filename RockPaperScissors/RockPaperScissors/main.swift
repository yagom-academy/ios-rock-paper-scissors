//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
// + 누구의 턴인지 표시하는 String메세지를 HandGameResult타입이 가지고 있는게 좋지않을까 ?

enum HandGameMessage: String {
    case rockPaperSiccorsManual = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case userTurn = "[사용자 턴]"
    case computerTurn = "[컴퓨터 턴]"
}

enum HandGameExceptionMessage: String {
    case endGame = "게임 종료\n"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요.\n"
    case unknownError = "정의되지 않은 오류입니다.\n"
}

enum HandGameHand: CaseIterable {
    case rock
    case paper
    case siccors
}

enum HandGameResult: String {
    case user = "이겼습니다!\n"
    case computer = "졌습니다!\n"
    case draw = "비겼습니다!\n"
}

func startRockPaperSiccorsGame() {
    guard let userHand = handleInputException(for: receiveUserManualInput()) else {
        return
    }
    let computerHand = generateRandomHand()
    let gameResult = checkGameResult(by: userHand, computerHand: computerHand)
    printMessage(of: gameResult)
    if gameResult == .draw {
        startRockPaperSiccorsGame()
    }else {
        //묵찌빠 게임 시작 함수
    }
}

func receiveUserManualInput() -> (userHand: HandGameHand?, exceptionMessage: HandGameExceptionMessage?) {
    var statusMessage: HandGameExceptionMessage?
    var userHandResult: HandGameHand?
    printMessage(of: HandGameMessage.rockPaperSiccorsManual)
    let userInput = readLine()?.replacingOccurrences(of: " ", with: "")
    
    switch userInput {
    case "1":
        userHandResult = .siccors
    case "2":
        userHandResult = .rock
    case "3":
        userHandResult = .paper
    case "0":
        statusMessage = .endGame
    default:
        statusMessage = .wrongInput
    }
    return (userHandResult, statusMessage)
}

func handleInputException(for userInput: (userHand: HandGameHand?,
                                          exceptionMessage: HandGameExceptionMessage?)) -> HandGameHand? {
    switch userInput.exceptionMessage {
    case .wrongInput:
        printMessage(of: HandGameExceptionMessage.wrongInput)
        startRockPaperSiccorsGame()
        return nil
    case .endGame:
        printMessage(of: HandGameExceptionMessage.endGame)
        return nil
    default:
        break
    }
    guard let userHand = userInput.userHand else {
        printMessage(of: HandGameExceptionMessage.unknownError)
        return nil
    }
    return userHand
}

func generateRandomHand() -> HandGameHand {
    let randomIndex = Int.random(in: 0..<HandGameHand.allCases.count)
    return HandGameHand.allCases[randomIndex]
}

func checkGameResult(by userHand: HandGameHand, computerHand: HandGameHand) -> HandGameResult {
    if userHand == computerHand {
        return .draw
    } else if userHand == .paper, computerHand == .rock ||
                userHand == .rock, computerHand == .siccors ||
                userHand == .siccors, computerHand == .paper {
        return .user
    } else {
        return .computer
    }
}

func printMessage<T: RawRepresentable>(of message: T) {
    print(message.rawValue, terminator: "")
}

startRockPaperSiccorsGame()
