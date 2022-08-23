//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

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
    } else if computerHand == Hand.rock && userHand == Hand.paper {
        print("이겼습니다!")
    } else if computerHand == Hand.paper && userHand == Hand.scissor {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

func gameStart() {
    let randomComputerHand: Hand = Hand.allCases.randomElement().unsafelyUnwrapped
    
    while   {
        print(randomComputerHand)
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let inputNumberString = readLine(), let inputNumber = Int(inputNumberString),
              inputNumber >= 0, inputNumber < 4 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        if inputNumber == 0 {
            print("게임 종료")
        } else {
            checkResult(computerHand: randomComputerHand, userHand: makeUserHand(of: inputNumber))
        }
    }
}
