//  Created by 감자 and som on 2022/08/22.

struct RockPaperScissorsGame {
    func play() {
        guard let userRPS = generateUserRPS() else {
            print(GameComment.gameOver.rawValue)
            return
        }
        
        let computerRPS = generateComputerRandomRPS()
        let userGameResult = judgeWinOrLose(userRPS, computerRPS)
        
        showResult(userGameResult)
    }
    
    private func showMenu() {
        print(GameComment.gameMenu.rawValue, terminator: "")
    }
    
    private func inputUserNumber() -> Int? {
        showMenu()
        
        guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
            print(GameComment.none.rawValue)
            return inputUserNumber()
        }
        let inputUserNumberToInt = Int(inputUserNumber)
        return inputUserNumberToInt
    }
    
    private func generateUserRPS() -> RockPaperScissors? {
        guard let userNumber = inputUserNumber() else {
            print(GameComment.retry.rawValue)
            return generateUserRPS()
        }
        
        guard userNumber != 0 else {
            return nil
        }
        
        guard let userRPS: RockPaperScissors = .init(rawValue: userNumber) else {
            print(GameComment.retry.rawValue)
            return generateUserRPS()
        }
        return userRPS
    }
    
    private func generateComputerRandomRPS() -> RockPaperScissors {
        let computerNumber = Int.random(in: 1...3)
        
        guard let computerRPS: RockPaperScissors = .init(rawValue: computerNumber) else {
            return generateComputerRandomRPS()
        }
        return computerRPS
    }
    
    private func judgeWinOrLose(
        _ userRPS: RockPaperScissors,
        _ computerRPS: RockPaperScissors)
    -> GameResult {
        var gameResult: GameResult = .draw
        
        if userRPS == computerRPS {
            return gameResult
        }
        
        switch userRPS {
        case .scissors:
            if computerRPS == .paper {
                gameResult = .win
            } else if computerRPS == .rock {
                gameResult = .lose
            }
        case .rock:
            if computerRPS == .scissors {
                gameResult = .win
            } else if computerRPS == .paper {
                gameResult = .lose
            }
        case .paper:
            if computerRPS == .rock {
                gameResult = .win
            } else if computerRPS == .scissors {
                gameResult = .lose
            }
        }
        return gameResult
    }
    
    private func showResult(_ result: GameResult) {
        switch result {
        case .win:
            print(GameComment.gameWin.rawValue)
        case .lose:
            print(GameComment.gameLose.rawValue)
        case .draw:
            print(GameComment.gameDraw.rawValue)
            play()
        }
    }
}


