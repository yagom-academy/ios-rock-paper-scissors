//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let scissor = 1
let rock = 2
let paper = 3

func playRockPaperScissors() {
    let computerNumber = Int.random(in: 1...3)
    
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator:"")
    
    if let inputUserNumber = readLine() {
        switch Int(inputUserNumber) {
        case 0:
            print("게임 종료")
            return
        case 1, 2, 3:
            gameResult(userNumber: Int(inputUserNumber)!, computerNumber: computerNumber)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            playRockPaperScissors()
        }
    }
}

func gameResult(userNumber: Int, computerNumber: Int) {
    if(userNumber == computerNumber) {
        print("비겼습니다!")
        playRockPaperScissors()
    } else {
        switch computerNumber {
        case scissor:
            if(userNumber == rock) { print("이겼습니다!") }
            else if(userNumber == paper) { print("졌습니다!") }
        case rock:
            if(userNumber == paper) { print("이겼습니다!") }
            else if(userNumber == scissor) { print("졌습니다!") }
        default:
            if(userNumber == scissor) { print("이겼습니다!") }
            else if(userNumber == rock) { print("졌습니다!") }
        }
    }
}

playRockPaperScissors()

