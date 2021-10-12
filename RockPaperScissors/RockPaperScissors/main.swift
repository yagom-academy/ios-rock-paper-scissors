//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let possibleInputRange = 1...3

func inputingUserNumber(range: ClosedRange<Int> = possibleInputRange) -> Int {
    guard let input = readLine(), input != "" else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    let convertedInput = input.compactMap { Int(String($0)) }
    guard convertedInput.count == input.count else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    guard let firstItem = convertedInput.first else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    guard firstItem != 0 else {
        fatalError("게임 종료")
    }
    
    guard convertedInput.count == 1 && range ~= firstItem else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
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

func startGame() {
    var isGameRunning = true
    
    while isGameRunning {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        let userPair = inputingUserNumber()
        let computerPair = pullComputersRandomChoice()
        let gameResult = compareChoice(of: userPair, with: computerPair)
                
        switch gameResult {
        case .win:
            print("이겼습니다!")
            isGameRunning = false
        case .loose:
            print("졌습니다!")
            isGameRunning = false
        case .draw:
            print("비겼습니다!")
        case .unknown:
            fatalError("알 수 없는 오류가 발생하였습니다.")
        }
    }
    
    print("게임 종료")
}

startGame()
