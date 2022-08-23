//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum HandType: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

func printRockScissorPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func getUserHandNumber() -> Int? {
    let input = readLine()
    return validateUserHandNumber(input: input)
}

func validateUserHandNumber(input: String?) -> Int? {
    guard let input = input,
          let userHandNumber = Int(input),
          userHandNumber <= 3,
          userHandNumber >= 0
    else {
        print("잘못된 입력입니다. 다시 시도해 주세요")
        return nil
    }
    return userHandNumber
}

func compareHands(userHand: HandType, computerHand: HandType) {
    let hands = (userHand, computerHand)
        switch hands {
        case let (user, computer) where user == computer:
            print("비겼습니다!")
            playRockScissorPaper()
        case (.scissor, .paper), (.paper, .rock), (.rock, .scissor) :
            print("이겼습니다!")
        default:
            print("졌습니다!")
        }
}

func playRockScissorPaper() {
    printRockScissorPaper()
    guard let userHandNumber = getUserHandNumber() else {
        playRockScissorPaper()
        return
    }
    guard let userHand = HandType(rawValue: userHandNumber) else {
        print("게임 종료")
        return
    }
    guard let computerHand = HandType(rawValue: Int.random(in: 1...3)) else { return }
    compareHands(userHand: userHand, computerHand: computerHand)
}

playRockScissorPaper()
