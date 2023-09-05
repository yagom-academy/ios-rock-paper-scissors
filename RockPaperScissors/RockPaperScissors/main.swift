//
//  RockPaperScissors - main.swift
//  Created by Hisop, 쥬봉이
//  Copyright © yagom academy. All rights reserved.
// 

@discardableResult
func startGame(isContinous: Bool) -> Bool {
    guard isContinous else {
        return false
    }

    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")

    guard let userChoice = readLine() else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startGame(isContinous: true)
    }
    
    switch userChoice {
    case "1", "2", "3":
        startGame(isContinous: compareWithComputer(userChoice: userChoice))
    case "0":
        print("게임 종료")
        break
    default:
        startGame(isContinous: true)
    }
    return false
}

func compareWithComputer(userChoice: String) -> Bool {
    let computerChoice: String = String(Int.random(in: 1...3))
    
    guard computerChoice != userChoice else {
        print("비겼습니다!")
        return true
    }
    
    guard (computerChoice == "1" && userChoice == "3") ||
            (computerChoice == "2" && userChoice == "1") ||
            (computerChoice == "3" && userChoice == "2") else {
        print("이겼습니다!")
        return false
    }
    
    print("졌습니다!")
    return false
}

startGame(isContinous: true)
