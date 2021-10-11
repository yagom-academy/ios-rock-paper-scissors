//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var inputedChoice = ""

func playRockPaperScissors(){
    checkInvalid()
    
    switch inputedChoice {
    case "0": return
    case "1":
        break
    case "2":
        break
    case "3":
        break
    default:
        break
    }
}

func checkInvalid() {
    var isInvalid: Bool = true
    
    while isInvalid{
        printRockPaperScissors()
        isInvalid = receiveInput()
    }
}

func receiveInput() -> Bool {
    if let a = readLine() {
        inputedChoice = a
    }
    
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
