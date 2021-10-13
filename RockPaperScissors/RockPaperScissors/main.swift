//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum ScissorsRockPaperError: Error {
    case wrongInput
    case menuIsNotExist
    case notConverted
}

enum ScissorsRockPaper: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    func moveNextCase() -> ScissorsRockPaper {
        switch self {
        case .scissors:
            return .rock
        case .rock:
            return .paper
        case .paper:
            return .scissors
        }
    }
}

enum ScissorsRockPaperGameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func startScissorsRockPaperGame() {
    printMenu()
    
    do {
        let userInput = try receiveUserInput()
        try checkUserInput(input: userInput)
        
        if isExitGame(input: userInput) == true {
            printGameOver()
            return
        }
        
        let usersPick: ScissorsRockPaper = try convert (into: userInput)
        
        let computerRandomNumber = createRandomNumber()
        let computerPick: ScissorsRockPaper = try convert (into: computerRandomNumber)
        
        let gameResult: ScissorsRockPaperGameResult = compare(to: usersPick, with: computerPick)
        printGameResult(to: gameResult)
        
        if isDrawScissorsRockPaperGame(to: gameResult) == true {
            startScissorsRockPaperGame()
        }
        
        printGameOver()
        
    } catch ScissorsRockPaperError.wrongInput {
        printErrorMessage()
    } catch ScissorsRockPaperError.menuIsNotExist {
        printErrorMessage()
    } catch ScissorsRockPaperError.notConverted {
        printErrorMessage()
    } catch {
        print(error)
    }
}

func isDrawScissorsRockPaperGame(to result: ScissorsRockPaperGameResult) -> Bool {
    if result == .draw {
        return true
    } else {
        return false
    }
}

func printGameResult(to result: ScissorsRockPaperGameResult) {
    print(result.rawValue)
}

func isExitGame(input: Int) -> Bool {
    if input == 0 {
        return true
    } else {
        return false
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func receiveUserInput() throws -> Int {
    guard let input = readLine(), let convertedInteger = Int(input) else {
        throw ScissorsRockPaperError.wrongInput
    }
    
    return convertedInteger
}

func createRandomNumber(_ range: ClosedRange<Int> = 1...3) -> Int {
    return Int.random(in: range)
}

func checkUserInput(input: Int) throws {
    switch input {
    case 0...3:
        return
    default:
        throw ScissorsRockPaperError.menuIsNotExist
    }
}

func compare(to usersPick: ScissorsRockPaper, with computerRandomPick: ScissorsRockPaper) -> ScissorsRockPaperGameResult {
    if usersPick == computerRandomPick {
        return ScissorsRockPaperGameResult.draw
    } else if usersPick == computerRandomPick.moveNextCase() {
        return ScissorsRockPaperGameResult.win
    } else {
        return ScissorsRockPaperGameResult.lose
    }
}

func convert(into number: Int) throws -> ScissorsRockPaper {
    guard let convertedScissorsRockPaper = ScissorsRockPaper(rawValue: number) else {
        throw ScissorsRockPaperError.notConverted
    }
    
    return convertedScissorsRockPaper
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printGameOver() {
    print("게임 종료")
}

startScissorsRockPaperGame()
