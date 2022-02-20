//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/16.
//

class RockPaperScissorsGame {
    
    func start() {
        printGameGuide()
        let userInput = inputUserNumber()
        
        switch userInput {
        case 0:
            printGameOverMessage()
        case 1, 2, 3:
            compareSigns(userInput: userInput)
        default:
            printInputErrorMessage()
            start()
        }
    }
    
    func printGameGuide() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
    }
    
    func printGameOverMessage() {
        print("게임 종료")
    }
    
    func printInputErrorMessage() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
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
        
        guard let userSign = makeUserSign(userInput: userInput) else {
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
    
    func makeUserSign(userInput: Int?) -> RockPaperScissors? {
        guard let userNumber = userInput else {
            return nil
        }
        
        guard let userSign = RockPaperScissors(rawValue: userNumber) else {
            return nil
        }
        
        return userSign
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
    
    func printGameResult(gameResult: GameResult) {
        
        print(gameResult.message)
        
        switch gameResult {
        case .win:
            let mukchiba = MukchibaGame(turn: .user)
            mukchiba.start()
        case .lose:
            let mukchiba = MukchibaGame(turn: .computer)
            mukchiba.start()
        case .draw:
            start()
        }
    }
}
