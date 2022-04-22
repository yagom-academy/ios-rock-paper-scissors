//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

struct Game {
    private var userChoice: GameChoice?
    private var computerChoice: GameChoice?
    private var isUserTurn = false
    private var isSameChoice = false
    
    mutating func execute() {
        GameStatus.rockPaperScissorsMenu.printMessage()
        inputUserSelect()
        
        if verifyUserSelection() == true {
            decideGameStart()
        } else {
            GameStatus.error.printMessage()
            execute()
        }
    }
    
    private mutating func executeMukChiBa() {
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
}

extension Game {
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
}

extension Game {
    private mutating func decideGameStart() {
        if userChoice == .end {
            GameStatus.end.printMessage()
        } else {
            printGameResult()
        }
    }
    
    private mutating func printGameResult() {
        switch compareChoice() {
        case .draw:
            GameStatus.draw.printMessage()
            execute()
        case .win:
            GameStatus.win.printMessage()
            isUserTurn = true
            executeMukChiBa()
        case .lose:
            GameStatus.lose.printMessage()
            isUserTurn = false
            executeMukChiBa()
        default:
            break
        }
    }
    
    private mutating func compareChoice() -> GameResult? {
        let computerChoiceNumber = Int.random(in: GameChoice.scissors.number...GameChoice.paper.number)
        computerChoice = GameChoice.init(rawValue: computerChoiceNumber)
        
        switch userChoice {
        case computerChoice:
            return .draw
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

extension Game {
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
        }
    }
    
    private mutating func printTurn() {
        switch decideTurn() {
        case .win:
            isUserTurn.toggle()
            GameStatus.userTurn.printMessage()
        case .lose:
            isUserTurn.toggle()
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
