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
    case scissor = 1
    case rock = 2
    case paper = 3
}

struct PlayRockScissorPaper {
    var gameData = StoreGameData()
    
    mutating func playGame() throws {
        controlGame()
        let computerHand = gameData.generateComputerHand()
        let fixedResult = try vertifyWinner(gameData.playerHand, computerHand)
        try displayResult(with: fixedResult)
    }
    
    mutating func controlGame() {
        do {
            try gameData.playerHand = gameData.inputPlayerOption()
        } catch ErrorCase.valueIsWorngFormat {
            print("잘못된 입력 입니다. 다시 시도해 주세요.")
            controlGame()
        } catch ErrorCase.valueIsOverRange {
            print("잘못된 입력 입니다. 다시 시도해 주세요.")
            controlGame()
        } catch {}
    }
    
    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) throws -> ResultMassage {
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
    
    mutating func displayResult(with fixedResult: ResultMassage) throws {
        if fixedResult == ResultMassage.draw {
            print(fixedResult.rawValue)
            try playGame()
        } else {
            print(fixedResult.rawValue)
        }
    }
}
