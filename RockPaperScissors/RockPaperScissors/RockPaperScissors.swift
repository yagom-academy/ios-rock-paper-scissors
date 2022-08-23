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
    
    let randomComputerHand: Hand = Hand(rawValue: Int.random(in: 1...3)).unsafelyUnwrapped
    
    print("computerHand : \(randomComputerHand)")
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let inputNumberString = readLine(), let inputNumber = Int(inputNumberString) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return gameStart()
    }
    
    switch inputNumber {
    case 0:
        print("게임종료")
    case 1...3:
        let gameResult: Result = compareHand(computerHand: randomComputerHand, userHand: makeUserHand(of: inputNumber))
        displayResult(of: gameResult)
        
        if gameResult == Result.draw {
            gameStart()
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        gameStart()
    }
}


