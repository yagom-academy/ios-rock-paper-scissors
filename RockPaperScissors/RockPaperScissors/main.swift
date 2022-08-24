//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startGame() {
    startRockPaperScissor()
}

func startRockPaperScissor() {
    let userNumber = getUserInput()
    switch userNumber {
    case 1, 2, 3:
        judgeWinner(with: userNumber, and: generateRandomComputerNumber())
    case 0:
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

func getUserInput() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine(), input.count == 1, let userNumber = Int(input) else { return 4 }
    return userNumber
}

func generateRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func judgeWinner(with userNumber: Int, and computerNumber: Int) {
    let signsToJudge =
    translateNumbersToHandSigns(userNumber: userNumber, computerNumber: computerNumber)
    switch signsToJudge {
    case (.scissors, .paper), (.paper, .rock), (.rock, .scissors) :
        print("이겼습니다!")
    case (.scissors, .rock), (.paper, .scissors), (.rock, .paper) :
        print("졌습니다!")
    default:
        print("비겼습니다!")
        startGame()
    }
}

func translateNumbersToHandSigns(userNumber: Int, computerNumber: Int) -> (HandSigns, HandSigns) {
    var userHandSign: HandSigns = .rock
    var computerHandSign: HandSigns = .rock
    if let user = HandSigns(rawValue: userNumber),
       let computer = HandSigns(rawValue: computerNumber) {
        userHandSign = user
        computerHandSign = computer
    }
    return (userHandSign, computerHandSign)
}

startGame()
