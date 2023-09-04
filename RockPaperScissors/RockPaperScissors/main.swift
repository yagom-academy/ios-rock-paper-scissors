//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func getRandomNumber() -> Int {
    return Int.random(in: 1...3)
}

func contendUserAndComputer(_ userChoice: Int, _ computerChoice: Int) -> Bool {
    if (userChoice == 1 && computerChoice == 3) || (userChoice == 2 && computerChoice == 1) || (userChoice == 3 && computerChoice == 2) {
        print("이겼습니다.")
        return true
    } else if userChoice == computerChoice {
        print("비겼습니다.")
        return false
    } else {
        print("졌습니다..")
        return true
    }
}

