//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

func makeUserHand(of inputNumber: Int) ->  Hand {
    guard let result = Hand(rawValue: inputNumber) else {
        return .none
    }
    return result
}

func compareHand(computerHand: Hand, userHand: Hand) -> Result {
    if computerHand == userHand {
        return Result.draw
    } else if computerHand == Hand.scissor && userHand == Hand.rock {
        return Result.win
    } else if computerHand == Hand.rock && userHand == Hand.paper {
        return Result.win
    } else if computerHand == Hand.paper && userHand == Hand.scissor {
        return Result.win
    } else {
        return Result.lose
    }
}

func displayResult(of Result: Result) {
    print(Result.rawValue)
}

func gameStart() {
    while true {
        let randomComputerHand: Hand = Hand(rawValue: Int.random(in: 1...3)).unsafelyUnwrapped
        
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
            displayResult(of: compareHand(computerHand: randomComputerHand, userHand: makeUserHand(of: inputNumber))) // 만약, computerHand를 rawValue 값인 Int로 받는다면?,
        }
    }
}
