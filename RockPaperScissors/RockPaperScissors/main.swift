//
//  RockPaperScissors - main.swift
//  Created by Baem, Dragon
//  Copyright © yagom academy. All rights reserved.
// 

func createUserNumber() -> Int? {
    let userInput = readLine()
    
    if let userNumber = checkUserInput(userInput) {
        return userNumber
    } else {
        return nil
    }
}

func checkUserInput(_ userInput: String?) -> Int? {
    guard let userInput = userInput else { return nil }
    let trimedUserInput = userInput.split(separator: " ").joined()
    
    guard let userNumber = Int(trimedUserInput) else { return nil }
    return userNumber
}

func createRandomNumber() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

enum RockScissorsPaper: Int {
    case scissors = 1
    case rock
    case paper
}

func compareTwoInput(_ userNumber: Int, _ computerNumber: Int) {
    let user = RockScissorsPaper(rawValue: userNumber)
    let computer = RockScissorsPaper(rawValue: userNumber)
    
    switch (user, computer) {
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors) :
        print("졌습니다!")
    case (.rock, .scissors), (.paper, .rock), (.scissors, .paper) :
        print("이겼습니다!")
    default :
        print("비겼습니다!")
        excuteRockScissorsPaper()
    }
}

func excuteRockScissorsPaper() {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let userNumber = createUserNumber() else { continue }
        
        switch userNumber {
        case 1, 2, 3 :
            let computerNumber = createRandomNumber()
            compareTwoInput(userNumber, computerNumber)
            return
        case 0 :
            print("종료")
            return
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

excuteRockScissorsPaper()
