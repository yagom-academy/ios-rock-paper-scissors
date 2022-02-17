//
//  Game.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/17.
//

class Game {
    
    func start() {
        printGameInfo()
        let userInput = inputUserNumber()
        
        switch userInput {
        case 0:
            print("게임 종료")
        case 1, 2, 3:
            compareSigns(userInput: userInput)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            changeTurn(to: .computer)
            start()
        }
    }
    
    func printGameInfo() {}
    func changeTurn(to player: Turn) {}
    
    func inputUserNumber() -> Int? {
        guard let userInput = readLine() else {
            return nil
        }
        
        guard let userNumber = Int(userInput) else {
            return nil
        }
        
        return userNumber
    }
    
    func compareSigns(userInput: Int?) {
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
        printGameResult(gameResult: gameResult)
    }
    
    func makeComputerSign() -> RockPaperScissors? {
        guard let randomSign = RockPaperScissors.allCases.randomElement() else {
            return nil
        }
        
        return randomSign
    }
    
    func decideResult(computerSign: RockPaperScissors, userSign: RockPaperScissors) -> GameResult {
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
    
    func printGameResult(gameResult: GameResult) {}
}
