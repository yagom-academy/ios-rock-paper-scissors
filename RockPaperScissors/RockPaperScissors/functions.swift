//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//

import Foundation

func run() {
    print("가위(1), 바위(2), 보(3)! 종료<0> :")
    checkInput()
}

func checkInput() {
    let selectMode: String? = readLine()
    let mode: [String?] = ["1", "2", "3", "0"]

    if selectMode == "0" {
        print("게임 종료")
    } else if mode.contains(selectMode) {
        print(selectMode!)
    } else {
        print("잘못된 입력입니다. 다시 시도해 주세요.")
        return run()
    }
}

func selectRSP() -> String {
    let rspArray: [String] = ["1", "2", "3"]
    guard let selectedCase = rspArray.randomElement() else {
        return ""
    }
    return selectedCase
}

func compareRSP(of user: String, and computer: String) {
    print(user, computer)
    if user == computer {
        print("비겼습니다!")
        return run()
    } else if user == "1" && computer == "2" {
        print("졌습니다!")
        return run()
    } else if user == "1" && computer == "3" {
        print("이겼습니다!")
        return run()
    } else if user == "2" && computer == "1" {
        print("이겼습니다!")
        return run()
    } else if user == "2" && computer == "3" {
        print("졌습니다!")
        return run()
    } else if user == "3" && computer == "1" {
        print("졌습니다!")
        return run()
    } else if user == "3" && computer == "2" {
        print("이겼습니다!")
        return run()
    }
}
