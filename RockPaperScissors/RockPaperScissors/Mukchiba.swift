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
        print("컴퓨터", computerSign)
        
        guard let userNumber = userInput else {
            return
        }
        
        guard let userSign = RockPaperScissors(rawValue: userNumber) else {
            return
        }
        
        print("유저사인", userSign)
        
        let gameResult = decideResult(computerSign: computerSign, userSign: userSign)
        printGameResult(gameResult: gameResult)
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
        
        if userSign == .scissors && computerSign == .paper {
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
    
    private mutating func printGameResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            turn = .user
            print("사용자의 턴입니다")
            start()
            
        case .lose:
            turn = .computer
            print("컴퓨터의 턴입니다")
            start()
            
        case .draw:
            print("\(turn.check)의 승리!")
        }
    }
}
