//
//  RockPaperScissors - main.swift
//  Created by Baem, Dragon
//  Copyright © yagom academy. All rights reserved.
// 

func validUserNumber() -> Int {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let userInput = readLine()
        
        if let userNumber = checkUserInput(userInput) {
            return userNumber
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func checkUserInput(_ userInput: String?) -> Int? {
    guard let userInput = userInput else { return nil }
    guard let userNumber = Int(userInput) else { return nil }
    if userNumber < 0 || userNumber >= 4 {
        return nil
    }
    return userNumber
}

func createRandomNumber() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

func compareUserWithComputer(_ user: Int, _ computer: Int) {
    switch (user, computer) {
    case (1, 2), (2, 3), (3, 1) :
        print("졌습니다!")
    case (1, 1), (2, 2), (3, 3) :
        print("비겼습니다!")
    default :
        print("이겼습니다!")
    }
}

func gameStart() {
    let userNumber = validUserNumber()

    if userNumber == 0 {
        print("게임 종료")
        return
    }
    let computerNumber = createRandomNumber()
    compareUserWithComputer(userNumber, computerNumber)
}

gameStart()
