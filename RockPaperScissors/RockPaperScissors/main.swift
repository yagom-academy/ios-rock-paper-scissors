//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printRockScissorPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
}

func getUserNumber() -> Int {
    guard let input = readLine() else { return 0 }
    guard let userNumber = Int(input) else { return 0 }
    return userNumber
}

