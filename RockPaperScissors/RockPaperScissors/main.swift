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
    case exit
    case invalidInput
}

enum ExpectedHand: String, CaseIterable {
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
