//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Hand: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum PlayerType {
    case user
    case computer
}

enum GameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

var inputedChoice = ""

/*
 makerRandomNumber()
 enum -> 가위바위보
 가위바위보 판정
 판정 출력
 게임종료 출력
 
 */

// 조건 1..3 합치기
func playRockPaperScissors(){
    // computer value
    receiveVaildInput()
    if inputedChoice == "0" {
        return
    }
}

func receiveVaildInput() {
    var isInvalid: Bool = true
    
    while isInvalid {
        printRockPaperScissors()
        isInvalid = isValidInput()
    }
}

func receiveInput() {
    if let a = readLine() {
        inputedChoice = a
    }
}

func isValidInput() -> Bool {
    receiveInput()
    switch inputedChoice {
    case "0", "1", "2", "3":
        return false
    default:
        printErrorMessage()
        return true
    }
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printRockPaperScissors(){
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeRandomNumber() -> Int {
    return Int.random(in: 1...3)
}

playRockPaperScissors()



//func playMukChiPa(){}
