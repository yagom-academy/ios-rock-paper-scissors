//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//

import Foundation

func playGame() {
    let choicedNumber = choiceMenu()
    let fixedNumber = choiceRockPaperScissors()
    
    switch choicedNumber {
    case "1":
        isCaseScissors(fixedNumber)
        break
    case "2":
        isCaseRock(fixedNumber)
        break
    case "3":
        isCasePaper(fixedNumber)
        break
    case "0":
        print("게임 종료")
        break
    default:
        print("잘못된 입력입니다. 다시 시도해 주세요.")
        playGame()
    }
}

func choiceMenu() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func choiceRockPaperScissors() -> String {
    let caseStore: [String] = ["1", "2", "3"]
    guard let choicedCase = caseStore.randomElement() else {
        return ""
    }
    return choicedCase
}

func isCasePaper(_ comparedNumber: String) {
    switch comparedNumber {
    case "1":
        print("졌습니다!")
        print("게임 종료")
    case "2":
        print("이겼습니다!")
        print("게임 종료")
    case "3":
        print("비겼습니다!")
        playGame()
    default:
        break
    }
}

func isCaseScissors(_ comparedNumber: String) {
    switch comparedNumber {
    case "1":
        print("비겼습니다!")
        playGame()
    case "2":
        print("졌습니다!")
        print("게임 종료")
    case "3":
        print("이겼습니다!")
        print("게임 종료")
    default:
        break
    }
}

func isCaseRock(_ comparedNumber: String) {
    switch comparedNumber {
    case "1":
        print("이겼습니다!")
        print("게임 종료")
    case "2":
        print("비겼습니다!")
        playGame()
    case "3":
        print("졌습니다!")
        print("게임 종료")
    default:
        break
    }
}
