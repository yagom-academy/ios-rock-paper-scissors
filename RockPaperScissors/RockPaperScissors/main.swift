//
//  RockPaperScissors - main.swift
//  Created by Kiseok, Morgan.
//  Copyright © yagom academy. All rights reserved.
// 

var userHand: RockPaperScissors = .nothing
var computerHand: RockPaperScissors = .nothing
var gameResult: Result = .draw

func playGame() {
    do {
        try readUserInput()
        makeComputerHand()
        makeResult()
    } catch {
        print(error.localizedDescription)
        playGame()
    }
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
        userHand = .nothing
    case 1:
        userHand = .scissors
    case 2:
        userHand = .rock
    case 3:
        userHand = .paper
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
    } else if (computerHand == .rock && userHand == .paper) || (computerHand == .scissors && userHand == .rock) || (computerHand == .paper && userHand == .scissors) {
        gameResult = .win
        print(gameResult.result)
    } else if userHand == .nothing {
        gameResult = .exit
        print(gameResult.result)
    } else {
        gameResult = .lose
        print(gameResult.result)
    }
}

playGame()
