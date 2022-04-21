//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

struct Game {
    private var userChoice: GameRockPaperScissorsChoice?
    private var computerChoice: GameRockPaperScissorsChoice?
    private var isSatisfying = (userTurn: false, sameChoice: false)
    
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
    
    private mutating func inputUserSelect() {
        let userChoiceNumber = Int(readLine() ?? "")
        userChoice = changeToGameChoice(from: userChoiceNumber)
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
            isSatisfying.userTurn = true
            executeMukChiBa()
        case .lose:
            GameStatus.lose.printMessage()
            isSatisfying.userTurn = false
            executeMukChiBa()
        }
    }
    
    private mutating func compareChoice() -> GameResult {
        let computerChoiceNumber = Int.random(in: GameRockPaperScissorsChoice.scissors.number...GameRockPaperScissorsChoice.paper.number)
        computerChoice = changeToGameChoice(from: computerChoiceNumber)
        
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
            return .draw
        }
    }
    
    private func compareScissorsOfUser(with computerChoice: GameRockPaperScissorsChoice?) -> GameResult {
        return computerChoice == .paper ? .win : .lose
    }
    
    private func comparePaperOfUser(with computerChoice: GameRockPaperScissorsChoice?) -> GameResult {
        return computerChoice == .rock ? .win : .lose
    }
    
    private func compareRockOfUser(with computerChoice: GameRockPaperScissorsChoice?) -> GameResult {
        return computerChoice == .scissors ? .win : .lose
    }
    
    func changeToGameChoice(from number: Int?) -> GameRockPaperScissorsChoice {
        switch number {
        case GameRockPaperScissorsChoice.end.number:
            return .end
        case GameRockPaperScissorsChoice.scissors.number:
            return .scissors
        case GameRockPaperScissorsChoice.paper.number:
            return .paper
        case GameRockPaperScissorsChoice.rock.number:
            return .rock
        default:
            return .error
        }
    }
}

extension Game {
    private var userMukChiBaChoice: GameMukChiBaChoice {
        switch userChoice?.number {
        case GameRockPaperScissorsChoice.end.number:
            return .end
        case GameRockPaperScissorsChoice.scissors.number:
            return .muk
        case GameRockPaperScissorsChoice.rock.number:
            return .chi
        case GameRockPaperScissorsChoice.paper.number:
            return .ba
        default:
            return .error
        }
    }
    
    private var computerMukChiBaChoice: GameMukChiBaChoice {
        switch computerChoice?.number {
        case GameRockPaperScissorsChoice.end.number:
            return .end
        case GameRockPaperScissorsChoice.scissors.number:
            return .muk
        case GameRockPaperScissorsChoice.rock.number:
            return .chi
        case GameRockPaperScissorsChoice.paper.number:
            return .ba
        default:
            return .error
        }
    }
    
    mutating func executeMukChiBa() {
        printMukChiBaMenu()
        inputUserSelect()
        
        if verifyUserSelection() == true {
            if userMukChiBaChoice == .end {
                GameStatus.end.printMessage()
            } else {
                decideSameChoice()
                printMukChiBaResult()
            }
        } else {
            isSatisfying.userTurn = false
            
            GameStatus.error.printMessage()
            executeMukChiBa()
        }
    }
    
    func printMukChiBaMenu() {
        if isSatisfying.userTurn == true {
            GameStatus.userTurnMukChibaMenu.printMessage()
        } else {
            GameStatus.computerTurnMukChibaMenu.printMessage()
        }
    }
    
    mutating func decideTurn() {
        isSatisfying.userTurn = isSatisfying.userTurn == true ? false : true
    }
    
    mutating func decideSameChoice() {
        let computerChoiceNumber = Int.random(in: GameRockPaperScissorsChoice.scissors.number...GameRockPaperScissorsChoice.paper.number)
        computerChoice = changeToGameChoice(from: computerChoiceNumber)
        
        if userMukChiBaChoice == computerMukChiBaChoice {
            isSatisfying.sameChoice = true
        } else {
            isSatisfying.sameChoice = false
        }
    }
    
    mutating func printMukChiBaResult() {
        switch isSatisfying {
        case (true, true):
            GameStatus.userWin.printMessage()
            GameStatus.end.printMessage()
        case (true, false):
            decideTurn()
            GameStatus.computerTurn.printMessage()
            executeMukChiBa()
        case (false, true):
            GameStatus.computerWin.printMessage()
            GameStatus.end.printMessage()
        case (false, false):
            decideTurn()
            GameStatus.userTurn.printMessage()
            executeMukChiBa()
        }
    }
}
