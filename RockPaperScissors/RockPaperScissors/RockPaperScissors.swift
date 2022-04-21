//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

struct RockPaperScissors {
    private var userChoice: GameChoice?
    private var userChoiceNumber: Int?
    private var computerChoice: GameChoice?
    let computerChoiceNumber = Int.random(in: GameChoice.scissors.number...GameChoice.paper.number)
    
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
        userChoiceNumber = Int(readLine() ?? "")
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
    
    private func compareChoice() -> GameResult {
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
