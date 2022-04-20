//
//  StartGame.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/19.
//
import Foundation

struct RockScissorsPaperGame {
    enum Numbers {
        static let range = 1...3
    }
    
    func printRockScissorsPaperMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func printMookJjiPpaMenu(by turn: Turn) {
        print("[\(turn.turnResult) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    func printInvalidInput() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    func printResult(of result: GameResult) {
        print(result.message)
    }
    
    func printEndGame() {
        print("게임 종료")
    }
    
    func startGame() {
        printRockScissorsPaperMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeComputerSign() else { return }
            
            let result = decideResult(userSign: userInput, computerSign: computerInput)
            printResult(of: result)
            decideTurn(by: result)
        default:
            printInvalidInput()
            startGame()
        }
    }
    
    func inputNumber() -> Int {
        guard let userNumber = readLine()?.trimmingCharacters(in: .whitespaces) else { return -1 }
        guard let number = Int(userNumber) else { return -1 }
        return number
    }
    
    func makeUserSign(userInput: Int) -> RockScissorsPaper? {
        let userSign = RockScissorsPaper(rawValue: userInput)
        return userSign
    }
    
    func makeComputerSign() -> RockScissorsPaper? {
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
    
    func decideTurn (by result: GameResult) {
        switch result {
        case .win:
            startMookJjiPpa(by: Turn.userTurn)
        case .lose:
            startMookJjiPpa(by: Turn.computerTurn)
        case .draw:
            startGame()
        }
    }
    
    func startMookJjiPpa(by turn: Turn) {
        printMookJjiPpaMenu(by: turn)
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeComputerSign() else { return }
            
            decideMookJjiPpaResult(by: turn, userSign: userInput, computerSign: computerInput)
        default:
            printInvalidInput()
            startMookJjiPpa(by: .computerTurn)
        }
    }
    
    func decideMookJjiPpaResult(by turn: Turn, userSign: RockScissorsPaper, computerSign: RockScissorsPaper) {
        printMookJjiPpaResult(of: decideResult(userSign: userSign, computerSign: computerSign), by: turn)
    }
    
    func printMookJjiPpaResult(of result: GameResult, by turn: Turn) {
        switch result {
        case .win, .lose:
            print("\(turn.turnResult)의 턴입니다")
            startMookJjiPpa(by: turn)
        case .draw:
            print("\(turn.turnResult)의 승리!")
            printEndGame()
        }
    }
}
