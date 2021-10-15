//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Hand: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    mutating func changeToMukChiPa() {
        switch self {
        case .scissors:
            self = .rock
        case .rock:
            self = .scissors
        case .paper:
            self = .paper
        }
    }
}

enum GameType {
    case rockPaperScissors
    case mukChiPa
}

enum Player: String {
    case user = "사용자"
    case computer = "컴퓨터"
    mutating func changeTurn() {
        switch self {
        case .computer:
            self = .user
        case .user:
            self = .computer
        }
    }
}

enum Result: CustomStringConvertible {
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .exit:
            return "게임종료"
        case .none:
            return "결과가 없습니다."
        }
    }
    case win
    case lose
    case draw
    case exit
    case none
}

enum MukChiPaResult {
    case win
    case changeTurn
    case maintainTurn
    case exit
}

func playGame() {
    var rockPaperScissorsResult: Result = .draw
    var turnOwner: Player = .user
    while rockPaperScissorsResult == .draw {
        rockPaperScissorsResult = playRockPaperScissors()
        
        print(rockPaperScissorsResult.description)
    }
    if rockPaperScissorsResult == .exit {
        return
    } else if rockPaperScissorsResult == .lose {
        turnOwner = .computer
    }
    
    var mukChiPaResult: MukChiPaResult = .maintainTurn
    
    while mukChiPaResult == .changeTurn || mukChiPaResult == .maintainTurn {
        mukChiPaResult = playMukChiPa(turnOwner: turnOwner)
        
        turnOwner = judgeTurnOwner(mukChiPaResult: mukChiPaResult, turnOwner: turnOwner)
        
        printTurnOwner(of: mukChiPaResult, turnOwner: turnOwner)
    }
    
    if mukChiPaResult == .exit {
        print("게임종료")
        return
    }
    print("\(turnOwner.rawValue)의 승리!\n게임종료")
}

func printTurnOwner(of gameResult: MukChiPaResult, turnOwner: Player) {
    if gameResult == .win {
        return
    }
    print("\(turnOwner.rawValue)의 턴입니다.")
}

func judgeTurnOwner(mukChiPaResult: MukChiPaResult, turnOwner: Player) -> Player {
    var turnOwner = turnOwner
    switch mukChiPaResult {
    case .changeTurn :
        turnOwner.changeTurn()
        return turnOwner
    default:
        return turnOwner
    }
}

enum gameError: Error {
    case inValidInput
}

func makeValidHand(input: String) throws -> Hand {
    guard let hand = Hand(rawValue: input) else { throw gameError.inValidInput }
    return hand
}

func playMukChiPa(turnOwner: Player) -> MukChiPaResult {
    
    let userInput = receiveVaildInput(gameType: .mukChiPa, turnOwner: turnOwner.rawValue)
    var gameResult: Result = .none
    if userInput == "0" {
        return .exit
    }
    do {
        var userHand = try makeValidHand(input: userInput)
        var computerHand = try makeValidHand(input: makeRandomNumber())
        
        userHand.changeToMukChiPa()
        computerHand.changeToMukChiPa()
        print(userHand)
        print(computerHand)
        gameResult = judgeRockPaperScissors(userHand, computerHand)
    } catch {
        print("입력이 잘못 되었습니다.")
    }
    
    let mukChiPaResult = judgeMukChiPa(gameResult: gameResult, turnOwner: turnOwner)
    
    return mukChiPaResult
}

func judgeMukChiPa(gameResult: Result, turnOwner: Player) -> MukChiPaResult {
    switch (gameResult, turnOwner) {
    case (.win, .computer) :
        return .changeTurn
    case (.lose, .user) :
        return .changeTurn
    case (.win, .user):
        return .maintainTurn
    case (.lose, .computer):
        return .maintainTurn
    default:
        return .win
    }
}


func playRockPaperScissors() -> Result  {
    let userInput = receiveVaildInput(gameType: .rockPaperScissors, turnOwner: "")

    if userInput == "0" {
        return .exit
    }
    guard let userHand = Hand(rawValue: userInput) else {
        return .win
    }
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else {
        return .win
    }
    
    let gameResult = judgeRockPaperScissors(userHand, computerHand)
    
    return gameResult
}

func receiveVaildInput(gameType: GameType, turnOwner: String) -> String {
    var isInvalid: Bool = true
    var input: String = ""
    
    while isInvalid {
        printHandChoiceMenu(gameType: gameType, turnOwner: turnOwner)
        input = receiveInput()
        isInvalid = checkValidInput(of: input)
    }
    
    return input
}

func receiveInput() -> String {
    guard let input = readLine() else {
        return ""
    }
    
    return input
}

func checkValidInput(of input: String) -> Bool {
    switch input {
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

func printHandChoiceMenu(gameType: GameType, turnOwner: String){
    if gameType == .rockPaperScissors {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    } else {
        print("[\(turnOwner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
}

func makeRandomNumber() -> String{
    return String(Int.random(in: 1...3))
}

func judgeRockPaperScissors(_ userHand: Hand, _ computerHand: Hand) -> Result {
    var gameResult: Result
    
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
