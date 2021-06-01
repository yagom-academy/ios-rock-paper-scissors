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

enum Result {
    case win
    case draw
    case lose
}

private func choiceUserHand() -> Hand? {
       let userInputArray: Array<Int> = [0, 1, 2, 3]
       print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
       guard let userInput = readLine(), let convertedUserInput = Int(userInput) else {
           return choiceUserHand()
       }

       guard userInputArray.contains(convertedUserInput) else {
           return choiceUserHand()
       }

       return Hand(rawValue: convertedUserInput)
}

func computerHand() -> Hand {
    let hand = Hand.allCases.randomElement()!
    
    return hand
}
