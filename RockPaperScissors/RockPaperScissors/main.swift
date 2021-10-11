//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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

playRockPaperScissors()



//func playMukChiPa(){}
