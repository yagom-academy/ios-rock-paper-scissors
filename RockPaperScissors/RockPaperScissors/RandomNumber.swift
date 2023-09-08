//
//  RandomNumber.swift
//  Created by uemu, mireu.
//  Copyright © yagom academy. All rights reserved.
//

func generateRandomNumber() -> RockPaperScissorsChoice {
    let randomNumber = Int.random(in: 1...3)
    
    switch randomNumber {
    case 1:
        return .rock
    case 2:
        return .paper
    case 3:
        return .scissors
    default:
        return .unknown
    }
}

