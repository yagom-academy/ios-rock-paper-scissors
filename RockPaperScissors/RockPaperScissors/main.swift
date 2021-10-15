//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum HandGameManual: String {
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
    
    var mukjipaTurn: MukjipaTurn {
        switch self {
        case .user:
            return MukjipaTurn.user
        case .computer:
            return MukjipaTurn.computer
        case .draw:
            return MukjipaTurn.nobody
        }
    }
}

enum MukjipaTurn: String {
    case user = "[사용자 턴]"
    case computer = "[컴퓨터 턴]"
    case nobody = "[누구의 턴도 아닙니다.]"
    
    var turnChangeMessage: String {
        switch self {
        case .user:
            return "사용자의 턴입니다"
        case .computer:
            return "컴퓨터의 턴입니다"
        case .nobody:
            return "잘못된 결과입니다."
        }
    }
    var winMessage: String {
        switch self {
        case .user:
            return "사용자의 승리!"
        case .computer:
            return "컴퓨터의 승리!"
        case .nobody:
            return "잘못된 결과입니다."
        }
    }
}

enum GameMode {
    case rockPaperSiccorsGame
    case mukjipaGame
}
func startMukjipaGame() {
    guard let rockPaperSiccorsGameWinner = startRockPaperSiccorsGame() else {
              return
          }
    if repeatMukjipaGame(turn: rockPaperSiccorsGameWinner.mukjipaTurn) == nil {
        return
    }
}

func startRockPaperSiccorsGame() -> HandGameResult? {
    guard let userHand = receiveUserHand(of: .rockPaperSiccorsGame).userHand else {
        return nil
    }
    let computerHand = generateRandomHand()
    let gameResult = checkGameResultBy(userHand: userHand, computerHand: computerHand)
    printMessage(of: gameResult)
    
    if gameResult == .draw {
        return startRockPaperSiccorsGame()
    } else {
        return gameResult
    }
}

func repeatMukjipaGame(turn: MukjipaTurn) -> HandGameResult? {
    printMessage(of: turn)
    let input = receiveUserHand(of: .mukjipaGame)
    if input.turn == .computer {
        return repeatMukjipaGame(turn: .computer)
    }
    guard let userHand = input.userHand else {
        return nil
    }
    let computerHand = generateRandomHand()
    
    if userHand == computerHand {
        print(turn.winMessage)
        printMessage(of: HandGameExceptionMessage.endGame)
        return nil
    } else {
        let nextTurn: MukjipaTurn
        nextTurn = checkGameResultBy(userHand: userHand, computerHand: computerHand).mukjipaTurn
        print(nextTurn.turnChangeMessage)
        return repeatMukjipaGame(turn: nextTurn)
    }
}

func receiveUserHand(of gameMode: GameMode) -> (userHand: HandGameHand?, turn: MukjipaTurn?) {
    let userInput = receiveUserManualInput(of: gameMode)
    
    switch userInput.exceptionMessage {
    case .wrongInput where gameMode == .mukjipaGame:
        printMessage(of: HandGameExceptionMessage.wrongInput)
        return (nil, .computer)
    case .wrongInput:
        printMessage(of: HandGameExceptionMessage.wrongInput)
        return receiveUserHand(of: gameMode)
    case .endGame:
        printMessage(of: HandGameExceptionMessage.endGame)
        return (nil, nil)
    default:
        break
    }
    guard let userHand = userInput.userHand else {
        printMessage(of: HandGameExceptionMessage.unknownError)
        return receiveUserHand(of: gameMode)
    }
    return (userHand, nil)
}

func receiveUserManualInput(of gameMode: GameMode) -> (userHand: HandGameHand?, exceptionMessage: HandGameExceptionMessage?) {
    printMessage(of: gameMode == .rockPaperSiccorsGame ?
                    HandGameManual.rockPaperSiccorsManual : HandGameManual.mukjipaManual)
    let userInput = readLine()?.replacingOccurrences(of: " ", with: "")

    switch (userInput,gameMode) {
    case ("1", .rockPaperSiccorsGame), ("2", .mukjipaGame):
        return (.siccors, nil)
    case ("2", .rockPaperSiccorsGame), ("1", .mukjipaGame):
        return (.rock, nil)
    case ("3", .rockPaperSiccorsGame), ("3", .mukjipaGame):
        return (.paper, nil)
    case ("0", .rockPaperSiccorsGame), ("0", .mukjipaGame):
        return (nil, .endGame)
    default:
        return (nil, .wrongInput)
    }
}

func generateRandomHand() -> HandGameHand {
    let randomIndex = Int.random(in: 0..<HandGameHand.allCases.count)
    return HandGameHand.allCases[randomIndex]
}

func checkGameResultBy(userHand: HandGameHand, computerHand: HandGameHand) -> HandGameResult {
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

