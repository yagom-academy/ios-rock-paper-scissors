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
        print("[\(Player.user.rawValue)", GameMessages.mukJjiPpaGameMemu, terminator: " ")
    } else {
        print("[\(Player.computer.rawValue)", GameMessages.mukJjiPpaGameMemu, terminator: " ")
    }
    
    guard let inputNumberString = readLine(),
          let inputNumber = Int(inputNumberString),
          let result = MukJjiPpa(rawValue: inputNumber) else {
        
        print(GameMessages.inputWrong)
        isUserTurn = false
        return playMukJjiPpaGame()
    }
    switch result {
    case .none:
        print(GameMessages.endGame)
    case .muk, .jji, .ppa:
        let mukJjiPpaResult: MukJjiPpaResult = compareMukJjiPpa(with: randomComputerMukJjiPpa, and: result)
        
        switch (isUserTurn, mukJjiPpaResult) {
        case (true, .draw):
            print(Player.user.rawValue + GameMessages.victory)
        case (false, .draw):
            print(Player.computer.rawValue + GameMessages.victory)
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
    print(GameMessages.rockPaperScissorGameMenu, terminator: " ")
    
    guard let inputNumberString = readLine(),
          let inputNumber = Int(inputNumberString),
          let result = Hand(rawValue: inputNumber) else {
        
        print(GameMessages.inputWrong)
        return startGame()
    }
    
    switch result {
    case .none:
        print(GameMessages.endGame)
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
