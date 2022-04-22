//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

struct RockPaperScissorsGame {
    private var userChoice: GameChoice?
    private var computerChoice: GameChoice?
    private var mukChiBaGame = MukChiBaGame()
    
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
            mukChiBaGame.isUserTurn = true
            mukChiBaGame.executeMukChiBa()
        case .lose:
            GameStatus.lose.printMessage()
            mukChiBaGame.isUserTurn = false
            mukChiBaGame.executeMukChiBa()
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
