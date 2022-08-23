//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

enum Hand: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
}

var gameStopCheck: Bool = true
let randomComputerHand: Hand = Hand.allCases.randomElement().unsafelyUnwrapped

func makeUserHand(of inputNumber: Int) -> Hand {
    if inputNumber == 1 {
        return Hand.scissor
    } else if inputNumber == 2 {
        return Hand.rock
    } else {
        return Hand.paper
    }
}

func checkResult(computerHand: Hand, userHand: Hand) {
    if computerHand == userHand {
        print("비겼습니다!")
    } else if computerHand == Hand.scissor && userHand == Hand.rock {
        print("이겼습니다!")
        gameStopCheck = false
    } else if computerHand == Hand.rock && userHand == Hand.paper {
        print("이겼습니다!")
        gameStopCheck = false
    } else if computerHand == Hand.paper && userHand == Hand.scissor {
        print("이겼습니다!")
        gameStopCheck = false
    } else {
        print("졌습니다!")
        gameStopCheck = false
    }
}

func gameStart() {
    while gameStopCheck {
        print(randomComputerHand)
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let inputNumberString = readLine(), let inputNumber = Int(inputNumberString),
              inputNumber >= 0, inputNumber < 4 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        checkResult(computerHand: randomComputerHand, userHand: makeUserHand(of: inputNumber))
    }
}
