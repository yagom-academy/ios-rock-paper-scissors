//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var userNumber: String = ""
let computerNumber = String(Int.random(in: 1...3))

func selectGameMenu() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func checkValidity() -> String {
    userNumber = selectGameMenu()
    let arrayOfValidNumbers = ["0", "1", "2", "3"]
    if arrayOfValidNumbers.contains(userNumber) {
        return userNumber
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return checkValidity()
    }
}

func checkStartGame() {
    let result = checkValidity()
    if result == "0" {
        print("게임 종료")
        return
    } else {
        decideWinner()
    }
}

func decideWinner() {
    let indexArray = ["1","2","3","1"]
    guard let computerIndex = indexArray.firstIndex(of: computerNumber).map({Int($0)}) else { return }
    guard let userIndex = indexArray.firstIndex(of: userNumber).map({Int($0)}) else { return }
    if userIndex == computerIndex + 1 {
        print("이겼습니다!\n게임 종료")
    } else if userIndex == computerIndex {
        print("비겼습니다!")
    } else {
        print("졌습니다!\n게임 종료")
    }
}

print(checkStartGame())
