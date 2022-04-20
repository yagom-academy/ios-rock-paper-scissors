//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

import Foundation

struct RockPaperScissors {
    private var userChoice: Int?
    
    private func printGameMessage(_ gameMessage: GameMessage) {
        if gameMessage == .menu {
            print(gameMessage.rawValue, terminator: "")
        } else {
            print(gameMessage.rawValue)
        }
    }
    
    mutating func executeGame() {
        printGameMessage(.menu)
        inputUserSelect()
        
        if verifyUserSelection() {
            decideGameStart()
        } else {
            printGameMessage(.error)
            executeGame()
            return
        }
    }
    
    private mutating func inputUserSelect() {
        userChoice = Int(readLine() ?? "") ?? UserChoice.error
    }
    
    private func verifyUserSelection() -> Bool {
        switch userChoice {
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
        if userChoice == UserChoice.end {
            printGameMessage(.end)
        } else {
            printGameResult()
        }
    }
    
    private mutating func printGameResult() {
        switch compareChoice() {
        case .draw:
            printGameMessage(.draw)
            executeGame()
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
        
        switch userChoice {
        case computerChoice:
            return .draw
        case UserChoice.scissors:
            return compareScissorsOfUser(with: computerChoice)
        case UserChoice.paper:
            return comparePaperOfUser(with: computerChoice)
        case UserChoice.rock:
            return compareRockOfUser(with: computerChoice)
        default:
            return .draw
        }
    }
    
    private func compareScissorsOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == UserChoice.paper ? .win : .lose
    }
    
    private func comparePaperOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == UserChoice.rock ? .win : .lose
    }
    
    private func compareRockOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == UserChoice.scissors ? .win : .lose
    }
}
