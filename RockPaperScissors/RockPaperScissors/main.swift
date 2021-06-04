//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int {
    case scissors = 1
    case rock
    case paper
}

enum Turn: String {
    case notDecided = ""
    case user = "사용자"
    case computer = "컴퓨터"
}

struct Game {
    enum ValueDifference: Int {
        case tie
        case win
        case lose
    }
    
    var turn = Turn.notDecided
    
    func isValid(number: Int) -> Bool {
        let exitNumber = 0
        return RockPaperScissors(rawValue: number) != nil || number == exitNumber
    }

    func printInputMessage() {
        if turn == .notDecided {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        } else {
            print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        }
    }

    func inputFromUser() -> Int {
        printInputMessage()
        guard let input = readLine(), let number = Int(input), isValid(number: number) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
        return number
    }
    
    mutating func playRockPaperScissors(userChoice: RockPaperScissors ,computerChoice: RockPaperScissors) -> String {
        let valueDifference = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        var resultMessage: String
        switch valueDifference {
        case ValueDifference.win.rawValue:
            turn = .user
            resultMessage = "이겼습니다!"
        case ValueDifference.lose.rawValue:
            turn = .computer
            resultMessage = "졌습니다!"
        default:
            turn = .notDecided
            resultMessage = "비겼습니다!"
        }
        return resultMessage
    }
    
    mutating func playMukjjibba(userChoice: RockPaperScissors, computerChoice: RockPaperScissors) -> String {
        let valueDifference = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        var resultMessage: String
        switch valueDifference {
        case ValueDifference.win.rawValue:
            turn = .user
            resultMessage = "\(turn.rawValue)의 턴입니다!"
        case ValueDifference.lose.rawValue:
            turn = .computer
            resultMessage = "\(turn.rawValue)의 턴입니다!"
        default:
            resultMessage = "\(turn.rawValue)의 승리!"
            turn = .notDecided
        }
        return resultMessage
    }
    
    mutating func play(userChoice: RockPaperScissors, computerChoice: RockPaperScissors) {
        let resultMessage: String
        if turn == .notDecided {
            resultMessage = playRockPaperScissors(userChoice: userChoice, computerChoice: computerChoice)
        } else {
            resultMessage = playMukjjibba(userChoice: userChoice, computerChoice: computerChoice)
        }
        print(resultMessage)
    }

    func isGameEnd(userInput: Int) -> Bool {
        return userInput == 0
    }
    
    mutating func start() {
        let userInput = inputFromUser()
        if isGameEnd(userInput: userInput) {
            print("게임 종료")
            return
        }
        guard let userChoice = RockPaperScissors(rawValue: userInput),
              let computerChoice = RockPaperScissors(rawValue: Int.random(in: 1...3))
        else {
            return
        }
        play(userChoice: userChoice, computerChoice: computerChoice)
        start()
    }
}

var game = Game()
game.start()

