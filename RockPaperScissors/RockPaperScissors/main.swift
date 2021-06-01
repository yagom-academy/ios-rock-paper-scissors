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
}

struct Game {
    var isPlaying = true
    
    func sanitize(number userInput: Int) -> Int {
        switch userInput {
        case 0...3:
            return userInput
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
    }
    
    func inputFromUser() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), let number = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
        return sanitize(number: number)
    }
    
    func whoIsWinner(user: RockScissorsPaper , computer: RockScissorsPaper) -> Winner {
        let valueDifference = user.rawValue - computer.rawValue
        
        switch valueDifference {
        case -2, 1:
            return Winner.user
        case 2, -1:
            return Winner.computer
        default:
            return Winner.tie
        }
    }
  
    func playRound(userInput: Int) {
        guard let userChoice = RockScissorsPaper(rawValue: userInput),
              let computerChoice = RockScissorsPaper(rawValue: Int.random(in: 1...3))
        else {
            return
        }
        let result = whoIsWinner(user: userChoice, computer: computerChoice)
        switch result {
        case Winner.user:
            print("이겼습니다!")
        case Winner.computer:
            print("졌습니다!")
        default:
            print("비겼습니다!")
        }
        start()
    }
    
    func start() {
        let userInput = inputFromUser()
//        let validatedNumber = validate(number: userInput)
        playRound(userInput: userInput)
    }
    
}

let game = Game()

game.start()
