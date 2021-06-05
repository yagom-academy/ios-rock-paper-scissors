//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Game {
    enum RockPaperScissors: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }

    enum Turn: String {
        case notDecided
        case user = "사용자"
        case computer = "컴퓨터"
    }
    
    enum ValueDifference: Int {
        case tie = 0
        case win = 1
        case lose = 2
    }
    
    var turn: Turn = Turn.notDecided
    let wrongInputInMukjjibba: Int = -1
    
    func isValid(number: Int) -> Bool {
        let exitNumber: Int = 0
        return RockPaperScissors(rawValue: number) != nil || number == exitNumber
    }
    
    func isPlayingRockPaperScissors() -> Bool {
        return turn == .notDecided
    }
    
    func printInputMessage() {
        if isPlayingRockPaperScissors() {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        } else {
            print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        }
    }

    func inputFromUser() -> Int {
        printInputMessage()
        guard let input = readLine(), let number = Int(input), isValid(number: number) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return isPlayingRockPaperScissors() ? inputFromUser() : wrongInputInMukjjibba
        }
        return number
    }
    
    mutating func playRockPaperScissors(userChoice: RockPaperScissors, computerChoice: RockPaperScissors) -> String {
        let valueDifference: Int = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
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
        let valueDifference: Int = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        var resultMessage: String
        switch valueDifference {
        case ValueDifference.win.rawValue:
            turn = .user
            resultMessage = "\(turn.rawValue)의 턴입니다"
        case ValueDifference.lose.rawValue:
            turn = .computer
            resultMessage = "\(turn.rawValue)의 턴입니다"
        default:
            resultMessage = "\(turn.rawValue)의 승리!"
            turn = .notDecided
        }
        return resultMessage
    }
    
    func isRockPaperScissorsOrRightInput(userInput: Int) -> Bool {
        return isPlayingRockPaperScissors() || userInput != wrongInputInMukjjibba
    }
    
    func convertUserIntputIfMukjjibba(userInput: Int) -> Int {
        if isPlayingRockPaperScissors() {
            return userInput
        }
        switch userInput {
        case 1:
            return 2
        case 2:
            return 1
        default:
            return userInput
        }
    }
    
    mutating func play(userInput: Int) {
        guard isRockPaperScissorsOrRightInput(userInput: userInput) else {
            turn = .computer
            return
        }
        let userInputNumber: Int = convertUserIntputIfMukjjibba(userInput: userInput)
        guard let userChoice = RockPaperScissors(rawValue: userInputNumber),
              let computerChoice = RockPaperScissors(rawValue: Int.random(in: 1...3))
        else {
            return
        }
        let resultMessage: String
        if isPlayingRockPaperScissors() {
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
        let userInput: Int = inputFromUser()
        if isGameEnd(userInput: userInput) {
            print("게임 종료")
            return
        }
        play(userInput: userInput)
        start()
    }
}
var game: Game = Game()
game.start()

