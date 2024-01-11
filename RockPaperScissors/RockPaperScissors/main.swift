//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GamePlayer: String {
    case player = "사용자"
    case computer = "컴퓨터"
}

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
var whoseTurn: GamePlayer = .computer

func runGameFirstStep() {
    var loopFlag = true
    let regex = #"^[0-3]$"#
    
    while loopFlag {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        
        let playerInput = readLine()
        
        guard let playerInputChoice = playerInput else {
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
            loopFlag = false
            return
        }
        
        if (!isValidInput(input: playerInputChoice, regex: regex)) {
            print("0-3까지의 수를 입력해주세요.")
            continue
        }
        
        if (playerInputChoice == "0") {
            print("게임 종료")
            return
        }
        
        let computerChoice = makeComputerChoice()
        let gameResult = judgeRockScissorPaper(playerChoice: playerInputChoice, computerChoice: computerChoice)
        
        print("컴퓨터: \(computerChoice)")
        printResult(gameResult: gameResult)
        
        if gameResult == .draw {
            continue
        } else {
            loopFlag = false
            gameState = .mukChiba
            whoseTurn = gameResult == .win ? .player : .computer
            runGameSecondStep()
        }
    }
}

func runGameSecondStep() {
    var loopFlag = true
    let regex = #"^[0-3]$"#
    
    while loopFlag {
        print("[\(whoseTurn.rawValue)의 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        
        let playerSecondInput = readLine()
        
        guard let playerSecondChoice = playerSecondInput else {
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
            loopFlag = false
            return
        }
        
        if (!isValidInput(input: playerSecondChoice, regex: regex)) {
            print("0-3까지의 수를 입력해주세요.")
            continue
        }
        
        if (playerSecondChoice == "0") {
            print("게임 종료")
            return
        }
        
        let computerSecondChoice = makeComputerChoice()
        let gameResult = judgeMukChiBa(playerChoice: playerSecondChoice, computerChoice: computerSecondChoice)
        
        print("컴퓨터: \(computerSecondChoice)")
        
        switch gameResult {
        case .win:
            whoseTurn = .player
            print("\(whoseTurn.rawValue)의 턴입니다.")
        case .lose:
            whoseTurn = .computer
            print("\(whoseTurn.rawValue)의 턴입니다.")
        default:
            print("\(whoseTurn.rawValue)의 승리!")
            loopFlag = false
        }
    }
}

func isValidInput(input: String, regex: String) -> Bool {
    return input.range(of: regex, options: .regularExpression) != nil
}

func makeComputerChoice() -> String {
    let computerChoice = String(Int.random(in: 1...3))
    return String(computerChoice)
}

func judgeRockScissorPaper(playerChoice: String, computerChoice: String) -> GameResult {
    switch (playerChoice, computerChoice) {
    case (_, _) where playerChoice == computerChoice:
        return .draw
    case ("1", "3"), ("2", "1"), ("3", "2") :
        return .win
    default:
        return .lose
    }
}

func judgeMukChiBa(playerChoice: String, computerChoice: String) -> GameResult {
    switch (playerChoice, computerChoice) {
    case (_, _) where playerChoice == computerChoice:
        return .draw
    case ("1", "3"), ("2", "1"), ("3", "2") :
        return .lose
    default:
        return .win
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

runGameFirstStep()
