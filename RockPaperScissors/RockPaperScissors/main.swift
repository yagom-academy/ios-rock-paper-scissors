//
//  RockPaperScissors - main.swift
//  Created by Kiseok, Morgan.
//  Copyright © yagom academy. All rights reserved.
// 

var userHand: RockPaperScissors = .exit
var computerHand: RockPaperScissors = .exit
var rockPaperScissorsResult: gameResult = .draw

func playGame() {
        generateUserHand()
        generateComputerHand()
        generateResult()
}

func generateUserHand() {
    do {
        let userInput = try readUserInput()
        try convertToUserHand(user: userInput)
    } catch {
        print("잘못된 입력입니다. 다시 시도해주세요")
        generateUserHand()
    }
}

func readUserInput() throws -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    
    guard let userInput = readLine() else {
        throw InputError.nothingInputError
    }
    guard let user = Int(userInput) else {
        throw InputError.notNumberError
    }
    
    guard 0...3 ~= user else {
        throw InputError.outOfRangeError
    }
    
    return user
}

func convertToUserHand(user: Int) throws {
    switch user {
    case 0:
        userHand = .exit
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

func generateComputerHand() {
    let randomComputerHand = Int.random(in: 1...3)
    
    switch randomComputerHand {
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

func generateResult() {
    if computerHand == userHand {
        rockPaperScissorsResult = .draw
        print(rockPaperScissorsResult.result)
        playGame()
    } else if (computerHand == .rock && userHand == .paper) || (computerHand == .scissors && userHand == .rock) || (computerHand == .paper && userHand == .scissors) {
        rockPaperScissorsResult = .win
        print(rockPaperScissorsResult.result)
    } else if userHand == .exit {
        rockPaperScissorsResult = .exit
        print(rockPaperScissorsResult.result)
    } else {
        rockPaperScissorsResult = .lose
        print(rockPaperScissorsResult.result)
    }
}

playGame()
