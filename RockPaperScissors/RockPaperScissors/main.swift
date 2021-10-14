//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
// + 누구의 턴인지 표시하는 String메세지를 HandGameResult타입이 가지고 있는게 좋지않을까 ?

enum HandGameMessage: String {
    case rockPaperSiccorsManual = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case mukjipaManual = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
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
    
    var turnMessage: TurnMessage {
        switch self {
        case .user:
            return TurnMessage.user
        case .computer:
            return TurnMessage.computer
        case .draw:
            return TurnMessage.nobody
        }
    }
}

enum TurnMessage: String {
    case user = "[사용자 턴]"
    case computer = "[컴퓨터 턴]"
    case nobody = "[누구의 턴도 아닙니다.]"
}

enum GameMode {
    case rockPaperSiccors
    case mukjipa
}

func startMukjipaGame() {
    guard let rockPaperSiccorsGameWinner = startRockPaperSiccorsGame() else {
        return
    }
    printMessage(of: rockPaperSiccorsGameWinner.turnMessage)
    guard let userHand = receiveUserHand(of: .mukjipa) else {
        return
    }
}

func startRockPaperSiccorsGame() -> HandGameResult? {
    guard let userHand = receiveUserHand(of: .rockPaperSiccors) else {
        return nil
    }
    let computerHand = generateRandomHand()
    let gameResult = checkGameResult(by: userHand, computerHand: computerHand)
    printMessage(of: gameResult)
    if gameResult == .draw {
        return startRockPaperSiccorsGame()
    } else {
        return gameResult
    }
}

func receiveUserManualInput(of gameMode: GameMode) -> (userHand: HandGameHand?, exceptionMessage: HandGameExceptionMessage?) {
    var statusMessage: HandGameExceptionMessage?
    var userHandResult: HandGameHand?
    printMessage(of: gameMode == .rockPaperSiccors ?
                    HandGameMessage.rockPaperSiccorsManual : HandGameMessage.mukjipaManual)
    let userInput = readLine()?.replacingOccurrences(of: " ", with: "")

    switch (userInput,gameMode) {
    case ("1", .rockPaperSiccors), ("2", .mukjipa):
        userHandResult = .siccors
    case ("2", .rockPaperSiccors), ("1", .mukjipa):
        userHandResult = .rock
    case ("3", .rockPaperSiccors), ("3", .mukjipa):
        userHandResult = .paper
    case ("0", .rockPaperSiccors), ("0", .mukjipa):
        statusMessage = .endGame
    default:
        statusMessage = .wrongInput
    }
    return (userHandResult, statusMessage)
}

func receiveUserHand(of gameMode: GameMode) -> HandGameHand? {
    guard let userHand = handleInputException(for: receiveUserManualInput(of: gameMode), of: gameMode) else {
        return nil
    }
    return userHand
}

func handleInputException(for userInput: (userHand: HandGameHand?, exceptionMessage: HandGameExceptionMessage?), of gameMode: GameMode) -> HandGameHand? {
    switch userInput.exceptionMessage {
    case .wrongInput:
        printMessage(of: HandGameExceptionMessage.wrongInput)
        return receiveUserHand(of: gameMode)
    case .endGame:
        printMessage(of: HandGameExceptionMessage.endGame)
        return nil
    default:
        break
    }
    guard let userHand = userInput.userHand else {
        printMessage(of: HandGameExceptionMessage.unknownError)
        return receiveUserHand(of: gameMode)
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
    } else if (userHand == .paper && computerHand == .rock) ||
                (userHand == .rock && computerHand == .siccors) ||
                (userHand == .siccors && computerHand == .paper) {
        return .user
    } else {
        return .computer
    }
}

func printMessage<T: RawRepresentable>(of message: T) {
    print(message.rawValue, terminator: "")
}

startMukjipaGame()
