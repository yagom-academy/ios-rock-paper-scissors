//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var turn = "사용자 턴"

enum RockScissorsPaper: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
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
    case first = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case second = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
}

func runGame() {
    print(GameMenu.first.rawValue, terminator: "")
    
    let userInput = readLine()
   
    do {
        switch userInput {
        case "0":
            print(GameMessage.end.rawValue)
        case "1", "2", "3":
            try compareRockScissorsPaper(generateRandomNumber(), to: convertUserInputType(input: userInput))
        default:
            print(GameMessage.error.rawValue)
            runGame()
        }
    } catch {
        print(GameMessage.error.rawValue)
    }
}

func generateRandomNumber() -> Int {
    var rockScissorsPaper = [Int]()
    rockScissorsPaper.append(RockScissorsPaper.scissors.rawValue)
    rockScissorsPaper.append(RockScissorsPaper.rock.rawValue)
    rockScissorsPaper.append(RockScissorsPaper.paper.rawValue)
    
    rockScissorsPaper.shuffle()
    
    return rockScissorsPaper[0]
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
        runGame()
    }
    
    switch subtractionValue {
    case 1, -2:
        print(GameMessage.win.rawValue)
        print(GameMessage.end.rawValue)
        return
    case -1, 2:
        print(GameMessage.lose.rawValue)
        print(GameMessage.end.rawValue)
        return
    default:
        break
    }
}

func switchTurn() -> String {
    if turn == "사용자 턴" {
        turn = "컴퓨터 턴"
    } else if turn == "컴퓨터 턴" {
        turn = "사용자 턴"
    }
    
    return turn
}

runGame()
