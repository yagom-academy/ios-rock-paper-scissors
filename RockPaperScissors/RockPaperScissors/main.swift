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
    guard let userInput = userInput else {
        return nil
    }
    let trimedUserInput = userInput.split(separator: " ").joined()
    guard let userNumber = Int(trimedUserInput) else {
        return nil
    }
    
    if userNumber < 0 || userNumber >= 4 {
        return nil
    }
    
    return userNumber
}

func createRandomNumber() -> Int {
    let computerInput = Int.random(in: 1...3)
    
    return computerInput
}

func compareTwoInput(_ userNumber: Int, with computerNumber: Int) -> String {
    let user = RockScissorsPaper(rawValue: userNumber)
    let computer = RockScissorsPaper(rawValue: computerNumber)
    
    switch (user, computer) {
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors) :
        return "컴퓨터"
    case (.rock, .scissors), (.paper, .rock), (.scissors, .paper) :
        return "사용자"
    default :
        return "무승부"
    }
}

func checkResult(to userNumber: Int) -> String {
    let computerNumber = createRandomNumber()

    switch userNumber {
    case 1, 2, 3 :
        return compareTwoInput(userNumber, with: computerNumber)
    default :
        return "종료"
    }
}

func excuteSRP() -> String {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let userNumber = createUserNumber() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        let result = checkResult(to: userNumber)
        
        if result != "무승부" {
            return result
        }
    }
}

func excuteMJB(_ winner: String) -> String {
    while true {
        print("[\(winner)의 턴입니다] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        guard let userNumber = createUserNumber() else {
            return "컴퓨터"
        }
        let result = checkResult(to: userNumber)
        
        return result
    }
}

func startGame() {
    var winner = excuteSRP()
    
    if winner == "종료" {
        return
    }
    
    var gameResult = excuteMJB(winner)
    
    while true {
        switch gameResult {
        case "무승부" :
            print("\(winner)의 승리")
            return
        case "사용자" :
            winner = "사용자"
            gameResult = excuteMJB(winner)
        case "컴퓨터" :
            winner = "컴퓨터"
            gameResult = excuteMJB(winner)
        default :
            return
        }
    }
}

startGame()
