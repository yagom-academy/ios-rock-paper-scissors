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

enum Turn: String {
    case user = "사용자"
    case computer = "컴퓨터"
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

func compareHands(from hands: (HandType, HandType)) {
    switch hands {
    case let (user, computer) where user == computer:
        print("비겼습니다!")
        playRockScissorPaper()
    case (.scissor, .paper), (.paper, .rock), (.rock, .scissor) :
        print("이겼습니다!")
        playMGP(turn: .user)
    default:
        print("졌습니다!")
        playMGP(turn: .computer)
    }
}

func setHandType(_ userHandNumber: Int) -> (HandType, HandType)? {
    guard let userHand = HandType(rawValue: userHandNumber),
          let computerHand = HandType(rawValue: Int.random(in: 1...3))
    else {
        print("게임 종료")
        return nil
    }
    return (userHand, computerHand)
}

func playMGP(turn: Turn) {
    print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " ")
    let userHandNumber = getUserHandNumber()
}

func playRockScissorPaper() {
    printRockScissorPaper()
    guard let userHandNumber = getUserHandNumber() else {
        playRockScissorPaper()
        return
    }
    guard let hands = setHandType(userHandNumber) else { return }
    compareHands(from: hands)
}

playRockScissorPaper()
