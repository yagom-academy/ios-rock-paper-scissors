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
    if userHand != 0 {
        match(userHand: userHand, computerHand: computerHand)
    }
}

func match(userHand: Int, computerHand: Int) {
    if userHand == 0 {
        
    } else if userHand == computerHand {
        print("비겼습니다")
        playRockPaperScissors()
    } else if userHand-1 == computerHand || userHand+2 == computerHand {
        print("유저가 이겼습니다")
    } else {
        print("컴퓨터가 이겼습니다")
    }
}

func inputValue() -> String {
    guard let inputValue = readLine() else { return "" }
    return inputValue
}

func convertStringToInt() -> Int {
    guard let intValue = Int(inputValue()) else { return 0 }
    return intValue
}

func checkInputNumber() -> Int {
    let checkNumber = convertStringToInt()
    if checkNumber == 1 || checkNumber == 2 || checkNumber == 3 {
        return checkNumber
    } else if checkNumber == 0 {
        print("종료합니다.")
    } else {
        print("잘못된입력입니다. 다시 시도해 주세요.")
        playRockPaperScissors()
    }
    return checkNumber
}

func makeComputerHand() -> Int {
    let computerHand = Int.random(in: 1...3)
    return computerHand
}

playRockPaperScissors()
