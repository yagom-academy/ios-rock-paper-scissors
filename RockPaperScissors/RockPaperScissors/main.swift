//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum ExpectedUserInput: String {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

func readUserInput() -> ExpectedUserInput? {
    let input = readLine()
    
    switch input {
    case nil:
        return nil
    case ExpectedUserInput.exit.rawValue:
        return .exit
    case ExpectedUserInput.scissors.rawValue:
        return .scissors
    case ExpectedUserInput.rock.rawValue:
        return .rock
    case ExpectedUserInput.paper.rawValue:
        return .paper
    default:
        return nil
    }
}


