//
//  RockPaperScissors - main.swift
//  Created by Kiseok, Morgan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors {
    case rock, paper, scissors, nothing
}

enum Result {
    case win, draw, lose, exit

    var result: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .exit:
            return "게임종료"
        }
    }
}

enum InputError: LocalizedError {
    case wrongInput
    
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}

var userHand: RockPaperScissors = .nothing
var computerHand: RockPaperScissors = .nothing
var gameResult: Result = .draw

func playGame() {
    do {
        try readUserInput()
    } catch {
        print(error.localizedDescription)
        playGame()
    }
    makeComputerHand()
    makeResult()
}

func readUserInput() throws {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    
    guard let userInput = readLine() else {
        throw InputError.wrongInput
    }
    guard let user = Int(userInput) else {
        throw InputError.wrongInput
    }
    
    guard 0...3 ~= user else {
        throw InputError.wrongInput
    }
    
    try makeUserHand(user: user)
}

func makeUserHand(user: Int) throws {
    switch user {
    case 0:
        print("게임종료")
        break
    case 1:
        userHand = .scissors
        break
    case 2:
        userHand = .rock
        break
    case 3:
        userHand = .paper
        break
    default:
        throw InputError.wrongInput
    }
}

func makeComputerHand() {
    let selectComputerHand = Int.random(in: 1...3)
    
    switch selectComputerHand {
    case 1:
        computerHand = .scissors
    case 2:
        computerHand = .rock
    case 3:
        computerHand = .paper
    default:
        break
    }
}

func makeResult() {
    if computerHand == userHand {
        gameResult = .draw
        print(gameResult.result)
        playGame()
    } else if computerHand == .rock && userHand == .paper || computerHand == .scissors && userHand == .rock || computerHand == .paper && userHand == .scissors {
        gameResult = .win
        print(gameResult.result)
    } else {
        gameResult = .lose
        print(gameResult.result)
    }
}

playGame()
