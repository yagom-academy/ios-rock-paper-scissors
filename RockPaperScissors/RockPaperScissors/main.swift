//  RockPaperScissors - main.swift
//  Created by vetto, songjun on 2022.12.26

import Foundation


func makeRandomComputerHand() -> Int {
    return Int.random(in: 1...3)
}

func inputUserHand() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    guard let userInput readLine() else {
        return inputUserHand()
    }
   
    return userHand
}

func checkValidHand(userHand: String) -> Bool {
    guard let userHand = Int(userHand) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return false
    }
    
    let numberRange = 0...3
    if numberRange.contains(userHand) {
        return true
    } else {
        //MARK: 프린트문 처리 어디다 할지 정하기
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return false
    }
}

func compareHand(computerHand: Int, userHand: Int) -> String {
    let result: Int = userHand - computerHand
    let status: String
    
    if result == 0 {
        status = "비겼습니다!"
    } else if result == -2 || result == 1 {
        status = "이겼습니다!"
    } else {
        status = "졌습니다!"
    }
    
    return status
}

func startGame() {
    let computerHand = makeRandomComputerHand()
    inputUserHand()
}
