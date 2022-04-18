//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//

import Foundation

func run() {
    let choicedNumber = selectMenu()
    
    switch choicedNumber {
    case "1":
        break
    case "2":
        break
    case "3":
        break
    case "0":
        break
    default:
        break
    }
}

func selectMenu() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    guard let userInput = readLine() else {
        return ""
    }
    return userInput
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
