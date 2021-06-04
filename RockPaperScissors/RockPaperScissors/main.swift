//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result:CustomStringConvertible {
    case win
    case lose
    case draw
    case error
    case exit

    // RPS : RockPaperScissors
    static func decideRPSResult(defense: Hand, offense: Hand) -> Result {
        switch (defense, offense) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .win
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return .lose
        default:
            return .draw
        }
    }
    // MJB : Mook-Jjee-Bba
    static func decideMJBResult(defense: Hand, offense: Hand) -> Result {
        switch (defense, offense) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .draw
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            return .lose
        default:
            return .win
        }
    }
    
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        default:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}

enum Hand: Int {
    case inputExit = 0
    case scissors
    case rock
    case paper
    case inputError
    
    func swichingRockAndScissors() -> Hand {
        if self == .rock {
            return .scissors
        } else if self == .scissors {
            return .rock
        } else {
            return self
        }
    }
}

enum Turn: CustomStringConvertible {
    case userAttack
    case computerAttack
    
    func changeTurn() {}
    var description: String { return ""}
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

func doRockPaperScissors() -> Result {
    guard let userHand = Hand(rawValue: userInputNumber()) else { return .error }
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return .error }

    if userHand == .inputExit { return .exit }

    let gameResult = Result.decideRPSResult(defense: computerHand, offense: userHand)
    print(gameResult.description)

    return gameResult
}

func doMookJjeeBba() -> Bool {
    guard let userHand = Hand(rawValue: userInputNumber()) else { return true }
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return true }
    
    if userHand == .inputExit { return false }
    
    return true
}

func mookJjeeBbaGame() -> Bool {
    var rockPaperScissorsResult: Result = .error
    var currentTurn: Turn = .computerAttack

    rockPaperScissorsResult = doRockPaperScissors()
    
    while true {
        if !doMookJjeeBba() { return false }
    }
    
    return true
}

// Main
func console() {
    while true {
        if !mookJjeeBbaGame() { break }
    }
    print("게임 종료")
}

console()
