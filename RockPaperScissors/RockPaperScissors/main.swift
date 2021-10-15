//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum RockScissorsPaper: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum MukJjiBba: Int {
    case muk = 1
    case jji = 2
    case bba = 3
}

enum Errorcase: Error {
    case invalidInput
}

enum GameMessage: String {
    case error = "잘못된 입력입니다. 다시 시도해주세요."
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case end = "게임종료"
}

enum GameMenu: String {
    case rockScissorsPaper = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case mukJjiBba = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
}

func runRockScissorsPaper() {
    print(GameMenu.rockScissorsPaper.rawValue, terminator: "")
    
    let userInput = readLine()
   
    do {
        switch userInput {
        case "0":
            print(GameMessage.end.rawValue)
        case "1", "2", "3":
            try compareRockScissorsPaper(generateRockScissorsPaper(), to: convertUserInputType(input: userInput))
        default:
            print(GameMessage.error.rawValue)
            
            runRockScissorsPaper()
        }
    } catch {
        print(GameMessage.error.rawValue)
    }
}

func generateRockScissorsPaper() -> Int {
    var rockScissorsPaper = [Int]()
    rockScissorsPaper.append(RockScissorsPaper.scissors.rawValue)
    rockScissorsPaper.append(RockScissorsPaper.rock.rawValue)
    rockScissorsPaper.append(RockScissorsPaper.paper.rawValue)
    
    rockScissorsPaper.shuffle()
    
    return rockScissorsPaper[0]
}

func generateMukJjiBba() -> Int {
    var mukJjiBba = [Int]()
    mukJjiBba.append(MukJjiBba.muk.rawValue)
    mukJjiBba.append(MukJjiBba.jji.rawValue)
    mukJjiBba.append(MukJjiBba.bba.rawValue)
        
    mukJjiBba.shuffle()
        
    return mukJjiBba[0]
}


func convertUserInputType(input: String?) throws -> Int {
    var stringTypeUserInput = ""

    if let userInput = input {
        stringTypeUserInput = userInput
    }
    
    guard let integer = Int(stringTypeUserInput) else {
        throw Errorcase.invalidInput
    }

    return integer
}

func compareRockScissorsPaper(_ computerValue: Int, to userInputValue: Int) {
    let subtractionValue = userInputValue - computerValue
    
    if subtractionValue == 0 {
        print(GameMessage.draw.rawValue)
        
        runRockScissorsPaper()
    }
    
    switch subtractionValue {
    case 1, -2:
        print(GameMessage.win.rawValue)
        
        let player = "사용자"
        
        runMukJjiBba(turn: player)
    case -1, 2:
        print(GameMessage.lose.rawValue)
        
        let player = "컴퓨터"
        
        runMukJjiBba(turn: player)
    default:
        break
    }
}

func runMukJjiBba(turn: String) {
    print("[\(turn) 턴]", GameMenu.mukJjiBba.rawValue, terminator: "")
    
    let userInput = readLine()
    
    do {
        switch userInput {
        case "0":
            print(GameMessage.end.rawValue)
        case "1", "2", "3":
            try compareMukJjiBba(generateMukJjiBba(), to: convertUserInputType(input: userInput), at: turn)
        default:
            print(GameMessage.error.rawValue)
            
            let player = "컴퓨터"
            
            runMukJjiBba(turn: player)
        }
    } catch {
        print(GameMessage.error.rawValue)
    }
    
}

func compareMukJjiBba(_ computerValue: Int, to userInputValue: Int, at turn: String) {
    guard let computerData = MukJjiBba(rawValue: computerValue) else {
        return
    }
    
    guard let userData = MukJjiBba(rawValue: userInputValue) else {
        return
    }
    
    switch (computerData, userData) {
    case (.muk, .jji), (.jji, .bba), (.bba, .muk):
        let player = "컴퓨터"
        
        print("\(player)의 턴입니다.")
        
        runMukJjiBba(turn: player)
    case (.muk, .bba), (.jji, .muk), (.bba, .jji):
        let player = "사용자"
        
        print("\(player)의 턴입니다.")
        
        runMukJjiBba(turn: player)
    case (.muk, .muk), (.jji, .jji), (.bba, .bba):
        print("\(turn)의 승리!")
        
        print(GameMessage.end.rawValue)
        
        return
    }
}

runRockScissorsPaper()
