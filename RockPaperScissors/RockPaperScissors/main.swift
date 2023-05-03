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
    case exit
}

while true {
    do {
        try inputMenu()
    } catch UserCardsError.error {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    } catch UserCardsError.exit {
        break
    }
}

func inputMenu() throws {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
    guard let inputNumber = readLine(),
          let user = Int(inputNumber),
          let userCards: UserCards = UserCards(rawValue: user) else {
        throw UserCardsError.error
    }

    switch userCards {
    case .rock, .scissors, .paper:
        compareCard(user, createRandomNumber())
        try inputMenu()
    case .exit:
        print("게임 종료")
        throw UserCardsError.exit
    }

}
func createRandomNumber() -> Int {
    let randomNumber = Int.random(in: 1...3)
    print(randomNumber)
    return randomNumber
}

func compareCard(_ user: Int, _ computer: Int) {
    let absolute = (user - computer).magnitude
    
    if user == computer {
        print("비겼습니다!")
    } else if (absolute == 2) && (user == 1) {
        print("이겼습니다!")
    } else if (absolute == 2) && (user == 3) {
        print("졌습니다!")
    } else if (user > computer) {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}
