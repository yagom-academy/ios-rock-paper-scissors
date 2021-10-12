//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//STEP 1. 가위바위보 게임 [차분히 천천히하세요]
enum HandGameMessage: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case tie = "비겼습니다!"
    case rockPaperSiccorsManual = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case endGame = "게임 종료"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case initialValue = "기본값 설정 필요"
}

enum GameHand: CaseIterable {
    case rock
    case paper
    case siccors
}

func generateRandomHand() -> GameHand {
    let randomIndex = Int.random(in: 0..<GameHand.allCases.count)
    return GameHand.allCases[randomIndex]
}

func startRockPaperSiccorsGame() {
    receiveUserManualInput()
}

func receiveUserManualInput() -> (GameHand?, HandGameMessage?) {
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
