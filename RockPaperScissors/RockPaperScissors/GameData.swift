//
//  GameData.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class GameData {
    let handsRange: ClosedRange = 1...3
    var status: Status = .begin
    var turn: Turn = .playerTurn
    var matchResult: MatchResult = .draw
    
    func startGame() {
        let (playerOption, status) = convertToPlayerOption(from: inputPlayerOption())
        switch status {
        case .exit:
            break
        case .error:
            
            startGame()
        case .inProgress:
            executeByOption(makeResult(playerOption))
        default:
            startGame()
        }
    }
    
    func generateComputerHand() -> PlayerHands {
        let computerOption = String(Int.random(in: handsRange))
        let (computerHand, _) = convertToPlayerOption(from: computerOption)
        return computerHand
    }
    
    func conveyPlayerHandAndStatus() -> (PlayerHands, Status) {
        let playerOption = inputPlayerOption()
        let (playerHand, status) = convertToPlayerOption(from: playerOption)
        return (playerHand, status)
    }
    
    func inputPlayerOption() -> String {
        guard let inputPlayerOption = readLine() else {
            return Status.error.message
        }
        return inputPlayerOption
    }
    
    func executeByOption(_ matchResult: MatchResult) {}
    // 가위바위보, 묵찌빠에서 각각 승리 조건에 따른 행동
    
    func makeResult(_ playerHand: PlayerHands) -> MatchResult {
        let computerHand = generateComputerHand()
        let matchResult = verifyWinner(playerHand.optionNumber, computerHand.optionNumber)
        return matchResult
    }
    
    func verifyWinner(_ playerHand: Int,_ computerHand: Int ) -> MatchResult {
        if playerHand == computerHand {
            return .draw
        } else if playerHand - computerHand == 1 || computerHand - playerHand == 2 {
            return .win
        } else {
            return .lose
        }
    }
    
    func convertToPlayerOption(from playerOption: String ) -> (PlayerHands, Status) {
        switch playerOption {
        case "1":
            return (.scissor, .inProgress)
        case "2":
            return (.rock, .inProgress)
        case "3":
            return (.paper, .inProgress)
        case "0":
            return (.none, .exit)
        default:
            return (.none, .error)
        }
    }
}
