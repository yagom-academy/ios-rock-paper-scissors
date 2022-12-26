//  RockPaperScissors - main.swift
//  Created by vetto, songjun on 2022.12.26

import Foundation


func makeRandomComputerHand() -> Int {
    return Int.random(in: 1...3)
}

func inputUserHand() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let userHand = readLine() else {
        return
    }
    
    return userHand
}
