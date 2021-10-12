//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var isGameOver = false

func startGame() {
    while isGameOver == false {
        printMenu()
        checkUserInput(input: receiveUserInput())
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func receiveUserInput() -> String {
    guard let input = readLine() else {
        return ""
    }
    
    return input
}

func checkUserInput(input: String) {
    switch input {
    case "0":
        GameOver()
    case "1","2","3":
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func printGameOver() {
    print("게임 종료")
}

func GameOver() {
    printGameOver()
    isGameOver = true
}

startGame()
