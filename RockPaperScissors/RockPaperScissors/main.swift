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

enum Turn {
    case none
    case user
    case computer
    
    var turnString: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        default:
            return ""
        }
    }
    
    func convertToWinner() -> Winner {
        if self == .user {
            return Winner.user
        } else {
            return Winner.computer
        }
    }
}

struct Game {
    enum ValueDifference: Int {
        case tie
        case win
        case lose
    }
    
    var turn = Turn.none
    
    func isValid(number: Int) -> Bool {
        let exitNumber = 0
        print("현재", number)
        return RockScissorsPaper(rawValue: number) != nil || number == exitNumber
    }

    func printInputMessage() {
        if turn == .none {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        } else {
            print("[\(turn.turnString) 턴] 가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
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

    mutating func returnRockPaperScissorsWinner(userChoice: RockScissorsPaper ,computerChoice: RockScissorsPaper) -> Winner {
        let valueDifference = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        switch valueDifference {
        case ValueDifference.win.rawValue:
            turn = .user
            return Winner.user
        case ValueDifference.lose.rawValue:
            turn = .computer
            return Winner.computer
        default:
            turn = .none
            return Winner.tie
        }
    }
    
    mutating func returnMukjjibbaWinner(userChoice: RockScissorsPaper, computerChoice: RockScissorsPaper) -> Winner {
        let valueDifference = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        switch valueDifference {
        case ValueDifference.win.rawValue:
            turn = .user
            return Winner.tie
        case ValueDifference.lose.rawValue:
            turn = .computer
            return Winner.tie
        default:
            let winner = turn.convertToWinner()
            turn = .none
        //비긴 경우 현재의 턴이 위너가 된다.
            return winner
        }
    }
    
    func printGameResult(winner result: Winner) {
        print(result.resultMessage)
    }
    
    mutating func playRound(userInput: Int) {
        guard let userChoice = RockScissorsPaper(rawValue: userInput),
              let computerChoice = RockScissorsPaper(rawValue: Int.random(in: 1...3))
        else {
            return
        }
        let result: Winner
        if turn == .none {
            result = returnRockPaperScissorsWinner(userChoice: userChoice, computerChoice: computerChoice)
        } else {
            result = returnMukjjibbaWinner(userChoice: userChoice, computerChoice: computerChoice)
        }
        
        printGameResult(winner: result)
        start()
    }
    
    func isGameEnd(userInput: Int) -> Bool {
        return userInput == 0
    }
    
    mutating func start() {
        print(turn)
        let userInput = inputFromUser()
        if isGameEnd(userInput: userInput) {
            print("게임 종료")
            return
        }
        playRound(userInput: userInput)
    }
}

var game = Game()
game.start()

