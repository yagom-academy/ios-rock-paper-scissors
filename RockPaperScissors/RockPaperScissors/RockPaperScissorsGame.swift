//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
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

//    private func convertUserChoiceToNumber(_ userChoice: UserChoice) -> Int {
//        return userChoice.rawValue
//    }
    
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
        inputUserChoice = Int(readLine() ?? "") ?? UserChoice.error
    }
    
    private func verifyUserSelection() -> Bool {
        switch inputUserChoice {
        case UserChoice.end,
            UserChoice.scissors,
            UserChoice.rock,
            UserChoice.paper:
            return true
        default:
            return false
        }
    }
    
    private mutating func decideGameStart() {
        if inputUserChoice == UserChoice.end {
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
        let computerChoice = Int.random(in: UserChoice.scissors...UserChoice.paper)
        
        switch inputUserChoice {
        case computerChoice:
            return .draw
        case UserChoice.scissors:
            return compareToScissorsOfUser(with: computerChoice)
        case UserChoice.paper:
            return compareToPaperOfUser(with: computerChoice)
        case UserChoice.rock:
            return compareToRockOfUser(with: computerChoice)
        default:
            return .draw
        }
    }
    
    private func compareToScissorsOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == UserChoice.paper ? .win : .lose
    }
    
    private func compareToPaperOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == UserChoice.rock ? .win : .lose
    }
    
    private func compareToRockOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == UserChoice.scissors ? .win : .lose
    }
}
