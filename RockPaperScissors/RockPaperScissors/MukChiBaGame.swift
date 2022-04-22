//
//  MukChiBaGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/23.
//

struct MukChiBaGame {
    private var userChoice: GameChoice?
    private var computerChoice: GameChoice?
    var isUserTurn: Bool?
    private var isSameChoice: Bool?
    
    mutating func executeMukChiBa() {
        printMukChiBaMenu()
        inputUserSelect()
        
        if verifyUserSelection() == true {
            decideMukChiBaStart()
        } else {
            isUserTurn = false
            
            GameStatus.error.printMessage()
            executeMukChiBa()
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
        switch userChoice {
        case .end,
                .scissors,
                .rock,
                .paper:
            return true
        default:
            return false
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
    
    private func printMukChiBaMenu() {
        if isUserTurn == true {
            GameStatus.userTurnMukChibaMenu.printMessage()
        } else {
            GameStatus.computerTurnMukChibaMenu.printMessage()
        }
    }
    
    private mutating func decideMukChiBaStart() {
        if userChoice?.changeMukChiBa() == .end {
            GameStatus.end.printMessage()
        } else {
            decideSameChoice()
            printMukChiBaResult()
        }
    }
    
    private mutating func decideSameChoice() {
        let computerChoiceNumber = Int.random(in: GameChoice.scissors.number...GameChoice.paper.number)
        computerChoice = GameChoice.init(rawValue: computerChoiceNumber)
        
        if userChoice?.changeMukChiBa() == computerChoice?.changeMukChiBa() {
            isSameChoice = true
        } else {
            isSameChoice = false
        }
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
        switch userChoice?.changeMukChiBa() {
        case .scissors:
            return compareScissorsOfUser(with: computerChoice?.changeMukChiBa())
        case .paper:
            return comparePaperOfUser(with: computerChoice?.changeMukChiBa())
        case .rock:
            return compareRockOfUser(with: computerChoice?.changeMukChiBa())
        default:
            return nil
        }
    }
}
