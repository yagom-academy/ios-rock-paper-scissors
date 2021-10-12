//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let possibleInputRange = 1...3

enum Script: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case win = "이겼습니다!"
    case loose = "졌습니다!"
    case draw = "비겼습니다!"
    case gameEnd = "게임종료"
    case dismissedError = "잘못된 입력입니다. 다시 시도해주세요."
    case unknownError = "알 수 없는 오류가 발생하였습니다."
}

enum RockPaperScissorsError: Error {
    case dismissedError
    case unknownError
}

func inputingUserNumber(range: ClosedRange<Int> = possibleInputRange) throws -> Int {
    guard let input = readLine(), input != "" else {
        throw RockPaperScissorsError.dismissedError
    }
    
    let convertedInput = input.compactMap { Int(String($0)) }
    guard convertedInput.count == input.count else {
        throw RockPaperScissorsError.dismissedError
    }
    
    guard let firstItem = convertedInput.first else {
        throw RockPaperScissorsError.dismissedError
    }
    
    guard convertedInput.count == 1 && range ~= firstItem else {
        throw RockPaperScissorsError.dismissedError
    }
    
    return firstItem
}

func pullComputersRandomChoice(range: ClosedRange<Int> = possibleInputRange) -> Int {
    return Int.random(in: range)
}

enum GameJudgement {
    case win
    case loose
    case draw
    case unknown
    
    mutating func convert(result: Int) {
        switch result {
        case -2, 1: self = .win
        case 2, -1: self = .loose
        case 0: self = .draw
        default: self = .unknown
        }
    }
}

func compareChoice(of user: Int, with computer: Int) -> GameJudgement {
    let evaluatedResult = user - computer
    var gameJudgement: GameJudgement = .unknown
    
    gameJudgement.convert(result: evaluatedResult)
    
    return gameJudgement
}

func manageGame() {
    do {
        try startGame()
    } catch RockPaperScissorsError.dismissedError {
        print(Script.dismissedError.rawValue)
        manageGame()
    } catch RockPaperScissorsError.unknownError {
        print(Script.unknownError.rawValue)
        manageGame()
    } catch {
        print(error)
    }
    
    print(Script.gameEnd.rawValue)
}

func startGame() throws {
    var isGameRunning = true
    
    while isGameRunning {
        print(Script.menu.rawValue, terminator: "")
        
        let userPair = try inputingUserNumber()
        if userPair == 0 {
            isGameRunning = false
            break
        }
        
        let computerPair = pullComputersRandomChoice()
        let gameResult = compareChoice(of: userPair, with: computerPair)
        
        switch gameResult {
        case .win:
            print(Script.win.rawValue)
            isGameRunning = false
        case .loose:
            print(Script.loose.rawValue)
            isGameRunning = false
        case .draw:
            print(Script.draw.rawValue)
        case .unknown:
            throw RockPaperScissorsError.unknownError
        }
    }
}

manageGame()
