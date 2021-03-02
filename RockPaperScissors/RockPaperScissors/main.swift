//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
class RockPaperScissors {
    var userValue: Int = 0
    var computerValue: Int = 0
    
    func makeRandomNumber() {
        let newRandomNumber: Int = Int.random(in: 1...3)
        computerValue = newRandomNumber
    }
    func startGame() {
        makeRandomNumber()
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        userValue = Int(readLine()!)!
        compareNumber()
    } 
}
