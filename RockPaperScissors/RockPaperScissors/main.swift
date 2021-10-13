//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// MARK: - Enums
enum Message: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case draw = "비겼습니다!"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
}

enum GameError: String, Error {
    case invalidInput = "잘못된 입력입니다. 다시 시도해주세요."
    case exit = "게임 종료"
}

enum ExpectedHand: String, CaseIterable, Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs == .paper, rhs == .scissors {
            return true
        }
        return lhs.rawValue < rhs.rawValue
    }
    
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

// MARK: - Functions
func readUserInput() throws -> ExpectedHand {
    let input = readLine()
    
    switch input {
    case "0":
        throw GameError.exit
    case .some(let input):
        if let userHand: ExpectedHand = ExpectedHand(rawValue: input) {
            return userHand
        }
        throw GameError.invalidInput
    case .none:
        throw GameError.invalidInput
    }
}

func judgeGameResult(_ input: ExpectedHand) {
    var computerHand: ExpectedHand {
        var hands = ExpectedHand.allCases.shuffled()
        return hands.removeFirst()
    }
    
    if computerHand == input {
        print(Message.draw.rawValue)
        runProgram()
        return
    } else if computerHand < input {
        print(Message.win.rawValue)
        print(GameError.exit.rawValue)
    } else {
        print(Message.lose.rawValue)
        print(GameError.exit.rawValue)
    }
    return
}

func runProgram() {
    print(Message.menu.rawValue, terminator: "")
    let userHand: ExpectedHand
    
    do {
        userHand = try readUserInput()
        judgeGameResult(userHand)
    } catch GameError.invalidInput {
        print(GameError.invalidInput.rawValue)
        runProgram()
    } catch GameError.exit {
        print(GameError.exit.rawValue)
    } catch {
        print("Unexpected error: \(error).")
    }
}

// MARK: - Program start
runProgram()
