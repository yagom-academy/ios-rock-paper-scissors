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
    
    func startGame() {
        printRockScissorsPaperMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeRockScissorsPaperUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeRockScissorsPaperComputerSign() else { return }
            
            let result = decideResult(userSign: userInput, computerSign: computerInput)
            printResult(of: result)
            decideTurn(by: result)
        default:
            printInvalidResult()
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
    
    func startMookJjiPpa(by turn: Turn) {
        printMookJjiPpaMenu(by: turn)
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeMookJjiPpaUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeMookJjiPpaComputerSign() else { return }
            
            decideMookJjiPpaResult(by: turn, userSign: userInput, computerSign: computerInput)
        default:
            printInvalidResult()
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
            printEndGame()
        }
    }
}

extension RockScissorsPaperGame {
    func printRockScissorsPaperMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func printMookJjiPpaMenu(by turn: Turn) {
        print("[\(turn.turnResult) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    func printInvalidResult() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    func printResult(of result: GameResult) {
        print(result.message)
    }
    
    func printEndGame() {
        print("게임 종료")
    }
}


