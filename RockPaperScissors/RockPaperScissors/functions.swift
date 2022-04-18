//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//

import Foundation

func run() {
    let choicedNumber = selectMenu()
    let standardNumber = selectRSP()
    
    switch choicedNumber {
    case "1":
        caseS(of: choicedNumber, and: standardNumber)
        break
    case "2":
        caseR(of: choicedNumber, and: standardNumber)
        break
    case "3":
        caseP(of: choicedNumber, and: standardNumber)
        break
    case "0":
        print("게임 종료")
        break
    default:
        print("잘못된 입력입니다. 다시 시도해 주세요.")
        run()
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

func caseP(of user: String, and computer: String) {
    if user == computer {
        print("비겼습니다!")
        run()
    } else if user == "3" && computer == "1" {
        print("졌습니다!")
        print("게임 종료")
    } else if user == "3" && computer == "2" {
        print("이겼습니다!")
        print("게임 종료")
    }
}

func caseS(of user: String, and computer: String) {
    if user == computer {
        print("비겼습니다!")
        run()
        return
    } else if user == "1" && computer == "2" {
        print("졌습니다!")
        print("게임 종료")
        return
    } else if user == "1" && computer == "3" {
        print("이겼습니다!")
        print("게임 종료")
        return
    }
}

func caseR(of user: String, and computer: String) {
    if user == computer {
        print("비겼습니다!")
        run()
    } else if user == "2" && computer == "1" {
        print("이겼습니다!")
        print("게임 종료")
    } else if user == "2" && computer == "3" {
        print("졌습니다!")
        print("게임 종료")
    }
}
