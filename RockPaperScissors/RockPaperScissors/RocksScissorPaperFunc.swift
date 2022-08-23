//
//  RocksScissorPaperFunc.swift
//  RockPaperScissors
//
//  Created by jin on 8/23/22.
//

import Foundation

func printRockScissorPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func printMGP(turn: Turn) {
    print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " ")
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

func setHandType(_ userHandNumber: Int) -> (HandType, HandType)? {
    guard let userHand = HandType(rawValue: userHandNumber),
          let computerHand = HandType(rawValue: Int.random(in: 1...3))
    else {
        print("게임 종료")
        return nil
    }
    return (userHand, computerHand)
}

func compareHandsForRSP(from hands: (HandType, HandType)) {
    switch hands {
    case let (user, computer) where user == computer:
        print("비겼습니다!")
        startGame()
    case (.scissor, .paper), (.paper, .rock), (.rock, .scissor) :
        print("이겼습니다!")
        playMGP(turn: .user)
    default:
        print("졌습니다!")
        playMGP(turn: .computer)
    }
}

func compareHandsForMGP(from hands: (HandType, HandType), with turn: Turn) {
    switch hands {
    case let (user, computer) where user == computer:
        print("\(turn.rawValue)의 승리!")
    case (.scissor, .paper), (.paper, .rock), (.rock, .scissor) :
        print("사용자의 턴입니다.")
        playMGP(turn: .user)
    default:
        print("컴퓨터의 턴입니다.")
        playMGP(turn: .computer)
    }
}
