//
//  RocksScissorPaperFunc.swift
//  RockPaperScissors
//
//  Created by jin on 8/23/22.
//

import Foundation

func printRockScissorPaperMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func printMukZiPaMenu(turn: Turn) {
    print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " ")
}

func userInput() -> String? {
    let input = readLine()
    return input
}

func validateUserInputNumber(input: String?) -> Bool {
    guard let input = input,
          let userInputNumber = Int(input),
          userInputNumber <= 3,
          userInputNumber >= 0
    else {
        return false
    }
    return true
}

func makeStringToInt(_ input: String?) -> Int? {
    guard let input = input else { return nil }
    return Int(input)
}

func setHandType(_ userHandNumber: Int) -> (HandType, HandType)? {
    guard let userHand = HandType(rawValue: userHandNumber),
          let computerHand = HandType(rawValue: Int.random(in: 1...3))
    else {
        return nil
    }
    return (userHand, computerHand)
}

func compareHandsForRockScissorPaper(from hands: (HandType, HandType)) {
    switch hands {
    case let (user, computer) where user == computer:
        print("비겼습니다!")
        startGame()
    case (.scissor, .paper), (.paper, .rock), (.rock, .scissor):
        print("이겼습니다!")
        playMukZiPa(turn: .user)
    default:
        print("졌습니다!")
        playMukZiPa(turn: .computer)
    }
}

func compareHandsForMukZiPa(from hands: (HandType, HandType), with turn: Turn) {
    switch hands {
    case let (user, computer) where user == computer:
        print("\(turn.rawValue)의 승리!")
    case (.scissor, .paper), (.paper, .rock), (.rock, .scissor):
        print("사용자의 턴입니다.")
        playMukZiPa(turn: .user)
    default:
        print("컴퓨터의 턴입니다.")
        playMukZiPa(turn: .computer)
    }
}
