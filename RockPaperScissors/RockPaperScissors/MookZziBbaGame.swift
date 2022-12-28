//  RockPaperScissors - MookZziBba.swift
//  Created by vetto, songjun on 2022.12.28.

import Foundation

func printTurnAndMenu(winner: Winner) {
    print("[\(winner)턴]묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
}

func inputUserNumber2() -> Int {
    guard let userInput = readLine() else {
        return inputUserNumber()
    }
    guard let userNumber = Int(userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return inputUserNumber()
    }
    return userNumber
}
