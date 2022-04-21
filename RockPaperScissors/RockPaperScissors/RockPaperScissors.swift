//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

struct RockPaperScissors {
    private var userChoice: GameRockPaperScissorsChoice?
    private var computerChoice: GameRockPaperScissorsChoice?
    private var isUserTurnAndSameChoice = (false, false)
    
    mutating func executeGame() {
        GameStatus.rockPaperScissorsMenu.printMessage()
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
            executeGame()
        case .win:
            GameStatus.win.printMessage()
            GameStatus.end.printMessage()
        case .lose:
            GameStatus.lose.printMessage()
            GameStatus.end.printMessage()
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
