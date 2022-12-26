//
//  RockPaperScissors - main.swift
//  Created by 레옹아범, Rhode, Rowan
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum InputError: Error {
    case invalidInput = "잘못된 입력입니다. 다시 시도해주세요"
}

func displayMenu() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    print(menuMessage, terminator: "")
}

func readInput() -> Result<Int, InputError> {
    var result: Result<Int, InputError>
    
    guard let value = Int(readLine()) else {
        return result.failure(.invalidInput)
    }
    
    switch value {
    case 0...3:
        return result.success(value)
    default:
        return result.failure(.invalidInput)
    }
}

func generateRockPaperScissors() -> Int {
    return Int.random(in: 1...3)
}

func decideWinner(user: Int, computer: Int) -> String {
    var winner: String = ""
    
    if user > computer {
        if user == 3 && computer == 1 {
            winner = "컴퓨터"
        }
        winner = "사용자"
    } else if user < computer {
        if user == 1 && computer == 3 {
            winner = "사용자"
        }
        winner = "컴퓨터"
    }
    
    return winner
}
