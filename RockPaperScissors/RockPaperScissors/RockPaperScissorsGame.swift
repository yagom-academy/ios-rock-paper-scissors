//  Created by 감자 and som on 2022/08/22.

struct RockPaperScissorsGame {
    func play() {
        guard let userNumber = inputUserNumber() else {
            print(GameComment.retry.rawValue)
            play()
            return
        }
        
        if checkEndGame(userNumber) {
            print(GameComment.gameOver.rawValue)
            return
        }
        
        guard let compareRPS =  convertRPS(inputNumber: userNumber) else {
            play()
            return
        }
        
        let userGameResult = judgeWinOrLoseAtRPS(RPS: compareRPS)
        
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
    
    private func checkEndGame(_ userNumber: Int) -> Bool {
        if userNumber != 0 {
            return false
        }
        return true
    }
    
    private func convertRPS(inputNumber: Int) -> (RockPaperScissors, RockPaperScissors)? {
        guard let numberToRPS: RockPaperScissors = .init(rawValue: inputNumber),
              let computerRPS: RockPaperScissors = .init(rawValue: Int.random(in: 1...3)) else {
            print(GameComment.retry.rawValue)
            return nil
        }
        return (numberToRPS, computerRPS)
    }
    
    private func judgeWinOrLoseAtRPS(RPS: (RockPaperScissors, RockPaperScissors)) -> GameResult {
        let gameResult: GameResult
        
        switch RPS {
        case let (userRPS, computerRPS) where userRPS == computerRPS:
            gameResult = .draw
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors) :
            gameResult = .win
        default:
            gameResult = .lose
        }
        return gameResult
    }
    
    private func judgeWinOrLoseAtMCB(MCB: (MukChiBba, MukChiBba), to turn: Turn) {
        switch MCB {
        case let (userMCB, computerMCB) where userMCB == computerMCB:
            print("\(turn.rawValue)의 승리!")
        case (.chi, .bba), (.bba, .muk), (.muk, .chi) :
            print("사용자의 턴입니다.")
        default:
            print("컴퓨터의 턴입니다.")
        }
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


