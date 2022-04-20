//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

import Foundation

struct RockPaperScissors {
    private var userChoice: Int?
    
    mutating func executeGame() {
        GameStatus.menu.printMessage()
        inputUserSelect()
        
        if verifyUserSelection() == true {
            decideGameStart()
        } else {
            GameStatus.error.printMessage()
            executeGame()
            return
        }
    }
    
    private mutating func inputUserSelect() {
        userChoice = Int(readLine() ?? "")
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
            GameStatus.end.printMessage()
        } else {
            printGameResult()
        }
    }
    
    private mutating func printGameResult() {
        switch compareChoice() {
        case .draw:
            GameStatus.draw.printMessage()
            executeGame()
        case .win:
            GameStatus.win.printMessage()
            GameStatus.end.printMessage()
        case .lose:
            GameStatus.lose.printMessage()
            GameStatus.end.printMessage()
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
