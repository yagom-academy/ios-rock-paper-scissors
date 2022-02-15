//
//  RockPaperScissors - main.swift
//  Created by Doogie, Eddy
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func showMenu() {
    print("""
가위(1), 바위(2), 보(3)! <종료 : 0> :
""", terminator: " ")
    selectMenu()
}

func receiveNumber() -> Int {
    guard let inputNumber = readLine() else { return 5 }
    let userInput = convertNumber(inputNumber: inputNumber)
    return userInput
}

func convertNumber(inputNumber: String) -> Int {
    let trimmedNumber = inputNumber.trimmingCharacters(in: .whitespaces)
    guard let numberToInt = Int(trimmedNumber) else { return 5 }
    return numberToInt
}

func selectMenu() {
    let number = receiveNumber()
    switch number {
    case 0:
        print("게임 종료")
        break
    case 1:
        print("1")
    case 2:
        print("2")
    case 3:
        print("3")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        showMenu()
    }
}
