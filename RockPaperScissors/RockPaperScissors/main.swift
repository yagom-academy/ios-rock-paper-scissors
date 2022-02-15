//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func playRockPaperScissors() {
    print("가위(1),바위(2),보(3)!<종료 :0>:", terminator: "")
    let userHand = inputValue()
    let computerHand = makeComputerHand()
    match(userHand: userHand, computerHand: computerHand)
}

func match(userHand: String, computerHand: String) {
    
}

func inputValue() -> String {
    guard let inputValue = readLine() else {return ""}
    return inputValue
}

func inputNumberCheck() -> String {
    let checkNumber = inputValue()
    switch checkNumber {
    case "0" :
        print("함수를 종료합니다")
    default :
        print("잘못입력하셨습니다")
        playRockPaperScissors()
    }
    return checkNumber
}

func makeComputerHand() -> String {
    let computerHand = String(Int.random(in: 1...3))
    return computerHand
}
