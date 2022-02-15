//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func rockPaperScissorsGameStart() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
    let oneDigitComputerNumber = makeOneDigitComputerNumber()
    let userSelectedNumber = selectedUserGameMenuNumber()
    
//    switch userSelectedNumber {
//    case userSelectedNumber == oneDigitComputerNumber:
//        print("비겼습니다!")
//        case
//    }
}

func makeOneDigitComputerNumber() -> Int {
    let oneDigitComputerNumber = Int.random(in: 1...3)
    return oneDigitComputerNumber
}

func selectedUserGameMenuNumber() -> String {
    guard let userSelectedNumber = readLine() else { return "" }
    print(userSelectedNumber)
    print(type(of: userSelectedNumber))
    return userSelectedNumber
}

//func convertStringToInt(_ stringTypeComputerNumber: String) -> Int {
//    guard let convertedIntTypeElement = stringTypeComputerNumber.compactMap { Int($0) } else { return }
//    return convertedIntTypeElement
//}

selectedUserGameMenuNumber()
