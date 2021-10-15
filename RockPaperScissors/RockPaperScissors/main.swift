//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum RockPaperScissors: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
}

enum GameError: Error {
    case invalidValueError
    case emptyValueError
    case wrongChooseError
    case unmatchedError
}

enum Gamer: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

func startGame() {
    var needToRestart: Bool = false
    
    do {
        guard let handOfUser = try getUserInput() else {
            return
        }
        let handOfComputer = try showComputerHand()
        
        needToRestart = try needToRestartGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
        
    } catch GameError.invalidValueError {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        
        needToRestart = true
    } catch {
        print(error)
    }
    
    if needToRestart {
        startGame()
    }
}

func getUserInput() throws -> RockPaperScissors? {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    guard let userInput = readLine()?.replacingOccurrences(of: " ", with: ""),
          let userInputNumber = Int(userInput) else {
        throw GameError.invalidValueError
    }
    
    let exitGame = 0
    
    if userInputNumber == exitGame {
        print("게임 종료")
        return nil
    }
    
    guard let handOfUser = RockPaperScissors(rawValue: userInputNumber) else {
        throw GameError.invalidValueError
    }
    return handOfUser
}

func showComputerHand() throws -> RockPaperScissors {
    let handsOfComputer: [RockPaperScissors] = RockPaperScissors.allCases
    
    guard let handOfComputer = handsOfComputer.randomElement() else {
        throw GameError.emptyValueError
    }
    return handOfComputer
}

func needToRestartGame(handOfUser: RockPaperScissors, handOfComputer: RockPaperScissors) throws -> Bool {
    if isDraw(handOfUser: handOfUser, handOfComputer: handOfComputer) {
        return true
    } else {
        try determineGameResult(handOfUser: handOfUser, handOfComputer: handOfComputer)
        return false
    }
}

func isDraw(handOfUser: RockPaperScissors, handOfComputer: RockPaperScissors) -> Bool {
    if handOfUser == handOfComputer {
        print("비겼습니다!")
        return true
    }
    return false
}

func determineGameResult(handOfUser: RockPaperScissors, handOfComputer: RockPaperScissors) throws {
    let pointToWin: [RockPaperScissors: RockPaperScissors] = [.scissor: .paper,
                                                                .rock: .scissor,
                                                                .paper: .rock]
    
    guard let matchedWin = pointToWin[handOfUser] else {
        throw GameError.unmatchedError
    }
    if matchedWin == handOfComputer {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

startGame()
