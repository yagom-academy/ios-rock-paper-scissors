//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

func compareHand(with computer: Hand, and user: Hand) -> Result {
    switch (computer, user) {
    case (.rock, .paper), (.paper, .scissor), (.scissor, .rock):
        return .win
    case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
        return .lose
    default:
        return .draw
    }
}

func display(of result: Result) {
    print(result.rawValue)
}

func startGame() {
    let randomComputerHand: Hand = Hand(rawValue: Int.random(in: 1...3)).unsafelyUnwrapped
    
    print("computerHand : \(randomComputerHand)")
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let inputNumberString = readLine(),
          let inputNumber = Int(inputNumberString),
          let result = Hand(rawValue: inputNumber) else {
        
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startGame()
    }
    
    switch result {
    case .none:
        print("게임종료")
    case .rock, .scissor, .paper:
        let gameResult: Result = compareHand(with: randomComputerHand, and: result)
        display(of: gameResult)
        
        if gameResult == Result.draw {
            startGame()
        }
    }
}


