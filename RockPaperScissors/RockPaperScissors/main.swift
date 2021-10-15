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
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
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
        print("비겼습니다!")
        return true
    } else {
        gameMukJjiBba(handOfUser: handOfUser, handOfComputer: handOfComputer, currentTurn: nil)
        return false
    }
}

func gameMukJjiBba(handOfUser: RockPaperScissors, handOfComputer: RockPaperScissors, currentTurn: Gamer?) {

    var attackerTurn: Gamer = .user
    var needToRestart: Bool = true
    
    do {
        attackerTurn = try determineGameResult(handOfUser: handOfUser,
                                      handOfComputer: handOfComputer,
                                      currentTurn: currentTurn)

        print("[\(attackerTurn.rawValue)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ",terminator: "")
    
        guard let handOfUser = try getUserInput() else {
            return
        }
        let handOfComputer = try showComputerHand()
        
        if isDraw(handOfUser: handOfUser, handOfComputer: handOfComputer) {
            print("\(attackerTurn.rawValue)의 승리!")
            return
        }
    } catch GameError.invalidValueError {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    
        attackerTurn = changeTurn(currentTurn: attackerTurn)
        needToRestart = true
    } catch {
        print(error)
    }
    
    if needToRestart {
        gameMukJjiBba(handOfUser: handOfUser, handOfComputer: handOfComputer, currentTurn: attackerTurn)
    }
}

func isDraw(handOfUser: RockPaperScissors, handOfComputer: RockPaperScissors) -> Bool {
    if handOfUser == handOfComputer {
        return true
    }
    return false
}

func assignTurn(winOfGame: Bool) -> Gamer {
    if winOfGame {
        return .user
    } else {
        return .computer
    }
}

func changeTurn(currentTurn: Gamer?) -> Gamer {
    if currentTurn == .computer {
        return .user
    } else {
        return .computer
    }
}

func determineGameResult(handOfUser: RockPaperScissors, handOfComputer: RockPaperScissors, currentTurn: Gamer?) throws -> Gamer {
    let pointToWin: [RockPaperScissors: RockPaperScissors] = [.scissor: .paper,
                                                                .rock: .scissor,
                                                                .paper: .rock]
    
    guard let matchedWin = pointToWin[handOfUser] else {
        throw GameError.unmatchedError
    }
    let winOfGame: Bool = matchedWin == handOfComputer
    
    if let currentTurn = currentTurn {
        let changedTurn = changeTurn(currentTurn: currentTurn)
        print("\(changedTurn.rawValue)의 턴입니다")
        return changedTurn
    } else {
        winOfGame ? print("이겼습니다.") : print("졌습니다.")
        return assignTurn(winOfGame: winOfGame)
    }
}

startGame()
