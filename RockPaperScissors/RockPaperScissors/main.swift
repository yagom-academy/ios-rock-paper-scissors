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
}

func receiveNumber() -> Int {
    guard let inputNumber = readLine() else { return 5 }
    if checkInputNumber(userNumber: inputNumber).bool == true {
        return checkInputNumber(userNumber: inputNumber).userNumber ?? 5
    } else {
        return 5
    }
}

func checkInputNumber(userNumber: String) -> (bool: Bool, userNumber: Int?) {
    let trimmedNumber = userNumber.trimmingCharacters(in: .whitespaces)
    guard let numberToInt = Int(trimmedNumber) else { return (false, nil) }
    if numberToInt < 0 || numberToInt > 3 {
        return (false, nil)
    }
    return (true, numberToInt)
}

