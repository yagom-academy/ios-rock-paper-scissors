//
//  StartGame.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/19.
//
import Foundation

struct RockScissorsPaperGame: Game {
    
    private enum Numbers {
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
        default:
            printInvalidResult()
            startGame()
        }
    }
    
    func makeRockSicssorsPaperUserSign(userInput: Int) -> RockScissorsPaper? {
        let userSign = RockScissorsPaper(rawValue: userInput)
        return userSign
    }
    
    func makeRockSicssorsPaperComputerSign() -> RockScissorsPaper? {
        let randomNumber = Int.random(in: Numbers.range)
        let computerRandomSign = RockScissorsPaper(rawValue: randomNumber)
        return computerRandomSign
    }
    
    func printResult(of result: GameResult) {
        print(result.message)
        
        switch result {
        case .win, .lose:
            printEndGame()
        case .draw:
            startGame()
        }
    }
}
