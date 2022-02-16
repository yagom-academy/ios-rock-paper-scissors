//
//  Mukchiba.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/16.
//

struct MukchibaGame {
    
    var turn: Turn
    
    init(turn: Turn) {
        self.turn = turn
    }
    
    mutating func start() {
        print("[\(turn.check) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: "")
        let userInput = inputUserNumber()
        
        switch userInput {
        case 0:
            print("게임 종료")
        case 1, 2, 3:
            compareSigns(userInput: userInput)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            turn = .computer
            start()
        }
    }
    
    private func inputUserNumber() -> Int? {
        guard let userInput = readLine() else {
            return nil
        }
        
        guard let userNumber = Int(userInput) else {
            return nil
        }
        
        return userNumber
    }
    
    private mutating func compareSigns(userInput: Int?) {
        guard let computerSign = makeComputerSign() else {
            return
        }
        
        guard let userNumber = userInput else {
            return
        }
        
        guard let userSign = RockPaperScissors(rawValue: userNumber) else {
            return
        }
        
        let gameResult = decideResult(computerSign: computerSign, userSign: userSign)
        
        if printGameResult(gameResult: gameResult) {
            start()
        }
    }
    
    private func makeComputerSign() -> RockPaperScissors? {
        guard let randomSign = RockPaperScissors.allCases.randomElement() else {
            return nil
        }
        
        return randomSign
    }
    
    private func decideResult(computerSign: RockPaperScissors, userSign: RockPaperScissors) -> GameResult {
        if userSign == computerSign {
            return .draw
        }
        
        if userSign == .scissors {
            return computerSign == .paper ? .win : .lose
        }
        
        if userSign == .paper {
            return computerSign == .rock ? .win : .lose
        }
        
        if userSign == .rock {
            return computerSign == .scissors ? .win : .lose
        }
        
        return .draw
    }
    
    private func printGameResult(gameResult: GameResult) -> Bool {
        switch gameResult {
        case .win:
            print("이겼습니다!")
            print("게임 종료")
            return false
        case .lose:
            print("졌습니다!")
            print("게임 종료")
            return false
        case .draw:
            print("비겼습니다")
            return true
        }
    }
}
