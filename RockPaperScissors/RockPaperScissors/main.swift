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
    
    func next() -> ScissorsRockPaper {
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
        checkUserInput(input: receiveUserInput())
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func receiveUserInput() -> String {
    guard let input = readLine() else {
        return ""
    }
    
    return input
}

func createRandomNumber(_ range: ClosedRange<Int> = 1...3) -> Int {
    return Int.random(in: range)
}

func checkUserInput(input: String) {
    switch input {
    case "0":
        exitGame()
    case "1","2","3":
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func compare(to usersScissorsRockPaper: ScissorsRockPaper, with computerScissorsRockPaper: ScissorsRockPaper) {
    if usersScissorsRockPaper == computerScissorsRockPaper {
        print("비겼습니다!")
    } else if usersScissorsRockPaper == computerScissorsRockPaper.next() {
        print("이겼습니다!")
        exitGame()
    } else {
        print("졌습니다!")
        exitGame()
    }
}

func convertUserInput(to input: String) throws -> ScissorsRockPaper {
    guard let number = Int(input) else {
        throw ScissorsRockPaperError.notConverted
    }
    
    do {
        let usersPick: ScissorsRockPaper = try match(to: number)
        return usersPick
    } catch ScissorsRockPaperError.notConverted {
        throw ScissorsRockPaperError.notConverted
    }
}

func match(to number: Int) throws -> ScissorsRockPaper {
    guard let convertedScissorsRockPaper = ScissorsRockPaper(rawValue: number) else {
              throw ScissorsRockPaperError.notConverted
          }
    
    return convertedScissorsRockPaper
}

func printGameOver() {
    print("게임 종료")
}

func exitGame() {
    printGameOver()
    isGameOver = true
}

startGame()
