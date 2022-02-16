//
//  PlayRockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

enum MatchResult {
    case win
    case lose
    case draw
}

extension MatchResult {
    var printMessage: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다"
        case .draw:
            return "비겼습니다"
        }
    }
}

enum CaseOfHands: Int {
    case exit = 0
    case scissor = 1
    case rock = 2
    case paper = 3
    case error = 4
}

struct PlayRockScissorPaper {
    var gameData = StoreGameData()

    mutating func playGame() {
        gameData.generateComputerHand()
        gameData.inputPlayerOption()
        controlGame()
    }
    
    mutating func controlGame() {
        if gameData.optionRange.contains(gameData.playerHand) {
            afterAction()
        } else if gameData.playerHand == 0 {
            print("게임종료")
            return
        } else {
            print("잘못된 입력입니다. 다시 시도해 주세요.")
            playGame()
        }
    }
    
    mutating func afterAction() {
        let matchResult = vertifyWinner(gameData.playerHand, gameData.computerHand)
        print(matchResult.printMessage)
        
        switch matchResult {
        case .draw:
            playGame()
        case .win:
            return
        case .lose:
            return
        }
    }
    
    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> MatchResult {
        var result: MatchResult = .draw
        if playerHand == computerHand {
            result = .draw
            
        } else if playerHand - computerHand == 1 || playerHand - computerHand < 0 {
            result = .win
            
        } else {
            result = .lose
            
        }
        return result
    }
}
