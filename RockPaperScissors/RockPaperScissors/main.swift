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
}

enum Result {
    case win
    case draw
    case lose
}

func choiceUserHand() -> Hand? {
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

func computerHands() -> Hand {
       if let randomHand = Hand.allCases.randomElement() {
           return randomHand
       } else {
           return computerHands()
       }
}
