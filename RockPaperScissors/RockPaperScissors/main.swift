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

var isGameOver = false

func startGame() {
    while isGameOver == false {
        printMenu()
        
        do {
            let userInput = try receiveUserInput()
            try checkUserInput(input: userInput)
        } catch ScissorsRockPaperError.wrongInput {
            printWrongInput()
        } catch ScissorsRockPaperError.notConverted {
            printWrongInput()
        } catch {
            print(error)
        }
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func receiveUserInput() throws -> String {
    guard let input = readLine() else {
        throw ScissorsRockPaperError.wrongInput
    }
    
    return input
}

func createRandomNumber(_ range: ClosedRange<Int> = 1...3) -> Int {
    return Int.random(in: range)
}

func playScissorsRockPaper(input: String) throws {
    do {
        let usersPick = try convertUserInput(to: input)
        
        let computerRandomNumber = createRandomNumber()
        let computerPick: ScissorsRockPaper = try match(to: computerRandomNumber)
        
        compare(to: usersPick, with: computerPick)
        
    } catch ScissorsRockPaperError.notConverted {
        printWrongInput()
    } catch {
        print(error)
    }
}

func checkUserInput(input: String) throws {
    switch input {
    case "0":
        exitGame()
    case "1","2","3":
        try playScissorsRockPaper(input: input)
    default:
        throw ScissorsRockPaperError.wrongInput
    }
}

func compare(to usersPick: ScissorsRockPaper, with computerRandomPick: ScissorsRockPaper) {
    if usersPick == computerRandomPick {
        print("비겼습니다!")
    } else if usersPick == computerRandomPick.moveNextCase() {
        print("이겼습니다!")
        exitGame()
    } else {
        print("졌습니다!")
        exitGame()
    }
}

func convertUserInput(into input: String) throws -> ScissorsRockPaper {
    guard let number = Int(input) else {
        throw ScissorsRockPaperError.notConverted
    }
    
    let usersPick: ScissorsRockPaper = try match(to: number)
    return usersPick
}

func match(to number: Int) throws -> ScissorsRockPaper {
    guard let convertedScissorsRockPaper = ScissorsRockPaper(rawValue: number) else {
        throw ScissorsRockPaperError.notConverted
    }
    
    return convertedScissorsRockPaper
}

func printWrongInput() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printGameOver() {
    print("게임 종료")
}

func exitGame() {
    printGameOver()
    isGameOver = true
}

startGame()
