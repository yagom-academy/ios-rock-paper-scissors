//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Player {
    case computer
    case user
}

enum GameNotice: String {
    case getInput = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case theEnd = "게임 종료"
    
    func printNotice() {
        switch self {
        case .getInput:
            print(self.rawValue, terminator: " : ")
        default:
            print(self.rawValue)
        }
    }
}

enum MatchResult: String {
    case computerWins = "졌습니다."
    case userWins = "이겼습니다."
    case draw = "비겼습니다."
    case stop
    
    func printResult() {
        print(self.rawValue)
    }
}

enum PlayerOption {
    case scissor
    case rock
    case paper
    case stop
    case none
    
    init(_ number: String) {
        switch number {
        case "0":
            self = .stop
        case "1":
            self = .scissor
        case "2":
            self = .rock
        case "3":
            self = .paper
        default:
            self = .none
        }
    }
    
    init(_ number: Int) {
        switch number {
        case 0:
            self = .stop
        case 1:
            self = .scissor
        case 2:
            self = .rock
        case 3:
            self = .paper
        default:
            self = .none
        }
    }
}

func runGame() {
    var matchResult: MatchResult
    
    repeat {
        matchResult = doRockPaperScissors()
    } while matchResult == .draw
    
    GameNotice.theEnd.printNotice()
}

func doRockPaperScissors() -> MatchResult {
    GameNotice.getInput.printNotice()
    
    let computersHand: PlayerOption = generateRandomHand()
    var (usersHand, isValidInput) = receiveUsersInput()
    
    while isValidInput == false {
        GameNotice.wrongInput.printNotice()
        GameNotice.getInput.printNotice()
        (usersHand, isValidInput) = receiveUsersInput()
    }
    
    guard usersHand != .stop else {
        return MatchResult.stop
    }
    
    let matchResult = decideWinner(between: computersHand, and: usersHand)
    matchResult.printResult()
    return matchResult
}

func generateRandomHand() -> PlayerOption {
    let randomNumber: Int = Int.random(in: 1...3)
    
    return PlayerOption(randomNumber)
}

func receiveUsersInput() -> (PlayerOption, Bool) {
    guard let userInput = readLine() else {
        return (.none, false)
    }
    
    let isValidInput = verify(userInput: userInput)
    let usersHand = PlayerOption(userInput)
    
    return (usersHand, isValidInput)
}

func convertToInteger(from userInput: String) -> Int? {
    return Int(userInput)
}

func verify(userInput: String) -> Bool {
    guard let integerUserInput = convertToInteger(from: userInput) else {
        return false
    }
    
    return (0...3).contains(integerUserInput)
}

func decideWinner(between computersHand: PlayerOption, and usersHand: PlayerOption) -> MatchResult {
    if computersHand == usersHand {
        return MatchResult.draw
    }
    
    switch (computersHand, usersHand) {
    case (.rock, .scissor), (.scissor, .paper), (.paper, .rock):
        return MatchResult.computerWins
    case (.rock, .paper), (.scissor, .rock), (.paper, .scissor):
        return MatchResult.userWins
    default:
        return MatchResult.draw
    }
}

runGame()
