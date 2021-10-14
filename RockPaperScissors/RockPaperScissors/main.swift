//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorsPaper: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum MukChiPa: String {
    case muk = "1"
    case chi = "2"
    case pa = "3"
}

enum GameType {
    case rockPaperScissors
    case mukChiPa
}

enum PlayerType: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

enum GameResult: CustomStringConvertible {
    var description: String {
        switch self {
        case .win:
            return "이겼습니다."
        case .lose:
            return "졌습니다."
        case .draw:
            return "비겼습니다."
        case .exit:
            return "게임종료"
        }
    }
    case win
    case lose
    case draw
    case exit
}

func playGame() {
    var rockPaperScissorsResult: GameResult = .draw
    var turnOwner: PlayerType = .user
    while rockPaperScissorsResult == .draw {
        rockPaperScissorsResult = playRockPaperScissors()
        
        print(rockPaperScissorsResult.description)
    }
    if rockPaperScissorsResult == .exit {
        return
    }
    if rockPaperScissorsResult == .lose {
        turnOwner = .computer
    }
    
    var mukChiPaResult: GameResult = .win
    
    while mukChiPaResult == .win || mukChiPaResult == .lose {
        printTurnOwner(turnOwner: turnOwner)
        
        mukChiPaResult = playMukChiPa()
        
        turnOwner = judgeTurnOwner(gameResult: mukChiPaResult, turnOwner: turnOwner)
        
        printGameResult(gameResult: mukChiPaResult, turnOwner: turnOwner)
    }
    
    if mukChiPaResult == .exit {
        print(mukChiPaResult.description)
        
        return
    }
    print("\(turnOwner.rawValue)의 승리!\n게임종료")
}

func printGameResult(gameResult: GameResult, turnOwner: PlayerType) {
    if gameResult == .draw || gameResult == .exit {
        
        return
    }
    print("\(turnOwner.rawValue)의 턴입니다.")
}

func judgeTurnOwner(gameResult: GameResult, turnOwner: PlayerType) -> PlayerType {
    switch (gameResult, turnOwner) {
    case (.win, .computer) :
        return .user
    case (.lose, .user) :
        return .computer
    default:
        return turnOwner
    }
}

func playMukChiPa() -> GameResult {
    var gameResult: GameResult
    
    guard let userInput = receiveVaildInput(gameType: .mukChiPa) else {
        return .win
    }
    if userInput == "0" {
        return .exit
    }
    guard let userHand = MukChiPa(rawValue: userInput) else {
        return .win
    }
    guard let computerHand = MukChiPa(rawValue: makeRandomNumber()) else {
        return .win
    }

    gameResult = judgeMukChiPa(userHand, computerHand)
    
    return gameResult
}

func printTurnOwner(turnOwner: PlayerType) {
    print("[\(turnOwner.rawValue) 턴] ", terminator: "")
}

func judgeMukChiPa(_ userHand: MukChiPa, _ computerHand: MukChiPa) -> GameResult {
    var gameResult: GameResult
    
    switch (userHand, computerHand) {
    case (.chi, .pa), (.muk, .chi), (.pa, .muk):
        gameResult = .win
    case (.chi, .chi), (.muk, .muk), (.pa, .pa):
        gameResult = .draw
    default:
        gameResult = .lose
    }
    
    return gameResult
}

func playRockPaperScissors() -> GameResult  {
    guard let userInput = receiveVaildInput(gameType: .rockPaperScissors) else {
        return .win
    }
    if userInput == "0" {
        return .exit
    }
    guard let userHand = RockScissorsPaper(rawValue: userInput) else {
        return .win
    }
    guard let computerHand = RockScissorsPaper(rawValue: makeRandomNumber()) else {
        return .win

    }
    var gameResult: GameResult
    
    gameResult = judgeRockPaperScissors(userHand, computerHand)
    
    return gameResult
}

func receiveVaildInput(gameType: GameType) -> String? {
    var isInvalid: Bool = true
    var input: String = ""
    
    while isInvalid {
        printHandChoiceMenu(gameType: gameType)
        input = receiveInput()
        isInvalid = isInvalidInput(shouldCheckedInput: input)
    }
    
    return input
}

func receiveInput() -> String {
    guard let input = readLine() else {
        return ""
    }
    
    return input
}

func isInvalidInput(shouldCheckedInput: String) -> Bool {
    switch shouldCheckedInput {
    case "0", "1", "2", "3":
        return false
    default:
        printErrorMessage()
        return true
    }
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printHandChoiceMenu(gameType: GameType){
    if gameType == .rockPaperScissors {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    } else {
        print("묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
}

func makeRandomNumber() -> String{
    return String(Int.random(in: 1...3))
}

func judgeRockPaperScissors(_ userHand: RockScissorsPaper, _ computerHand: RockScissorsPaper) -> GameResult {
    var gameResult: GameResult
    
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        gameResult = .win
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        gameResult = .draw
    default:
        gameResult = .lose
    }
    
    return gameResult
}

playGame()
