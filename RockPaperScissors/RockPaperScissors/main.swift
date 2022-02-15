//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func playRockPaperScissors() {
    print("가위(1),바위(2),보(3)!<종료 :0>: ", terminator: "")
    let userHand = checkInputNumber()
    let computerHand = makeComputerHand()
    match(userHand: userHand, computerHand: computerHand)
}

func match(userHand: String, computerHand: String) {
    let matchScore = (userHand, computerHand)
    switch (matchScore) {
    case ("1","1"):
        print("비김")
    case ("2","2"):
        print("비김")
    case ("3","3"):
        print("비김")
    case ("1","3"):
        print("유저승리")
    case ("2","1"):
        print("유저승리")
    case ("3","2"):
        print("유저승리")
    case ("3","1"):
        print("컴퓨터승리")
    case ("1","2"):
        print("컴퓨터승리")
    case ("2","3"):
        print("컴퓨터승리")
    default:
        return
    }
    
}

func inputValue() -> String {
    guard let inputValue = readLine() else { return "" }
    return inputValue
}

func checkInputNumber() -> String {
    let checkNumber = inputValue()
    if checkNumber == "1" || checkNumber == "2" || checkNumber == "3" {
        return checkNumber
    } else if checkNumber == "0" {
        print("종료합니다.")
    } else {
        print("잘못된입력입니다. 다시 시도해 주세요.")
        playRockPaperScissors()
    }
    return checkNumber
}

func makeComputerHand() -> String {
    let computerHand = String(Int.random(in: 1...3))
    return computerHand
}

playRockPaperScissors()
