//  Created by 감자 and som on 2022/08/22.

struct MukChiBbaGame {
    func play() {
        showRockPaperScissorsMenu()
        
        guard let userNumber = inputUserNumber() else {
            print(GameComment.retry.rawValue)
            return play()
        }
        
        if checkEndGame(userNumber) {
            print(GameComment.gameOver.rawValue)
            return
        }
        
        guard let tupleRockPaperScissors =  convertRockPaperScissors(to: userNumber) else {
            return play()
        }
        
        let userGameResult = judgeWinOrLoseAtRockPaperScissors(RPS:
        tupleRockPaperScissors)
        
        showResult(userGameResult)
    }
    
    private func playMukChiBba(turn: Turn) {
        showMukChiBbaMenu(turn: turn)
        
        guard let userNumber = inputUserNumber() else {
            print(GameComment.retry.rawValue)
            return playMukChiBba(turn: .computer)
        }
        
        if checkEndGame(userNumber) {
            print(GameComment.gameOver.rawValue)
            return
        }
        
        guard let tupleMukChiBba = convertMukChiBba(to: userNumber) else {
            return playMukChiBba(turn: .computer)
        }
        
        judgeWinOrLoseAtMukChiBba(MCB: tupleMukChiBba, to: turn)
    }
    
    private func showRockPaperScissorsMenu() {
        print(GameComment.gameRockPaperScissorsMenu.rawValue, terminator: "")
    }
    
    private func showMukChiBbaMenu(turn: Turn) {
        print("[\(turn.rawValue) 턴] \(GameComment.gameMukChiBbaMenu.rawValue)", terminator: "")
    }
    
    private func inputUserNumber() -> Int? {
        guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
            print(GameComment.none.rawValue)
            return nil
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
    
    private func convertRockPaperScissors(to inputNumber: Int)
    -> (RockPaperScissors, RockPaperScissors)? {
        guard let numberToRPS: RockPaperScissors = .init(rawValue: inputNumber),
              let computerRPS: RockPaperScissors = .init(rawValue: Int.random(in: 1...3)) else {
            print(GameComment.retry.rawValue)
            return nil
        }
        return (numberToRPS, computerRPS)
    }
    
    private func convertMukChiBba(to inputNumber: Int) -> (MukChiBba, MukChiBba)? {
        guard let userNumberMCB: MukChiBba = .init(rawValue: inputNumber),
              let computerMCB: MukChiBba = .init(rawValue: Int.random(in: 1...3)) else {
            print(GameComment.retry.rawValue)
            return nil
        }
        return (userNumberMCB, computerMCB)
    }
    
    private func judgeWinOrLoseAtRockPaperScissors(RPS: (RockPaperScissors, RockPaperScissors))
    -> GameResult {
        let gameResult: GameResult
        
        switch RPS {
        case let (userRPS, computerRPS) where userRPS == computerRPS:
            gameResult = .draw
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            gameResult = .win
        default:
            gameResult = .lose
        }
        return gameResult
    }
    
    private func judgeWinOrLoseAtMukChiBba(MCB: (MukChiBba, MukChiBba), to turn: Turn) {
        switch MCB {
        case let (userMCB, computerMCB) where userMCB == computerMCB:
            print("\(turn.rawValue)의 승리!")
        case (.chi, .bba), (.bba, .muk), (.muk, .chi):
            print("사용자의 턴입니다.")
            playMukChiBba(turn: .user)
        default:
            print("컴퓨터의 턴입니다.")
            playMukChiBba(turn: .computer)
        }
    }
    
    private func showResult(_ result: GameResult) {
        switch result {
        case .win:
            print(GameComment.gameWin.rawValue)
            playMukChiBba(turn: .user)
        case .lose:
            print(GameComment.gameLose.rawValue)
            playMukChiBba(turn: .computer)
        case .draw:
            print(GameComment.gameDraw.rawValue)
            play()
        }
    }
}


