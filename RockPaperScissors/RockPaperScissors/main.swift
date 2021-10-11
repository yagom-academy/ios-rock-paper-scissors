//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//STEP 1. 가위바위보 게임 [차분히 천천히하세요]

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
    recieveUserInput()
}

func printRockPaperSiccorsManual() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
}

func recieveUserInput() {
    printRockPaperSiccorsManual()
    let userInput = readLine()?.replacingOccurrences(of: " ", with: "")
    
    switch userInput {
    case "1":
        print("generateRandomHands()로 이동")
    case "2":
        print("generateRandomHands()로 이동")
    case "3":
        print("generateRandomHands()로 이동")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

print(generateRandomHand())
