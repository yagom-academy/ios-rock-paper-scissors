//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class MukjipaGame {
    var turn: MatchResult = .playerTurn
    var gameData = GameData()
    var rockScissorPaperGame = RockScissorPaperGame()
    var status: Status = .begin
    var matchResult: MatchResult = .draw
    
    
    func playTotalGame() {
        let (result, updateStatus) = rockScissorPaperGame.loadRockScissorPaperGame()
        print("묵찌빠에 넘어온 값: \(result)")
        changeTurn(result)
        print("턴정보로 바꾸고 나: \(turn)")
        status = updateStatus
        loadMukjipaGame()
    }
    
    func loadMukjipaGame() {
        
        print(turn.message, terminator: "")
        let (playerHand, computerHand) = generateHandsAndStatus()
        executeByOption(playerHand, computerHand)
    }
    
    func changeTurn(_ result: MatchResult? ) {
        if result == .win {
            turn = .playerTurn
        } else if result == .lose {
            turn = .computerTurn
        } else {}
    }
    
    func generateHandsAndStatus() -> (PlayerHands, PlayerHands) {
        let computerHand = gameData.generateComputerHand()
        let (playerHand, updatedStastus) = gameData.conveyPlayerHandAndStatus()
        status = updatedStastus
        return (playerHand, computerHand)
    }
    
    func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands) {
        switch status {
        case .exit:
            print(Status.exit.message)
            break
        case .error:
            print(Status.error.message)
            turn = .computerTurn
            loadMukjipaGame()
        default:
            verifyFinalWinner(playerHand, computerHand)
        }
    }
    
    func verifyFinalWinner(_ playerHand: PlayerHands, _ computerHand: PlayerHands){
        if turn == .playerTurn && playerHand == computerHand {
            print(MatchResult.win.finalMessage)
            print(Status.exit.message)
        } else if turn == .computerTurn && playerHand == computerHand {
            print(MatchResult.lose.finalMessage)
            print(Status.exit.message)
        } else {
            let resultOfRockScissorPaper = rockScissorPaperGame.vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
            changeTurn(resultOfRockScissorPaper)
            print(turn.finalMessage)
            loadMukjipaGame()
        }
    }
}
