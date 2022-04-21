//
//  MukJiPa.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/20.
//
import Foundation

struct MukJiPaGame: Game {
    
    //MARK: - 프린트 함수 모음
        
    private func printMukJiPaMenu(by turn: Turn) {
        print("[\(turn.turnResult) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func printResult(of result: GameResult) {
        print(result.message)
    }

    //MARK: - 묵 찌 빠 게임
    
    enum Numbers {
        static let range = 1...3
    }
    
    func startGame() {
        printRockScissorsPaperMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeRockSicssorsPaperUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeRockSicssorsPaperComputerSign() else { return }
            
            let result = decideRockScissorsPaperResult(userSign: userInput, computerSign: computerInput)
            printResult(of: result)
            decideTurn(by: result)
        default:
            printInvalidResult()
            startGame()
        }
    }
    
    private func decideTurn (by result: GameResult) {
        switch result {
        case .win:
            start(by: Turn.user)
        case .lose:
            start(by: Turn.computer)
        case .draw:
            startGame()
        }
    }
    
    private func start(by turn: Turn) {
        printMukJiPaMenu(by: turn)
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeComputerSign() else { return }
            
            decideResult(by: turn, userSign: userInput, computerSign: computerInput)
        default:
            printInvalidResult()
            start(by: .computer)
        }
    }
    
    func makeUserSign(userInput: Int) -> MukJiPa? {
        let userSign = MukJiPa(rawValue: userInput)
        return userSign
    }
    
    func makeComputerSign() -> MukJiPa? {
        let randomNumber = Int.random(in: Numbers.range)
        let computerRandomSign = MukJiPa(rawValue: randomNumber)
        return computerRandomSign
    }
    
    private func judgeResult(userSign: MukJiPa, computerSign: MukJiPa) -> GameResult {
        if computerSign == userSign {
            return .draw
        } else if
            (computerSign == .ji && userSign == .muk) ||
                (computerSign == .muk && userSign == .ji) ||
                (computerSign == .pa && userSign == .muk) {
            return .lose
        } else {
            return .win
        }
    }
    
    private func decideResult(by turn: Turn, userSign: MukJiPa, computerSign: MukJiPa) {
        printResult(of: judgeResult(userSign: userSign, computerSign: computerSign), by: turn)
    }
    
    private func printResult(of result: GameResult, by turn: Turn) {
        switch result {
        case .win, .lose:
            print("\(turn.turnResult)의 턴입니다")
            start(by: turn)
        case .draw:
            print("\(turn.turnResult)의 승리!")
            printEndGame()
        }
    }    
}
