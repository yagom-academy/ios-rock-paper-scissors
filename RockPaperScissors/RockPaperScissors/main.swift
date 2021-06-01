//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Hand : Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
    case end = 0
}

func userHand() -> Hand {
    guard let userInput = readLine(), let num = Int(userInput) else {
        return userHand()
    }
    
    switch Hand(rawValue: num) {
    case .scissors:
        return .scissors
    case .rock:
        return .rock
    case .paper:
        return .paper
    case .end:
        return .end
    default:
        print("입력이 잘못되었습니다.")
        return userHand()
    }
}
