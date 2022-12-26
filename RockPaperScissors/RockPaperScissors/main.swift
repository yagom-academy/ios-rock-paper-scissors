//
//  RockPaperScissors - main.swift
//  Created by 레옹아범, Rhode, Rowan
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum InputError: String, Error {
    case invalidInput = "잘못된 입력입니다. 다시 시도해주세요"
}

func displayMenu() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    print(menuMessage, terminator: "")
}

func readInput() -> Result<Int, InputError> {
    guard let value = readLine() else {
        return .failure(.invalidInput)
    }
    guard let intValue = Int(value) else {
        return .failure(.invalidInput)
    }
    
    switch intValue {
    case 0...3:
        return .success(intValue)
    default:
        return .failure(.invalidInput)
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
        } else {
            winner = "사용자"
        }
    } else if user < computer {
        if user == 1 && computer == 3 {
            winner = "사용자"
        } else {
            winner = "컴퓨터"
        }
    }
    
    return winner
}

func startGame() {
    displayMenu()
    
    var userChoice = readInput()
    let computerChoice = generateRockPaperScissors()
    var winner: String = "-1"
    
    switch userChoice {
    case .success(let intValue):
        winner = decideWinner(user: intValue, computer: computerChoice)
    case .failure(let error):
        print(error.rawValue)
        startGame()
    }
    
    if winner == "사용자" {
        print("이겼습니다!")
    } else if winner == "컴퓨터" {
        print("졌습니다!")
    } else if winner == ""{
        print("비겼습니다!")
        startGame()
    }
}


startGame()
