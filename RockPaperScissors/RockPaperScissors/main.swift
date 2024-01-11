//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameResult {
    case draw
    case win
    case lose
}

enum GameState {
    case rockScissorPaper
    case mukChiba
}

var gameState: GameState = .rockScissorPaper

let regex = #"^[0-3]$"#
func isNumber(_ input: String) -> Bool {
    return input.range(of: regex, options: .regularExpression) != nil
}

func gameRun() {
    var loopFlag = true
    
    while loopFlag {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard let safeUserInput = userInput else {
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
            loopFlag = false
            return
        }
        
        if (!isNumber(safeUserInput)) {
            print("0-3까지의 수를 입력해주세요.")
            continue
        }
        
        if (safeUserInput == "0") {
            print("게임 종료")
            return
        }
        
        let computerChoice = makeComputerChoice()
        let gameResult = judgeGame(userChoice: safeUserInput, computerChoice: computerChoice)
        
        print("컴퓨터: \(computerChoice)")
        printResult(gameResult: gameResult)
        
        if gameResult == .draw {
            continue
        } else {
            loopFlag = false
            gameState = .mukChiba
            whoseTurn = gameResult == .win ? "user" : "computer"
            runGameStep2()
        }
    }
}

func printResult(gameResult: GameResult) {
    switch gameResult {
    case .draw:
        print("비겼습니다!")
    case .win:
        print("이겼습니다!")
    case .lose:
        print("졌습니다!")
    }
}

func judgeGame(userChoice: String, computerChoice: String) -> GameResult {
    switch (userChoice, computerChoice) {
    case (_, _) where userChoice == computerChoice:
        return .draw
    case ("1", "3"), ("2", "1"), ("3", "2") :
        if gameState == .rockScissorPaper {
            return .win
        } else {
            return .lose
        }
    default:
        if gameState == .rockScissorPaper {
            return .lose
        } else {
            return .win
        }
    }
}

func makeComputerChoice() -> String {
    let computerChoice = String(Int.random(in: 1...3))
    return String(computerChoice)
}

var whoseTurn = "computer"

func runGameStep2() {
    var loopFlag = true
    
    while loopFlag {
        print("[\(whoseTurn)의 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard let userChoice = userInput else {
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
            loopFlag = false
            return
        }
        
        if (!isNumber(userChoice)) {
            print("0-3까지의 수를 입력해주세요.")
            continue
        }
        
        if (userChoice == "0") {
            print("게임 종료")
            return
        }
        
        let computerChoice = makeComputerChoice()
        let gameResult = judgeGame(userChoice: userChoice, computerChoice: computerChoice)
        
        print("컴퓨터: \(computerChoice)")
        
        switch gameResult {
        case .win:
            whoseTurn = "user"
            print("\(whoseTurn)의 턴입니다.")
        case .lose:
            whoseTurn = "computer"
            print("\(whoseTurn)의 턴입니다.")
        default:
            print(whoseTurn == "computer" ? "컴퓨터의 승리!" : "사용자의 승리!")
            loopFlag = false
        }
    }
}

gameRun()
