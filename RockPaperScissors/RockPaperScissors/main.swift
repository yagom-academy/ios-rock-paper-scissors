//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum InputUserError: Error {
    case inputNothing
    case notIntValue
    case outOfRange
    case selectExit
}

enum GameState: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

enum Player: String {
    case computer = "컴퓨터"
    case user = "사용자"
}

enum Mode {
    case RockPaperScissors
    case Mukjjipa
}

func printRockPaperScissorsMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func printMukjjipaMenu(winner: Player) {
    print("[\(winner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerValue() -> RockPaperScissors {
    guard let value = RockPaperScissors.allCases.randomElement() else {
        return generateComputerValue()
    }
    return value
}

func inputUserValue(mode: Mode, winner: Player) throws -> RockPaperScissors? {
    guard let userNumber = readLine() else {
        throw InputUserError.inputNothing
    }
    
    guard let convertedNumber = Int(userNumber) else {
        throw InputUserError.notIntValue
    }
    
    if convertedNumber == 0 {
        throw InputUserError.selectExit
    }
    
    guard let userValue = RockPaperScissors(rawValue: convertedNumber) else {
        throw InputUserError.outOfRange
    }
    return userValue
}

func selectMenu(mode: Mode, winner: Player) {
    switch mode {
    case .RockPaperScissors:
        printRockPaperScissorsMenu()
    case .Mukjjipa:
        printMukjjipaMenu(winner: winner)
    }
}

func printWinner(winner: Player) {
    print("\(winner.rawValue)의 승리!")
}

func printGameResult(gameResult: GameState) {
    print(gameResult.rawValue)
}

func compareValue(myValue: RockPaperScissors, otherValue: RockPaperScissors) -> GameState {
    switch (myValue, otherValue) {
    case (.rock, .rock):
        return .draw
    case (.rock, .paper):
        return .lose
    case (.rock, .scissors):
        return .win
        
    case (.paper, .rock):
        return .win
    case (.paper, .paper):
        return .draw
    case (.paper, .scissors):
        return .lose
        
    case (.scissors, .rock):
        return .lose
    case (.scissors, .paper):
        return .win
    case (.scissors, .scissors):
        return .draw
    }
}

func printError() {
    print("잘못된 입력입니다. 다시 시도해주세요")
}

func checkIsDraw(thisGameResult: GameState) -> Bool {
    if thisGameResult == .draw {
        return true
    } else {
        return false
    }
}

func printWhosTurn(winner: Player) {
    print("\(winner.rawValue)의 턴입니다")
}

func compareWhosTurn(thisGameState: GameState) -> Player {
    if thisGameState == .lose {
        return .computer
    } else {
        return .user
    }
}

func startRockPaperScissors() {
    printRockPaperScissorsMenu()
    var inputValue: RockPaperScissors? = nil
    repeat {
        do {
            inputValue = try inputUserValue(mode: .RockPaperScissors, winner: .user)
        } catch InputUserError.inputNothing {
            printError()
            selectMenu(mode: .RockPaperScissors, winner: .user)
        } catch InputUserError.notIntValue {
            printError()
            selectMenu(mode: .RockPaperScissors, winner: .user)
        } catch InputUserError.outOfRange {
            printError()
            selectMenu(mode: .RockPaperScissors, winner: .user)
        } catch InputUserError.selectExit {
            print("게임 종료")
            return
        } catch {
            printError()
        }
    } while inputValue == nil
    
    guard let userValue = inputValue else {
        return
    }
        
    let thisGameResult = compareValue(myValue: userValue, otherValue: generateComputerValue())
    if thisGameResult == .draw {
        printGameResult(gameResult: thisGameResult)
        startRockPaperScissors()
    } else {
        printGameResult(gameResult: thisGameResult)
        startMukjjaipa(thisTurnPlayer: compareWhosTurn(thisGameState: thisGameResult))
    }
}

func startMukjjaipa(thisTurnPlayer: Player) {
    printMukjjipaMenu(winner: thisTurnPlayer)
    var inputValue: RockPaperScissors? = nil
    repeat {
        do {
            inputValue = try inputUserValue(mode: .Mukjjipa, winner: thisTurnPlayer)
        } catch InputUserError.inputNothing {
            printError()
            selectMenu(mode: .Mukjjipa, winner: thisTurnPlayer)
        } catch InputUserError.notIntValue {
            printError()
            selectMenu(mode: .Mukjjipa, winner: thisTurnPlayer)
        } catch InputUserError.outOfRange {
            printError()
            selectMenu(mode: .Mukjjipa, winner: thisTurnPlayer)
        } catch InputUserError.selectExit {
            print("게임 종료")
            return
        } catch {
            printError()
        }
    } while inputValue == nil
    
    guard let userValue = inputValue else {
        return
    }
    
    let thisGameResult = compareValue(myValue: userValue, otherValue: generateComputerValue())
    if thisGameResult == .draw {
        printWinner(winner: thisTurnPlayer)
        startRockPaperScissors()
    } else {
        printWhosTurn(winner: compareWhosTurn(thisGameState: thisGameResult))
        startMukjjaipa(thisTurnPlayer: compareWhosTurn(thisGameState: thisGameResult))
    }
}

startRockPaperScissors()
