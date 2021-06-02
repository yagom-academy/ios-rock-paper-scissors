//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorsPaper: Int {
    case scissors = 1
    case rock
    case paper
    
    
}

enum Winner {
    case user
    case computer
    case tie
    
    var resultMessage: String {
        switch self {
        case .user:
            return "이겼습니다!"
        case .computer:
            return "졌습니다!"
        case .tie:
            return "비겼습니다!"
        }
    }
}

struct Game {
    func inputFromUser() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), let number = Int(input), (0...3).contains(number) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
        return number
    }
    
    func whoIsWinner(userChoice: RockScissorsPaper , computerChoice: RockScissorsPaper) -> Winner {
        enum ValueDifference: Int {
            case tie
            case win
            case lose
        }
        let valueDifference = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        switch valueDifference {
        case ValueDifference.win.rawValue:
            return Winner.user
        case ValueDifference.lose.rawValue:
            return Winner.computer
        default:
            return Winner.tie
        }
    }
    
    func printGameResult(winner result: Winner) {
        print(result.resultMessage)
    }
    
    func playRound(userInput: Int) {
        guard let userChoice = RockScissorsPaper(rawValue: userInput),
              let computerChoice = RockScissorsPaper(rawValue: Int.random(in: 1...3))
        else {
            return
        }
        let result = whoIsWinner(userChoice: userChoice, computerChoice: computerChoice)
        printGameResult(winner: result)
        start()
    }
    
    func isGameEnd(userInput: Int) -> Bool {
        return userInput == 0
    }
    
    func start() {
        let userInput = inputFromUser()
        if isGameEnd(userInput: userInput) {
            print("게임 종료")
            return
        }
        playRound(userInput: userInput)
    }
}

let game = Game()
game.start()
