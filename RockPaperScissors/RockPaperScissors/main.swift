//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func receiveUserInput() {
    printMenu()
    
    guard let input = readLine(), input != "0" else {
        print("게임 종료")
        return
    }
}

func checkUserInput(input: String) {
    switch input {
    case "0":
        print("게임 종료")
    case "1","2","3":
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}
