//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

var computerHand: ExpectedHand {
    var hands = [ExpectedHand.scissors, ExpectedHand.rock, ExpectedHand.paper].shuffled()
    return hands.removeFirst()
}

enum GameError: Error {
    case invalidInput
}

enum GameResult: Error {
    case win
    case draw
    case lose
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
        throw GameResult.exit
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

func isWin(_ input: ExpectedHand) -> GameResult {
    guard computerHand != input else {
        return GameResult.draw
    }
    
    let isWin: Bool = computerHand < input
    
    return isWin ? .win : .lose
}

func playGame() -> GameResult {
    let userHand: ExpectedHand
    
    do {
        userHand = try readUserInput()
    } catch GameError.invalidInput {
        return .retry
    } catch GameResult.exit {
        return .exit
    } catch {
        return .retry
    }
    
    return isWin(userHand)
}
