//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func showGameMenu() {
    var isStart = true
    while isStart {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        isStart = getUserInput()
    }
}

func getUserInput() -> Bool {
    let inputMenuNumber = readLine() ?? ""
        switch inputMenuNumber {
        case "1", "2", "3" :
            let rockPaperScissors = makeRandomNumber()
            return comparePlayerInputAndComputerNumber(userInput: inputMenuNumber, computerInput: rockPaperScissors)
        case "0" :
            print("게임 종료")
            return false
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return true
        }
}

func makeRandomNumber() -> String {
    return String(Int.random(in: 1...3))
}

func comparePlayerInputAndComputerNumber(userInput: String, computerInput: String) -> Bool {
    if computerInput == "1" && userInput == "2" || computerInput == "2" && userInput == "3" || computerInput == "3" && userInput == "1" {
        printResult(result: 1)
        return false
    } else if computerInput == userInput {
        printResult(result: 0)
    } else {
        printResult(result: 2)
        return false
    }
    return true
}

func printResult(result: Int) {
    switch result {
    case 0:
        print("비겼습니다!")
    case 1:
        print("이겼습니다!")
    case 2:
        print("졌습니다!")
    default:
        break
    }
}

showGameMenu()
