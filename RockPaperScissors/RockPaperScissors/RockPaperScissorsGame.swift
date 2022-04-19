//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 예톤,그루트 on 2022/04/18.
//

import Foundation

struct RockPaperScissorsGame {
    private var inputUserChoice: Int?
    
    private func printGameMessage(_ gameMessage: GameMessage) {
        if gameMessage == .menu {
            print(gameMessage.rawValue, terminator: "")
        } else {
            print(gameMessage.rawValue)
        }
    }
    
    private func convertUserChoiceToNumber(_ userChoice: UserChoice) -> Int {
        return userChoice.rawValue
    }
    
    mutating func executeRockPaperScissors() {
        printGameMessage(.menu)
        inputUserSelect()
        
        if verifyUserSelection() {
            decideGameStart()
        } else {
            printGameMessage(.error)
            executeRockPaperScissors()
            return
        }
    }
    
    private mutating func inputUserSelect() {
        inputUserChoice = Int(readLine() ?? "") ?? convertUserChoiceToNumber(.error)
    }
    
    private func verifyUserSelection() -> Bool {
        switch inputUserChoice {
        case convertUserChoiceToNumber(.end),
            convertUserChoiceToNumber(.scissors),
            convertUserChoiceToNumber(.rock),
            convertUserChoiceToNumber(.paper):
            return true
        default:
            return false
        }
    }
    
    private mutating func decideGameStart() {
        if inputUserChoice == convertUserChoiceToNumber(.end) {
            printGameMessage(.end)
        } else {
            printGameResult()
        }
    }
    
    private mutating func printGameResult() {
        switch compareChoice() {
        case .draw:
            printGameMessage(.draw)
            executeRockPaperScissors()
        case .win:
            printGameMessage(.win)
            printGameMessage(.end)
        case .lose:
            printGameMessage(.lose)
            printGameMessage(.end)
        }
    }
    
    private func compareChoice() -> GameResult {
        let computerChoice = Int.random(in: convertUserChoiceToNumber(.scissors)...convertUserChoiceToNumber(.paper))
        
        switch inputUserChoice {
        case computerChoice:
            return .draw
        case convertUserChoiceToNumber(.scissors):
            return compareToScissorsOfUser(with: computerChoice)
        case convertUserChoiceToNumber(.paper):
            return compareToPaperOfUser(with: computerChoice)
        case convertUserChoiceToNumber(.rock):
            return compareToRockOfUser(with: computerChoice)
        default:
            return .draw
        }
    }
    
    private func compareToScissorsOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == convertUserChoiceToNumber(.paper) ? .win : .lose
    }
    
    private func compareToPaperOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == convertUserChoiceToNumber(.rock) ? .win : .lose
    }
    
    private func compareToRockOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == convertUserChoiceToNumber(.scissors) ? .win : .lose
    }
}
