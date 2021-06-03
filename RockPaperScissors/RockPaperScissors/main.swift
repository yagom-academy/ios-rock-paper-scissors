//
//  RockPaperScissors - main.swift
//  Created by yoshikim, luyan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct RockPaperScissorsGameConsole {
    private var isGameOver: Bool = false
    
    private enum RockPaperScissors: Int {
        case scissors = 1
        case rock
        case paper
    }
    
    private enum GameResult: String {
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case draw = "비겼습니다!"
        case inputError
    }
    
    private func isUserWin(_ userHand: RockPaperScissors, _ computerHand: RockPaperScissors) -> Bool {
        if (userHand == .scissors && computerHand == .paper) || (userHand == .paper && computerHand == .rock) || (userHand == .rock && computerHand == .scissors) {
            return true
        } else {
            return false
        }
    }
    
    private func checkGameOver(inputNumber: Int) -> Bool {
        if inputNumber == 0 {
            print("게임 종료")
            return true
        }
        return false
    }
    
    private func requestUserInput() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let inputString = readLine(),
              let inputNumber = Int(inputString),
              0 <= inputNumber && inputNumber <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return requestUserInput()
        }
        return inputNumber
    }
    
    private func generateRandomNumber() -> Int {
        return Int.random(in: 1...3)
    }
    
    private mutating func compareWithUserInput(userNumber: Int) -> GameResult {
        let computerNumber = generateRandomNumber()
        guard let userHand = RockPaperScissors(rawValue: userNumber),
              let computerHand = RockPaperScissors(rawValue: computerNumber) else { return GameResult.inputError }
        if userHand == computerHand {
            return GameResult.draw
        } else if isUserWin(userHand, computerHand) {
            isGameOver = true
            return GameResult.win
        } else {
            isGameOver = true
            return GameResult.lose
        }
    }
    
    private func printGameResult(gameResult: GameResult) {
        switch gameResult {
        case .win, .lose, .draw:
            print(gameResult.rawValue)
            break
        case .inputError:
            break
        }
    }
    
    mutating func gameStart() {
        while isGameOver == false {
            let userNumber = requestUserInput()
            isGameOver = checkGameOver(inputNumber: userNumber)
            let gameResult = compareWithUserInput(userNumber: userNumber)
            printGameResult(gameResult: gameResult)
        }
    }
}

var stepOneGameConsole = RockPaperScissorsGameConsole()
stepOneGameConsole.gameStart()
