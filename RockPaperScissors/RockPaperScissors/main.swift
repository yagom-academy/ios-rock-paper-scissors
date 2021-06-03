//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result {
    case win
    case lose
    case draw

    static func decideResult(defense: Hand, offense: Hand) -> Result {
        switch (defense, offense) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .win
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return .lose
        default:
            return .draw
        }
    }
    
    func resultMessage() -> String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
}

enum Hand: Int {
    case exit = 0
    case scissors = 1
    case rock = 2
    case paper = 3
}

func userInputNumber() -> Int {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        if let userInput = readLine(), let convertNumber = Int(userInput), (0...3).contains(convertNumber) {
            return convertNumber
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
    }
}

func makeRandomNumber() -> Int {
    return Int.random(in:1...3)
}

func rockPaperScissorsGame() -> Bool {
    guard let userHand = Hand(rawValue: userInputNumber()) else { return true }
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return true }

    if userHand == .exit { return false }

    let gameResult = Result.decideResult(defense: computerHand, offense: userHand)
    print(gameResult.resultMessage())

    return true
}

// Main
func console() {
    while true {
        if !rockPaperScissorsGame() { break }
    }
    print("게임 종료")
}

console()
