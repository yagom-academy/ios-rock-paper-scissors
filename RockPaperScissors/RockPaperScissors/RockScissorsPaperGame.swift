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
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func printInvalidInput() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    func printEndGame() {
        print("게임 종료")
    }       // 함수 나중에 재사용
    
    func startGame() {
        printMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeComputerSign() else { return }
            
            let result = decideResult(userSign: userInput, computerSign: computerInput)
            printResult(of: result)
            abc(of: result)
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
    
    func printResult(of result: GameResult) {
        print(result.message)
    }
    
    func abc (of result: GameResult) {
    switch result {
        case .win:
            startMookJjiPpa(by: Turn.userTurn)
        case .lose:
            startMookJjiPpa(by: Turn.computerTurn)
        case .draw:
            startGame()
        }
    }
    
    func printMookJjiPpa(whose turn: Turn) {
        print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    func startMookJjiPpa(by turn: Turn) {
        printMookJjiPpa(whose: turn)
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeComputerSign() else { return }
            
            decideResult2(turn: turn, userSign: userInput, computerSign: computerInput)
        default:
            printInvalidInput()
            startMookJjiPpa(by: .computerTurn)
        }
    }
    
    func decideResult2(turn: Turn, userSign: RockScissorsPaper, computerSign: RockScissorsPaper) {
        printResult2(of: decideResult(userSign: userSign, computerSign: computerSign), turn: turn)
    }
    
    func printResult2(of result: GameResult, turn: Turn) {
        switch result {
        case .win:
            print("\(Turn.userTurn.rawValue)의 턴입니다")
            startMookJjiPpa(by: Turn.userTurn)
        case .lose:
            print("\(Turn.computerTurn.rawValue)의 턴입니다")
            startMookJjiPpa(by: Turn.computerTurn)
        case .draw:
            print("\(turn.rawValue)의 승리!")
            printEndGame()
        }
    }
}
