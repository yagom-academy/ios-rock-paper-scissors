//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

struct RockPaperScissorsGame {
    private var userChoice: GameChoice?
    private var computerChoice: GameChoice?
    private var gameResult = false
    
    mutating func executeRockPaperScissors() {
        GameStatus.rockPaperScissorsMenu.printMessage()
        inputUserSelect()
        
        if verifyUserSelection() == true {
            decideGameStart()
        } else {
            GameStatus.error.printMessage()
            executeRockPaperScissors()
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
            executeRockPaperScissors()
        case .win:
            GameStatus.win.printMessage()
            gameResult = true
        case .lose:
            GameStatus.lose.printMessage()
            gameResult = false
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
    
    func deliverGameResult() -> Bool {
        return gameResult
    }
}
