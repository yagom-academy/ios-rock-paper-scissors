//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by NAMU on 2022/04/18.
//

import Foundation

struct RockPaperScissorsGame {
    var inputUserChoice: Int?
    
    func printGameMessage(_ gameMessage: GameMessage) {
        if gameMessage == .menu {
            print(gameMessage.rawValue, terminator: "")
        } else {
            print(gameMessage.rawValue)
        }
    }
    
    func convertUserChoiceToNumber(_ userchoice: UserChoice) -> Int {
        return userchoice.rawValue
    }
    
    mutating func excuteRockPaperScissors() {
        printGameMessage(.menu)
        inputUserSelect()
        
        if verifyUserSelection() {
            decideGameStart()
        } else {
            printGameMessage(.error)
            excuteRockPaperScissors()
            return
        }
    }
    
    mutating func inputUserSelect() {
        inputUserChoice = Int(readLine() ?? "") ?? 4
    }
    
    func verifyUserSelection() -> Bool {
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
    
    mutating func decideGameStart() {
        if inputUserChoice == convertUserChoiceToNumber(.end) {
            printGameMessage(.ending)
        } else {
            printGameResult()
        }
    }
    
    mutating func printGameResult() {
        switch compareChoice() {
        case .draw:
            printGameMessage(.draw)
            excuteRockPaperScissors()
        case .win:
            printGameMessage(.winning)
            printGameMessage(.ending)
        case .lose:
            printGameMessage(.defeat)
            printGameMessage(.ending)
        }
    }
    
    func compareChoice() -> GameResult {
        var unrappedUserChoice = 0
        let computerChoice = Int.random(in: 1...3)
        
        if let userNumber = inputUserChoice {
            unrappedUserChoice = userNumber
        }
        
        switch unrappedUserChoice {
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
    
    func compareToScissorsOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == convertUserChoiceToNumber(.paper) ? .win : .lose
    }
    
    func compareToPaperOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == convertUserChoiceToNumber(.rock) ? .win : .lose
    }
    
    func compareToRockOfUser(with computerChoice: Int) -> GameResult {
        return computerChoice == convertUserChoiceToNumber(.scissors) ? .win : .lose
    }
}
