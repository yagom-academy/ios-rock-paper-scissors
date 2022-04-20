//
//  MookJjiPpa.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/20.
//
import Foundation


struct MookJjiPpaGame {
    enum Numbers {
        static let range = 1...3
    }
    
    let rpsGame = RockScissorsPaperGame()
    let printSorts = PrintSorts()
    
    func startGame() {
        printSorts.printRockScissorsPaperMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printSorts.printEndGame()
        case 1,2,3:
            guard let userInput = rpsGame.makeRockScissorsPaperUserSign(userInput: userChoiceNumber)
            else { return }
            guard let computerInput = rpsGame.makeRockScissorsPaperComputerSign()
            else { return }
            
            let result = rpsGame.decideResult(userSign: userInput, computerSign: computerInput)
            printSorts.printResult(of: result)
            decideTurn(by: result)
        default:
            printSorts.printInvalidResult()
            startGame()
        }
        
        func decideTurn (by result: GameResult) {
            switch result {
            case .win:
                startMookJjiPpa(by: Turn.user)
            case .lose:
                startMookJjiPpa(by: Turn.computer)
            case .draw:
                startGame()
            }
        }
        
        func inputNumber() -> Int {
            guard let userNumber = readLine()?.trimmingCharacters(in: .whitespaces)
            else { return -1 }
            guard let number = Int(userNumber)
            else { return -1 }
            return number
        }
        
        func startMookJjiPpa(by turn: Turn) {
            printSorts.printMookJjiPpaMenu(by: turn)
            let userChoiceNumber = inputNumber()
            
            switch userChoiceNumber {
            case 0:
                printSorts.printEndGame()
            case 1,2,3:
                guard let userInput = makeMookJjiPpaUserSign(userInput: userChoiceNumber)
                else { return }
                guard let computerInput = makeMookJjiPpaComputerSign()
                else { return }
                
                decideMookJjiPpaResult(by: turn, userSign: userInput, computerSign: computerInput)
            default:
                printSorts.printInvalidResult()
                startMookJjiPpa(by: .computer)
            }
        }
        
        func makeMookJjiPpaUserSign(userInput: Int) -> MookJjiPpa? {
            let userSign = MookJjiPpa(rawValue: userInput)
            return userSign
        }
        
        func makeMookJjiPpaComputerSign() -> MookJjiPpa? {
            let randomNumber = Int.random(in: Numbers.range)
            let computerRandomSign = MookJjiPpa(rawValue: randomNumber)
            return computerRandomSign
        }
        
        func judgeMookJjiPpaResult(userSign: MookJjiPpa, computerSign: MookJjiPpa) -> GameResult {
            if computerSign == userSign {
                return .draw
            } else if
                (computerSign == .jji && userSign == .mook) ||
                    (computerSign == .mook && userSign == .jji) ||
                    (computerSign == .ppa && userSign == .mook) {
                return .lose
            } else {
                return .win
            }
        }
        
        func decideMookJjiPpaResult(by turn: Turn, userSign: MookJjiPpa, computerSign: MookJjiPpa) {
            printMookJjiPpaResult(of: judgeMookJjiPpaResult(userSign: userSign, computerSign: computerSign), by: turn)
        }
        
        func printMookJjiPpaResult(of result: GameResult, by turn: Turn) {
            switch result {
            case .win, .lose:
                print("\(turn.turnResult)의 턴입니다")
                startMookJjiPpa(by: turn)
            case .draw:
                print("\(turn.turnResult)의 승리!")
                printSorts.printEndGame()
            }
        }
    }
}







