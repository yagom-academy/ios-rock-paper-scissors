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

enum ScissorsRockPaper: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    func winCase() -> ScissorsRockPaper {
        switch self {
        case .scissors:
            return .rock
        case .rock:
            return .paper
        case .paper:
            return .scissors
        }
    }
    
    static func createRandomCase() -> ScissorsRockPaper? {
        return ScissorsRockPaper.allCases.randomElement()
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

enum Player: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

extension Player: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}

let user: Player = .user
let computer: Player = .computer

var attacker: (player: Player, pick: ScissorsRockPaper)
var defender: (player: Player, pick: ScissorsRockPaper)

func startMukChiBaGame() {
    printMukChiBaMenu()
}

func startScissorsRockPaperGame() {
    printScissorsRockPaperMenu()
    
    do {
        let userInput = try receiveUserInput()
        
        guard isExitGame(input: userInput) == false else {
            printGameOver()
            return
        }
        
        let usersPick: ScissorsRockPaper = try convert(into: userInput)
        
        guard let computerPick: ScissorsRockPaper = ScissorsRockPaper.createRandomCase() else {
            startScissorsRockPaperGame()
            return
        }
        
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

func printScissorsRockPaperMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func printMukChiBaMenu() {
    print("묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
}

func receiveUserInput() throws -> Int {
    guard let input = readLine(), let convertedInteger = Int(input) else {
        throw ScissorsRockPaperError.wrongInput
    }
    
    return convertedInteger
}

func compare(to usersPick: ScissorsRockPaper, with computerRandomPick: ScissorsRockPaper) -> ScissorsRockPaperGameResult {
    if usersPick == computerRandomPick {
        return .draw
    } else if usersPick == computerRandomPick.winCase() {
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
