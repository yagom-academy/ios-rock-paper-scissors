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
    
    func changeTurn() -> Turn {
        return ( self == .userAttack ? .computerAttack : .userAttack )
    }
    var description: String {
        return ( self == .userAttack ? "사용자" : "컴퓨터" )
    }
}

let rockPaperScissorsMessage = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
let mookJjeeBbaMessage = " 묵(1), 찌(2), 빠(3)! <종료 : 0> : "

func userInputNumber(_ alertMessage: String) -> Int {
    print(alertMessage, terminator: "")
    if let userInput = readLine(), let convertNumber = Int(userInput), (0...3).contains(convertNumber) {
        return convertNumber
    } else {
        print(Result.error.description)
        return Hand.inputError.rawValue
    }
}


func makeRandomNumber() -> Int {
    return Int.random(in:1...3)
}

func getResultDependsOnTurns(_ currentTurn: Turn, user userHand: Hand, computer computerHand: Hand) -> Result {
    switch currentTurn {
    case .userAttack:
        return Result.decideMJBResult(defense: computerHand, offense: userHand)
    case .computerAttack:
        return Result.decideMJBResult(defense: userHand, offense: computerHand)
    }
}

func doRockPaperScissors() -> Result {
    guard let userHand = Hand(rawValue: userInputNumber(rockPaperScissorsMessage)) else { return .error }
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return .error }

    if userHand == .inputExit {
        return .exit
    } else if userHand == .inputError {
        return .error
    }
    // 동작 확인 용 프린트
//    print("사용자 \(userHand) / 컴퓨터 \(computerHand)")

    let gameResult = Result.decideRPSResult(defense: computerHand, offense: userHand)
    print(gameResult.description)

    return gameResult
}

func doMookJjeeBba(_ currentTurn: inout Turn) -> Bool {
    guard var userHand = Hand(rawValue: userInputNumber("[\(currentTurn.description) 턴]" + mookJjeeBbaMessage)) else { return true }
    userHand = userHand.swichingRockAndScissors()
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return true }
    
    if userHand == .inputExit {
        return false
    } else if userHand == .inputError {
        currentTurn = .computerAttack
        return true
    }
    
    // 동작 확인 용 프린트
//    print("사용자 \(userHand) / 컴퓨터 \(computerHand) / 턴 \(currentTurn)")
    
    let mookJjeeBbaResult: Result = getResultDependsOnTurns(currentTurn, user: userHand, computer: computerHand)
    switch mookJjeeBbaResult {
    case .win:
        print("\(currentTurn.description)의 승리!")
        return false
    case .lose:
        currentTurn = currentTurn.changeTurn()
    case .error:
        currentTurn = .computerAttack
    default:
        break
    }
    print("\(currentTurn.description)의 턴입니다!")
    return true
}

func mookJjeeBbaGame() -> Bool {
    var rockPaperScissorsResult: Result = .error
    var currentTurn: Turn = .computerAttack

    rockPaperScissorsResult = doRockPaperScissors()
    
    switch rockPaperScissorsResult {
    case .error, .draw :
        return true
    case .exit:
        return false
    default:
        currentTurn = ( rockPaperScissorsResult == .win ? .userAttack : .computerAttack )
    }
    
    while true {
        if !doMookJjeeBba(&currentTurn) { return false }
    }
}

// Main
func console() {
    while true {
        if !mookJjeeBbaGame() { break }
    }
    print("게임 종료")
}

console()
