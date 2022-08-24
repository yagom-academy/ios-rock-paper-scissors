//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

//func makeUserHand(of inputNumber: Int) ->  Hand {
//    guard let result = Hand(rawValue: inputNumber) else {
//        return .none
//    }
//    return result
//}

func compareHand(with computer: Hand, and user: Hand) -> Result {
    
    switch (computer, user) {
        
    case (.rock, .rock), (.paper, .paper), (.scissor, .scissor):
        return .draw
    case (.rock, .paper), (.paper, .scissor), (.scissor, .rock):
        return .win
    case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
        return .lose
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
