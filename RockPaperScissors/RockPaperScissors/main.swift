//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum ScissorsRockPaperError: Error {
    case wrongInput
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
    
    func show() {
        print(self.rawValue)
    }
}

func startScissorsRockPaperGame() {
    printMenu()
    
    do {
        let userInput = try receiveUserInput()
        
        if isExitGame(input: userInput) == true {
            printGameOver()
            return
        }
        
        let usersPick: ScissorsRockPaper = try convert(into: userInput)
        
        let computerRandomNumber = createRandomNumber()
        let computerPick: ScissorsRockPaper = try convert(into: computerRandomNumber)
        
        let gameResult: ScissorsRockPaperGameResult = compare(to: usersPick, with: computerPick)
        gameResult.show()
                
        if isDrawScissorsRockPaperGame(to: gameResult) == true {
            startScissorsRockPaperGame()
        } else {
            printGameOver()
        }
        
    } catch ScissorsRockPaperError.wrongInput,
            ScissorsRockPaperError.notConverted {
        printErrorMessage()
        startScissorsRockPaperGame()
    } catch {
        print(error)
    }
}

func isDrawScissorsRockPaperGame(to result: ScissorsRockPaperGameResult) -> Bool {
    return result == .draw 
}

func isExitGame(input: Int) -> Bool {
    return input == 0
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

func compare(to usersPick: ScissorsRockPaper, with computerRandomPick: ScissorsRockPaper) -> ScissorsRockPaperGameResult {
    if usersPick == computerRandomPick {
        return .draw
    } else if usersPick == computerRandomPick.moveNextCase() {
        return .win
    } else {
        return .lose
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
