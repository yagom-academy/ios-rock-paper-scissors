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

func checkUserInput(input: String) {
    switch input {
    case "0":
        GameOver()
    case "1","2","3":
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func convert(to input: String) throws -> ScissorsRockPaper {
    guard let convertedInteger = Int(input),
          let convertedScissorsRockPaper = ScissorsRockPaper(rawValue: convertedInteger) else {
              throw ScissorsRockPaperError.notConverted
          }
    
    return convertedScissorsRockPaper
}

func printGameOver() {
    print("게임 종료")
}

func GameOver() {
    printGameOver()
    isGameOver = true
}

startGame()
