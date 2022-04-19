//
//  StartGame.swift
//  RockPaperScissors
//
//  Created by 김동용 on 2022/04/19.
//
import Foundation

struct RockScissorsPaperGame {
    
    enum Numbers {
        static let range = 1...3
    }
    
    func startGame() {
        printMenu()
        let checkNumber = inputNumber()
        guard checkNumber != 0 else { return print("게임 종료") }
        let userInput = RockScissorsPaper(rawValue: checkNumber)
        guard let rps = userInput else { return printInvalidInput() }
        switch rps {
        case .scissors, .rock, .paper:
            printResult(result: fetchResult(userChoice: rps))
        }
    }
    
    func printInvalidInput() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func inputNumber() -> Int {
        guard let userNumber = readLine()?.trimmingCharacters(in: .whitespaces) else { return -1 }
        guard let number = Int(userNumber) else { return -1 }
        return number
    }
    
    func makeComputerNumber() -> Int {
        let computerRandomNumber = Int.random(in: Numbers.range)
        return computerRandomNumber
    }
    
    func fetchResult(userChoice: RockScissorsPaper) -> GameResult {
        let computerChoice = RockScissorsPaper(rawValue: makeComputerNumber())
        if computerChoice == userChoice {
            return .draw
        } else if computerChoice == .scissors && userChoice == .rock {
            return .lose
        } else if computerChoice == .rock && userChoice == .scissors {
            return .lose
        } else if computerChoice == .paper && userChoice == .rock {
            return .lose
        } else {
            return .win
        }
    }
    
    func printResult(result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
            print("게임 종료")
        case .lose:
            print("졌습니다!")
            print("게임 종료")
        case .draw:
            print("비겼습니다!")
            startGame()
        }
    }
}
