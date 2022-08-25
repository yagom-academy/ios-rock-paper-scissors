//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

var isUserTurn: Bool = true

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

func compareMukJjiPpa(with computer: MukJjiPpa, and user: MukJjiPpa) -> MukJjiPpaResult {
    
    switch (computer, user) {
    case (.muk, .ppa), (.jji, .muk), (.ppa, .jji):
        return MukJjiPpaResult.win
    case (.muk, .jji), (.jji, .ppa), (.ppa, .muk):
        return MukJjiPpaResult.lose
    default:
        return MukJjiPpaResult.draw
    }
}

func playMukJjiPpaGame() {
    let randomComputerMukJjiPpa: MukJjiPpa = MukJjiPpa(rawValue: Int.random(in: 1...3)).unsafelyUnwrapped
    print("computerMukJjiPpa : \(randomComputerMukJjiPpa)")
    
    if isUserTurn {
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    } else {
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
    
    guard let inputNumberString = readLine(),
          let inputNumber = Int(inputNumberString),
          let result = MukJjiPpa(rawValue: inputNumber) else {
        
        print("잘못된 입력입니다. 다시 시도해주세요.")
        isUserTurn = false
        return playMukJjiPpaGame()
    }
    switch result {
    case .none:
        print("게임종료")
    case .muk, .jji, .ppa:
        let mukJjiPpaResult: MukJjiPpaResult = compareMukJjiPpa(with: randomComputerMukJjiPpa, and: result)
        
        switch (isUserTurn, mukJjiPpaResult) {
        case (true, .draw):
            print("사용자의 승리!")
        case (false, .draw):
            print("컴퓨터의 승리!")
        case (true, .win),(false, .win):
            print(mukJjiPpaResult.rawValue)
            isUserTurn = true
            playMukJjiPpaGame()
        case (true, .lose),(false, .lose):
            print(mukJjiPpaResult.rawValue)
            isUserTurn = false
            playMukJjiPpaGame()
        }
    }
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
        } else if gameResult == Result.win {
            isUserTurn = true
            playMukJjiPpaGame()
        } else {
            isUserTurn = false
            playMukJjiPpaGame()
        }
    }
}
