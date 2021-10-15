//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum ShapesOfHand: Int, CaseIterable {
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

enum GameResult: String {
    case draw = "비겼습니다!"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
}

func startGame() {
    var needToRestart: Bool = false
    
    do {
        printRockpaperScissor()
        guard let handOfUser = try getUserInput() else {
            return
        }
        let handOfComputer = try getComputerHand()
        
        needToRestart = try needToRestartGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
        
    } catch GameError.invalidValueError {
        printInvaildError()
        needToRestart = true
    } catch {
        print(error)
    }
    
    if needToRestart {
        startGame()
    } else {
        printGameExit()
    }
}

func gameMukJjiBba(handOfUser: ShapesOfHand, handOfComputer: ShapesOfHand, currentTurn: Gamer?) {

    var attackerTurn: Gamer = .user
    var needToRestart: Bool = true
    
    do {
        attackerTurn = try determineGameResult(handOfUser: handOfUser,
                                      handOfComputer: handOfComputer,
                                      currentTurn: currentTurn)

        printMukJjiBba(attackerTurn: attackerTurn)
        guard let handOfUser = try getUserInput() else {
            return
        }
        let handOfComputer = try getComputerHand()
        
        if isDraw(handOfUser: handOfUser, handOfComputer: handOfComputer) {
            printWinner(attackerTurn: attackerTurn)
            return
        }
    } catch GameError.invalidValueError {
        printInvaildError()
        attackerTurn = changeTurn(currentTurn: attackerTurn)
        needToRestart = true
    } catch {
        print(error)
    }
    
    if needToRestart {
        gameMukJjiBba(handOfUser: handOfUser, handOfComputer: handOfComputer, currentTurn: attackerTurn)
    }
}

func needToRestartGame(handOfUser: ShapesOfHand, handOfComputer: ShapesOfHand) throws -> Bool {
    if isDraw(handOfUser: handOfUser, handOfComputer: handOfComputer) {
        print(GameResult.draw.rawValue)
        return true
    } else {
        gameMukJjiBba(handOfUser: handOfUser, handOfComputer: handOfComputer, currentTurn: nil)
        return false
    }
}


func determineGameResult(handOfUser: ShapesOfHand, handOfComputer: ShapesOfHand, currentTurn: Gamer?) throws -> Gamer {
    let pointToWin: [ShapesOfHand: ShapesOfHand] = [.scissor: .paper,
                                                                .rock: .scissor,
                                                                .paper: .rock]
    
    guard let matchedWin = pointToWin[handOfUser] else {
        throw GameError.unmatchedError
    }
    let winOfGame: Bool = matchedWin == handOfComputer
    
    if let currentTurn = currentTurn {
        let changedTurn = changeTurn(currentTurn: currentTurn)
        printChangedTurn(changedTurn: changedTurn)
        return changedTurn
    } else {
        winOfGame ? print(GameResult.win.rawValue) : print(GameResult.lose.rawValue)
        return assignTurn(winOfGame: winOfGame)
    }
}

func getUserInput() throws -> ShapesOfHand? {
    guard let userInput = readLine()?.replacingOccurrences(of: " ", with: ""),
          let userInputNumber = Int(userInput) else {
        throw GameError.invalidValueError
    }
    let exitGame = 0
    
    if userInputNumber == exitGame {
        printGameExit()
        return nil
    }
    
    guard let handOfUser = ShapesOfHand(rawValue: userInputNumber) else {
        throw GameError.invalidValueError
    }
    return handOfUser
}

func getComputerHand() throws -> ShapesOfHand {
    let handsOfComputer: [ShapesOfHand] = ShapesOfHand.allCases
    
    guard let handOfComputer = handsOfComputer.randomElement() else {
        throw GameError.emptyValueError
    }
    return handOfComputer
}

func isDraw(handOfUser: ShapesOfHand, handOfComputer: ShapesOfHand) -> Bool {
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

func printRockpaperScissor() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
}

func printMukJjiBba(attackerTurn: Gamer) {
    print("[\(attackerTurn.rawValue)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ",terminator: "")
}

func printChangedTurn(changedTurn: Gamer) {
    print("\(changedTurn.rawValue)의 턴입니다")
}

func printWinner(attackerTurn: Gamer) {
    print("\(attackerTurn.rawValue)의 승리!")
}

func printInvaildError() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printGameExit() {
    print("게임 종료")
}

startGame()
