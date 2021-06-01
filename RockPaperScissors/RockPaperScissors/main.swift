//
//  RockPaperScissors - main.swift
//  Created by yoshikim, luyan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct RockPaperScissorsGameConsole {
    private var isGameOver: Bool?
    private var computerRandomNumber: Int?

    private enum RockPaperScissors: Int {
        case scissors = 1
        case rock
        case paper
    }
    
    func checkGameOver(inputNumber: Int) -> Bool {
        if inputNumber == 0 {
            print("게임 종료")
            return true
        }
        return false
    }
    private func requestUserInput() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let inputString = readLine(), let inputNumber = Int(inputString), 0 <= inputNumber && inputNumber <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return requestUserInput()
        }
        return inputNumber
    }
    private mutating func generateRandomNumber() {
        computerRandomNumber = Int.random(in: 1...3)
    }
    private mutating func compareWithUserInput(userNumber: Int) {
        guard let unwrappedNumber = computerRandomNumber else { return }
        guard let userHand = RockPaperScissors(rawValue: userNumber), let computerHand = RockPaperScissors(rawValue: unwrappedNumber) else { return }
        if userHand == computerHand {
            print("비겼습니다!")
        } else if (userHand == .scissors && computerHand == .paper) || (userHand == .paper && computerHand == .rock) || (userHand == .rock && computerHand == .scissors) {
            print("이겼습니다!")
            isGameOver = true
        } else {
            print("졌습니다!")
            isGameOver = true
        }
    }
    mutating func gameStart() {
        isGameOver = false
        while isGameOver == false {
            let userNumber = requestUserInput()
            isGameOver = checkGameOver(inputNumber: userNumber)
            generateRandomNumber()
            compareWithUserInput(userNumber: userNumber)
        }
    }
}

var stepOneGameConsole = RockPaperScissorsGameConsole()
stepOneGameConsole.gameStart()
