//
//  StartGame.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/19.
//
import Foundation

struct RockScissorsPaperGame {
    let printSorts = PrintSorts()
    
    enum Numbers {
        static let range = 1...3
    }
    
    func startGame() {
        printSorts.printRockScissorsPaperMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printSorts.printEndGame()
        case 1,2,3:
            guard let userInput = makeRockScissorsPaperUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeRockScissorsPaperComputerSign() else { return }
            
            let result = decideResult(userSign: userInput, computerSign: computerInput)
            printResult(of: result)
        default:
            printSorts.printInvalidResult()
            startGame()
        }
    }
    
    func inputNumber() -> Int {
        guard let userNumber = readLine()?.trimmingCharacters(in: .whitespaces) else { return -1 }
        guard let number = Int(userNumber) else { return -1 }
        return number
    }
    
    func makeRockScissorsPaperUserSign(userInput: Int) -> RockScissorsPaper? {
        let userSign = RockScissorsPaper(rawValue: userInput)
        return userSign
    }
    
    func makeRockScissorsPaperComputerSign() -> RockScissorsPaper? {
        let randomNumber = Int.random(in: Numbers.range)
        let computerRandomSign = RockScissorsPaper(rawValue: randomNumber)
        return computerRandomSign
    }
    
    func decideResult(userSign: RockScissorsPaper, computerSign: RockScissorsPaper) -> GameResult {
        if computerSign == userSign {
            return .draw
        } else if
            (computerSign == .scissors && userSign == .rock) ||
                (computerSign == .rock && userSign == .scissors) ||
                (computerSign == .paper && userSign == .rock) {
            return .lose
        } else {
            return .win
        }
    }
    
    func printResult(of result: GameResult) {
        printSorts.printResult(of: result)
        
        switch result {
        case .win, .lose:
            printSorts.printEndGame()
        case .draw:
            startGame()
        }
    }
}

