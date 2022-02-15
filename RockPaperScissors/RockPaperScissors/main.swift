//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func selectGameMenu() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let userInput = readLine() else { return "" }

    return userInput
}

func checkValidity() -> String {
    let userNumber = selectGameMenu()
    let arrayOfValidNumbers = ["0", "1", "2", "3"]
    if arrayOfValidNumbers.contains(userNumber) {
        return userNumber
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return selectGameMenu()
    }
}

func checkStartGame() {
    if checkValidity() == "0" {
        print("게임 종료")
        return
    } else {
        
    }
}

func decideWinner1() {
    let computerNumber = String(Int.random(in: 1...3))
    let userNumber = checkValidity()
    let tuple: (String, String) = (computerNumber, userNumber)
    switch tuple {
    case ("1","2"),("2","3"), ("3","1"):
        print("이겼습니다!")
    case ("1","1"), ("2","2"), ("3","3"):
        print("비겼습니다!")
    default:
        print("졌습니다!")
    }
}

func decideWinner2() {
    let computerNumber = String(Int.random(in: 1...3))
    let userNumber = checkValidity()
    let indexArray = ["1","2","3","1"]
    guard let computerIndex = indexArray.firstIndex(of: computerNumber).map({Int($0)}) else { return }
    guard let userIndex = indexArray.firstIndex(of: userNumber).map({Int($0)}) else { return }
    if userIndex == computerIndex + 1 {
        print("이겼습니다.")
    } else if userIndex == computerIndex {
        print("비겼습니다.")
    } else {
        print("졌습니다.")
}
}

print(decideWinner2())
