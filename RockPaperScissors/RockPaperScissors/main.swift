//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum UserCards: Int {
    case rock = 1
    case scissors = 2
    case paper = 3
    case exit = 0
}

enum UserCardsError: Error {
    case error
}

var isGameStart: Bool = true

while isGameStart {
    do {
        try inputfirstMenu()
    } catch UserCardsError.error {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func inputfirstMenu() throws {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
    guard let inputNumber = readLine(),
          let user = Int(inputNumber),
          let userCards: UserCards = UserCards(rawValue: user) else {
        throw UserCardsError.error
    }

    switch userCards {
    case .rock, .scissors, .paper:
        compareCard(user, createRandomNumber())
        try inputfirstMenu()
    case .exit:
        print("게임 종료")
        isGameStart = false
    }
}

func createRandomNumber() -> Int {
    let randomNumber = Int.random(in: 1...3)
    print(randomNumber)
    return randomNumber
}

func compareCard(_ user: Int, _ computer: Int) {
    let difference = (user - computer).magnitude
    //0,1,2,-1,-2
    
    //0 비김
    //1, -2 이김
    //2, -1 패배
    switch difference {
    case 1, 2:
        print("묵찌빠 게임")
    case 0:
        print("다시 가위바위보")
    default:
        return
    }
}

func decideTurn(_ user: Int, _ computer: Int) {
    var isWinner: Bool = true
    guard let user == 1 || user == -2 else {
        isWinner = false
        return
    }
}

func inputSecondMenu(_ isWinner: Bool) {
    var whosTurn: String
    
    if isWinner == true {
        whosTurn = "사용자 턴"
    } else {
        whosTurn = "컴퓨터 턴"
    }
    print("[\(whosTurn)] 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
    let card = readLine()
}
