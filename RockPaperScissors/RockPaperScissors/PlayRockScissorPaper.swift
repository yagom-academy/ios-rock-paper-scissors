//
//  PlayRockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

enum ResultMassage: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
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
        switch matchResult {
        case .draw:
            print(matchResult.rawValue)
            playGame()
        case .win:
            print(matchResult.rawValue)
            return
        case .lose:
            print(matchResult.rawValue)
            return
        }
    }
    
    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> ResultMassage {
        var result: ResultMassage = .draw
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
