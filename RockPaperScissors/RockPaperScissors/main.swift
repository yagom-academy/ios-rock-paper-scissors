//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
}

func startGame() {
    printMenu()
    inputSelectionCard()
}

func makeRandomCard() -> String {
    let randomCard: String = String(Int.random(in: 1...3))
    return randomCard
}

func inputSelectionCard() {
    let userInput: String? = readLine()
    switch userInput {
    case "1": print("가위")
    case "2": print("바위")
    case "3": print("보")
    case "0": return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}
