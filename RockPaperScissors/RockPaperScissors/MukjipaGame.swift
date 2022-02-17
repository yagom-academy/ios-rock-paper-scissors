//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

struct MukjipaGame {
    var turn: MatchResult = .playerTurn
    var gameData = GameData()
    var rockScissorPaperGame = RockScissorPaperGame()
    var status: Status = .begin
    var matchResult: MatchResult = .draw
    
    
    mutating func playMukjipaGame() {
        
        print("[\(turn)] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
        let (playerHand, computerHand) = generateHandsAndStatus()
        executeByOption(playerHand, computerHand)
    }
    
    mutating func changeTurn(_ result: MatchResult ) {
        if result == .win {
            turn = .playerTurn
        } else if result == .lose {
            turn = .computerTurn
        } else {}
        }
    
    mutating func generateHandsAndStatus() -> (PlayerHands, PlayerHands) {
        let computerHand = gameData.generateComputerHand()
        let (playerHand, updatedStastus) = gameData.conveyPlayerHandAndStatus()
        status = updatedStastus
        return (playerHand, computerHand)
    }
    
    mutating func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands) {
        switch status {
        case .exit:
            print(Status.exit.message)
            break
        case .error:
            print(Status.error.message)
            turn = .computerTurn
            playMukjipaGame()
        default:
            verifyFinalWinner(playerHand, computerHand)
        }
    }
    
    mutating func verifyFinalWinner(_ playerHand: PlayerHands, _ computerHand: PlayerHands){
        if turn == .playerTurn && playerHand == computerHand {
            print(MatchResult.win.message)
        } else if turn == .computerTurn && playerHand == computerHand {
            print(MatchResult.lose.message)
        } else {
            let 가위바위보결과 = rockScissorPaperGame.vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
            matchResult = 가위바위보결과
            playMukjipaGame()
        }
    }
}
