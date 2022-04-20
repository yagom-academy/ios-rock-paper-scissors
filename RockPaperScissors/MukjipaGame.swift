//
//  Mukjipa.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/20.
//
import Foundation

struct mukjipaGame {
    enum Numbers {
        static let range = 1...3
    }
    
    let rockScissorsPaperGame = RockScissorsPaperGame()
    let printSorts = PrintSorts()
    
    func startGame() {
        printSorts.printRockScissorsPaperMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printSorts.printEndGame()
        case 1,2,3:
            guard let userInput = rockScissorsPaperGame.makeRockScissorsPaperUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = rockScissorsPaperGame.makeRockScissorsPaperComputerSign() else { return }
            
            let result = rockScissorsPaperGame.decideResult(userSign: userInput, computerSign: computerInput)
            printSorts.printResult(of: result)
            decideTurn(by: result)
        default:
            printSorts.printInvalidResult()
            startGame()
        }
        
        func decideTurn (by result: GameResult) {
            switch result {
            case .win:
                start(by: Turn.user)
            case .lose:
                start(by: Turn.computer)
            case .draw:
                startGame()
            }
        }
        
        func inputNumber() -> Int {
            guard let userNumber = readLine()?.trimmingCharacters(in: .whitespaces) else { return -1 }
            guard let number = Int(userNumber) else { return -1 }
            return number
        }
        
        func start(by turn: Turn) {
            printSorts.printMukjipaMenu(by: turn)
            let userChoiceNumber = inputNumber()
            
            switch userChoiceNumber {
            case 0:
                printSorts.printEndGame()
            case 1,2,3:
                guard let userInput = makeMukjipaUserSign(userInput: userChoiceNumber) else { return }
                guard let computerInput = makeMukjipaComputerSign() else { return }
                
                decideMukjipaResult(by: turn, userSign: userInput, computerSign: computerInput)
            default:
                printSorts.printInvalidResult()
                start(by: .computer)
            }
        }
        
        func makeMukjipaUserSign(userInput: Int) -> Mukjipa? {
            let userSign = Mukjipa(rawValue: userInput)
            return userSign
        }
        
        func makeMukjipaComputerSign() -> Mukjipa? {
            let randomNumber = Int.random(in: Numbers.range)
            let computerRandomSign = Mukjipa(rawValue: randomNumber)
            return computerRandomSign
        }
        
        func judgeMukjipaResult(userSign: Mukjipa, computerSign: Mukjipa) -> GameResult {
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
        
        func decideMukjipaResult(by turn: Turn, userSign: Mukjipa, computerSign: Mukjipa) {
            printMukjipaResult(of: judgeMukjipaResult(userSign: userSign, computerSign: computerSign), by: turn)
        }
        
        func printMukjipaResult(of result: GameResult, by turn: Turn) {
            switch result {
            case .win, .lose:
                print("\(turn.turnResult)의 턴입니다")
                start(by: turn)
            case .draw:
                print("\(turn.turnResult)의 승리!")
                printSorts.printEndGame()
            }
        }
    }
}







