//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Sign: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    var counter: Self {
        switch self {
        case .scissors:
            return .rock
        case .paper:
            return .scissors
        case .rock:
            return .paper
        }
    }
    
    static func generateRandom() -> Self {
        guard let randomSign = Self(rawValue: Int.random(in: 1...3)) else {
            fatalError("\(#function) 함수에서 랜덤값을 생성하는 데에 오류가 발생했습니다")
        }
        return randomSign
    }
}

enum GameResult {
    case userWin
    case computerWin
    case draw
    
    var message: String {
        switch self {
        case .userWin:
            return "이겼습니다!"
        case .computerWin:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
}

func checkWinner(userSign: Sign, computerSign: Sign) -> GameResult {
    if userSign == computerSign.counter {
        return .userWin
    } else if userSign == computerSign {
        return .draw
    } else {
        return .computerWin
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
}

func getUserInput() -> String {
    guard let userInput = readLine() else { return "" }
    return userInput.replacingOccurrences(of: " ", with: "")
}
