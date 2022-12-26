//  RockPaperScissors - main.swift
//  Created by vetto, songjun on 2022.12.26

import Foundation


func makeRandomComputerHand() -> String {
    return String(Int.random(in: 1...3))
}

func inputUserHand() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let userHand = readLine() else {
        return ""
    }
    
    return userHand
}

// 승부를 결정 짓다
func compareHand(computerHand: Int, userHand: Int) -> String {
    let result: Int = userHand - computerHand
    let status: String
    
    if result == 0 {
        status = "Draw"
    } else if result == -2 || result == 1 {
        status = "Win"
    } else {
        status = "Lose"
    }
    
    return status
}
