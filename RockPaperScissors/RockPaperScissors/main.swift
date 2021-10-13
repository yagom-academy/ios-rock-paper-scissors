//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let possibleInputRange = 0...3
let rockPaperScissorsRange = 1...3

var isGameRunning = true

enum Script: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case win = "이겼습니다!"
    case loose = "졌습니다!"
    case draw = "비겼습니다!"
    case gameEnd = "게임 종료"
    case dismissedError = "잘못된 입력입니다. 다시 시도해주세요."
    case unknownError = "알 수 없는 오류가 발생하였습니다."
}

enum RockPaperScissorsError: Error {
    case dismissedError
}

func receiveUserNumber(in range: ClosedRange<Int> = possibleInputRange) throws -> Int {
    guard let input = readLine(), input != "" else {
        throw RockPaperScissorsError.dismissedError
    }
    
    let filteredInput = input.compactMap { Int(String($0)) }
    guard filteredInput.count == input.count else {
        throw RockPaperScissorsError.dismissedError
    }
    
    guard let userNumber = filteredInput.first else {
        throw RockPaperScissorsError.dismissedError
    }
    
    guard filteredInput.count == 1 && range ~= userNumber else {
        throw RockPaperScissorsError.dismissedError
    }
    
    return userNumber
}

func pullComputersHandPose(in range: ClosedRange<Int> = rockPaperScissorsRange) -> Int {
    return Int.random(in: range)
}

enum RockPaperScissorsJudgement {
    case win
    case loose
    case draw
    case unknown
    
    mutating func matchResult(with number: Int) {
        switch number {
        case -2, 1:
            self = .win
        case 2, -1:
            self = .loose
        case 0:
            self = .draw
        default:
            self = .unknown
        }
    }
}

func checkUserGameResult(_ user: Int, with computer: Int) -> RockPaperScissorsJudgement {
    let comparison = user - computer
    
    var gameResult: RockPaperScissorsJudgement = .unknown
    gameResult.matchResult(with: comparison)
    
    return gameResult
}

func manageRockPaperScissorsGame() {
    while isGameRunning == true {
        do {
            try startRockPaperScissorsGame()
        } catch RockPaperScissorsError.dismissedError {
            print(Script.dismissedError.rawValue)
        } catch {
            print(Script.unknownError.rawValue)
        }
    }
    
    print(Script.gameEnd.rawValue)
}

func startRockPaperScissorsGame() throws {
        while isGameRunning {
        print(Script.menu.rawValue, terminator: "")
        
        let userHandPose = try receiveUserNumber()
        if userHandPose == 0 {
            isGameRunning = false
            break
        }
        
        let computerHandPose = pullComputersHandPose()
        let gameResult = checkUserGameResult(userHandPose, with: computerHandPose)
        
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
            print(Script.unknownError.rawValue)
        }
    }
}

manageRockPaperScissorsGame()
