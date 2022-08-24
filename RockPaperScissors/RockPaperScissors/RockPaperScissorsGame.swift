//  Created by 감자 and som on 2022/08/22.

struct RockPaperScissorsGame {
    func play() {
        let userNumber = validateUserNumber()
        
        if checkEndGame(userNumber) {
            print(GameComment.gameOver.rawValue)
            return
        }
        
        let userRPS = convertRPS(inputNumber: userNumber)
        let computerRPS = convertRPS(inputNumber: Int.random(in: 1...3))
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
    
    private func validateUserNumber() -> Int {
        guard let userNumber = inputUserNumber() else {
            print(GameComment.retry.rawValue)
            return validateUserNumber()
        }
        return userNumber
    }
    
    private func checkEndGame(_ userNumber: Int) -> Bool {
        if userNumber != 0 {
            return false
        }
        return true
    }
    
    private func convertRPS(inputNumber: Int) -> RockPaperScissors {
        guard let numberToRPS: RockPaperScissors = .init(rawValue: inputNumber) else {
            print(GameComment.retry.rawValue)
            return convertRPS(inputNumber: validateUserNumber())
        }
        return numberToRPS
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


