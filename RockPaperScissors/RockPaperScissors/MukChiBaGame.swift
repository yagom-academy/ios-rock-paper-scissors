//
//  MukChiBaGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/23.
//

struct MukChiBaGame {
    private var userChoice: GameChoice?
    private var computerChoice: GameChoice?
    private var isUserTurn: Bool?
    private var isSameChoice: Bool?
    private var rockPaperScissorsGame = RockPaperScissorsGame()
    
    mutating func executeMukChiBa() {
        rockPaperScissorsGame.executeRockPaperScissors()
        isUserTurn = rockPaperScissorsGame.deliverGameResult() == true ? true: false
        
        while true {
            printMukChiBaMenu()
            inputUserSelect()
            
            if verifyUserSelection() == true {
                decideMukChiBaStart()
                break
            } else {
                isUserTurn = false
                
                GameStatus.error.printMessage()
            }
        }
    }
    
    private mutating func inputUserSelect() {
        guard let userChoiceNumber = Int(readLine() ?? "") else {
            userChoice = nil
            return
        }
        userChoice = GameChoice.init(rawValue: userChoiceNumber)
    }
    
    private func verifyUserSelection() -> Bool {
        return userChoice != nil ? true : false
    }
    
    private func printMukChiBaMenu() {
        if isUserTurn == true {
            GameStatus.userTurnMukChibaMenu.printMessage()
        } else {
            GameStatus.computerTurnMukChibaMenu.printMessage()
        }
    }
    
    private mutating func decideMukChiBaStart() {
        if userChoice == .end {
            GameStatus.end.printMessage()
        } else {
            decideSameChoice()
            printMukChiBaResult()
        }
    }
    
    private mutating func decideSameChoice() {
        let computerChoiceNumber = Int.random(in: GameChoice.scissors.number...GameChoice.paper.number)
        computerChoice = GameChoice.init(rawValue: computerChoiceNumber)
        convertChoiceToMukChiBa()
        if userChoice == computerChoice {
            isSameChoice = true
        } else {
            isSameChoice = false
        }
    }
    
    private mutating func convertChoiceToMukChiBa() {
        userChoice = userChoice?.changeMukChiBa()
        computerChoice = computerChoice?.changeMukChiBa()
    }
    
    private mutating func printMukChiBaResult() {
        switch (isUserTurn, isSameChoice) {
        case (true, true):
            GameStatus.userWin.printMessage()
            GameStatus.end.printMessage()
        case (true, false):
            printTurn()
            executeMukChiBa()
        case (false, true):
            GameStatus.computerWin.printMessage()
            GameStatus.end.printMessage()
        case (false, false):
            printTurn()
            executeMukChiBa()
        default:
            break
        }
    }
    
    private mutating func printTurn() {
        switch decideTurn() {
        case .win:
            isUserTurn = true
            GameStatus.userTurn.printMessage()
        case .lose:
            isUserTurn = false
            GameStatus.computerTurn.printMessage()
        default:
            break
        }
    }
    
    private func decideTurn() -> GameResult? {
        switch userChoice {
        case .scissors:
            return compareScissorsOfUser(with: computerChoice)
        case .paper:
            return comparePaperOfUser(with: computerChoice)
        case .rock:
            return compareRockOfUser(with: computerChoice)
        default:
            return nil
        }
    }
    
    private func compareScissorsOfUser(with computerChoice: GameChoice?) -> GameResult {
        return computerChoice == .paper ? .win : .lose
    }
    
    private func comparePaperOfUser(with computerChoice: GameChoice?) -> GameResult {
        return computerChoice == .rock ? .win : .lose
    }
    
    private func compareRockOfUser(with computerChoice: GameChoice?) -> GameResult {
        return computerChoice == .scissors ? .win : .lose
    }
}
