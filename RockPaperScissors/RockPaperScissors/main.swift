//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//STEP 1. 가위바위보 게임 [차분히 천천히하세요]
enum HandGameMessage: String {
    case rockPaperSiccorsManual = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case endGame = "게임 종료"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case userTurn = "[사용자 턴]"
    case computerTurn = "[컴퓨터 턴]"
}

enum GameHand: CaseIterable {
    case rock
    case paper
    case siccors
}

enum GameResult: String {
    case user  = "이겼습니다!"
    case computer = "졌습니다!"
    case tie = "비겼습니다!"
}

func startRockPaperSiccorsGame() {
    let wrappedUserInput = receiveUserManualInput()
    switch wrappedUserInput.errorMessage {
    case .wrongInput:
        printErrorMessage(of: .wrongInput)
        startRockPaperSiccorsGame()
        return
    case .endGame:
        printErrorMessage(of: .endGame)
        return
    default:
        break
    }
    guard let userHand = wrappedUserInput.userHand else {
        return
    }
    letCheckResultGame(by: userHand)
    
    // 1,2,3 중에 선택된 값을 판별해주는 기능 구현
}

func letCheckResultGame(by userHand: GameHand) -> GameResult {
    var resultGame: GameResult = .user
    let computerHand = generateRandomHand()
    print(computerHand)
    if userHand == computerHand {
        printMessageAboutResultGame(of: .tie)
        startRockPaperSiccorsGame()
    } else if userHand == .paper, computerHand == .rock {
        printMessageAboutResultGame(of: .user)
        return resultGame
    } else if userHand == .rock, computerHand == .siccors {
        printMessageAboutResultGame(of: .user)
        return resultGame
    } else if userHand == .siccors, computerHand == .paper {
        printMessageAboutResultGame(of: .user)
        return resultGame
    } else {
        printMessageAboutResultGame(of: .computer)
        resultGame = .computer
    }
    return resultGame
}
// 결과 출력 함수? 구현

func generateRandomHand() -> GameHand {
    let randomIndex = Int.random(in: 0..<GameHand.allCases.count)
    return GameHand.allCases[randomIndex]
}
func printMessageAboutResultGame(of gameResult: GameResult) {
    print(gameResult.rawValue)
}

func printErrorMessage(of message: HandGameMessage) {
    print(message.rawValue)
}

func receiveUserManualInput() -> (userHand: GameHand?, errorMessage: HandGameMessage?) {
    var statusMessage: HandGameMessage?
    var userHandResult: GameHand?
    print(HandGameMessage.rockPaperSiccorsManual.rawValue, terminator: "")
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

startRockPaperSiccorsGame()
