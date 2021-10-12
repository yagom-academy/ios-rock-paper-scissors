//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Sign: Int, CaseIterable
{
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
    
    // generateRandomElement란 이름은 어떨까?
    static func generateRandom() -> Self {
        guard let randomSign = self.allCases.randomElement() else {
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

func printInputError() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func getUserInput() -> Int? {
    guard let userInput = readLine()?.replacingOccurrences(of: " ", with: "") else { return nil }
    return Int(userInput)
}
