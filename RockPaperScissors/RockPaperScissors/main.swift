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
    
    if userNumber < 0 || userNumber >= 4 {
        return nil
    }
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

func compareTwoInput(_ userNumber: Int, _ computerNumber: Int) -> String {
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

func showResult(_ userNumber: Int) -> String {
    let computerNumber = createRandomNumber()
    print("컴퓨터값 : \(computerNumber)")
    switch userNumber {
    case 1, 2, 3 :
        return compareTwoInput(userNumber, computerNumber)
    default :
        return "종료"
    }
}

func excuteScissorsRockPaper() -> String {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = createUserNumber() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        let result = showResult(userNumber)
        
        if result != "무승부" {
            return result
        }
    }
}

func excuteRockScissorsPaper(_ whoIsWin: String) -> String {
    while true {
        print("[\(whoIsWin)의 턴입니다] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = createUserNumber() else {
            continue
        }
        let result = showResult(userNumber)
        return result
    }
}

func startGame() {
    var winner = excuteScissorsRockPaper()
    
    if winner == "종료" {
        return
    }
    var gameResult = excuteRockScissorsPaper(winner)
    
    while true {
        switch gameResult {
        case "무승부" :
            print("\(winner)의 승리")
            return
        case "사용자" :
            winner = "사용자"
            gameResult = excuteRockScissorsPaper(winner)
        case "컴퓨터" :
            winner = "컴퓨터"
            gameResult = excuteRockScissorsPaper(winner)
        default :
            return
        }
    }
}

startGame()
