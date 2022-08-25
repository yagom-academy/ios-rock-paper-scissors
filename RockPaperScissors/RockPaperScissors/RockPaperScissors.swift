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

func playMukJjiPpaGame(turn: Player) {
    let randomComputerMukJjiPpa: MukJjiPpa = MukJjiPpa(rawValue: Int.random(in: 1...3)).unsafelyUnwrapped
    print("computerMukJjiPpa : \(randomComputerMukJjiPpa)")
    
    turn == .user ? print("[\(Player.user.rawValue)", GameMessages.mukJjiPpaGameMemu, terminator: " ") :
    print("[\(Player.computer.rawValue)", GameMessages.mukJjiPpaGameMemu, terminator: " ")
    
    guard let inputNumberString = readLine(),
          let inputNumber = Int(inputNumberString),
          let result = MukJjiPpa(rawValue: inputNumber) else {
        
        print(GameMessages.inputWrong)
        return playMukJjiPpaGame(turn: .computer)
    }
    switch result {
    case .none:
        print(GameMessages.endGame)
    case .muk, .jji, .ppa:
        let mukJjiPpaResult: MukJjiPpaResult = compareMukJjiPpa(with: randomComputerMukJjiPpa, and: result)
        
        switch (turn, mukJjiPpaResult) {
        case (.user, .draw):
            print(Player.user.rawValue + GameMessages.victory)
        case (.computer, .draw):
            print(Player.computer.rawValue + GameMessages.victory)
        case (.user, .win),(.computer, .win):
            print(mukJjiPpaResult.rawValue)
            playMukJjiPpaGame(turn: .user)
        case (.user, .lose),(.computer, .lose):
            print(mukJjiPpaResult.rawValue)
            playMukJjiPpaGame(turn: .computer)
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
            playMukJjiPpaGame(turn: .user)
        } else {
            playMukJjiPpaGame(turn: .computer)
        }
    }
}
