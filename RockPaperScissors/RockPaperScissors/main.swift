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
    compareNumber()
}

func compareNumber() {
    guard let userNumber = selectMenu() else { return }
    let computerRandomNumber = makeRandomNumber()
    if userNumber == computerRandomNumber {
        print("비겼습니다!")
        showMenu()
    } else if (userNumber == 1 && computerRandomNumber == 3) || (userNumber == 2 && computerRandomNumber == 1) || (userNumber == 3 && computerRandomNumber == 2) {
        print("이겼습니다!")
        print("게임 종료")
    } else if (userNumber == 1 && computerRandomNumber == 2) || (userNumber == 2 && computerRandomNumber == 3) || (userNumber == 3 && computerRandomNumber == 1) {
        print("졌습니다!")
        print("게임 종료")
    }
}

func selectMenu() -> Int? {
    let number = receiveNumber()
    switch number {
    case 0:
        print("게임 종료")
    case 1, 2, 3:
        return number
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        showMenu()
    }
    return nil
}

func receiveNumber() -> Int? {
    guard let inputNumber = readLine() else { return nil }
    let userInput = convertNumber(inputNumber: inputNumber)
    return userInput
}

func convertNumber(inputNumber: String) -> Int? {
    let trimmedNumber = inputNumber.trimmingCharacters(in: .whitespaces)
    guard let numberToInt = Int(trimmedNumber) else { return nil }
    return numberToInt
}

func makeRandomNumber() -> Int {
    let computerRandomNumber = Int.random(in: 1...3)
    return computerRandomNumber
}

showMenu()
