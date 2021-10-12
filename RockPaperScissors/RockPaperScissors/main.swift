//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

var computerHand: ExpectedHand {
    var hands = ExpectedHand.allCases.shuffled()
    return hands.removeFirst()
}

enum GameError: Error {
    case invalidInput
    case retry
    case exit
}

enum ExpectedHand: String, CaseIterable, Comparable {
    static func < (lhs: ExpectedHand, rhs: ExpectedHand) -> Bool {
        if lhs == .paper, rhs == .scissors {
            return true
        }
        
        return lhs.rawValue < rhs.rawValue
    }
    
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

func readUserInput() throws -> ExpectedHand {
    let input = readLine()
    
    switch input {
    case "0":
        throw GameError.exit
    case ExpectedHand.scissors.rawValue:
        return .scissors
    case ExpectedHand.rock.rawValue:
        return .rock
    case ExpectedHand.paper.rawValue:
        return .paper
    default:
        throw GameError.invalidInput
    }
}

func judgeGameResult(_ input: ExpectedHand) {
    if computerHand != input {
        print("비겼습니다!")
        runProgram()
        
        return
    } else if computerHand < input {
        print("이겼습니다!")
        exitProgram()
    } else {
        print("졌습니다!")
        exitProgram()
    }
    
    return
}

func exitProgram() {
    print("게임 종료")
}

func runProgram() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    let userHand: ExpectedHand
    
    do {
        userHand = try readUserInput()
        judgeGameResult(userHand)
    } catch GameError.invalidInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        runProgram()
    } catch GameError.exit {
        exitProgram()
    } catch {
        print("Unexpected error: \(error).")
    }
}


runProgram()
