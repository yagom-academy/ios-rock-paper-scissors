//
//  RockPaperScissors - main.swift
//  Created by Kiseok, Morgan.
//  Copyright © yagom academy. All rights reserved.
// 

let randomNumberRange = 1...3

struct RockPaperScissorsGame {
    var userHand: RockPaperScissors
    var computerHand: RockPaperScissors
    var rockPaperScissorsResult: GameResult
    var mukChiPaGame = MukChiPa(turn: .nobody, userHand: .exit, computerHand: .exit, rockPaperScissorsResult: .exit)
    
    init(userHand: RockPaperScissors, computerHand: RockPaperScissors, rockPaperScissorsResult: GameResult) {
        self.userHand = userHand
        self.computerHand = computerHand
        self.rockPaperScissorsResult = rockPaperScissorsResult
    }
    
    mutating func playGame() {
        generateUserHand()
        generateComputerHand()
        generateResult()
    }
    
    mutating func generateUserHand() {
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
    
    mutating func convertToUserHand(user: Int) throws {
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
    
    mutating func generateComputerHand() {
        let randomComputerHand = Int.random(in: randomNumberRange)
        
        switch randomComputerHand {
        case 1:
            computerHand = .scissors
        case 2:
            computerHand = .rock
        case 3:
            computerHand = .paper
        default:
            computerHand = .exit
        }
    }
    
    mutating func generateResult() {
        if computerHand == userHand {
            rockPaperScissorsResult = .draw
            print(rockPaperScissorsResult.description)
            playGame()
        } else if (computerHand == .rock && userHand == .paper) || (computerHand == .scissors && userHand == .rock) || (computerHand == .paper && userHand == .scissors) {
            rockPaperScissorsResult = .win
            mukChiPaGame.turn = .user
            print(rockPaperScissorsResult.description)
            mukChiPaGame.playMukChiPa()
        } else if userHand == .exit {
            rockPaperScissorsResult = .exit
            print(rockPaperScissorsResult.description)
        } else {
            rockPaperScissorsResult = .lose
            mukChiPaGame.turn = .computer
            print(rockPaperScissorsResult.description)
            mukChiPaGame.playMukChiPa()
        }
    }
}

var rockPaperScissorsGame = RockPaperScissorsGame(userHand: .exit, computerHand: .exit, rockPaperScissorsResult: .exit)
rockPaperScissorsGame.playGame()

