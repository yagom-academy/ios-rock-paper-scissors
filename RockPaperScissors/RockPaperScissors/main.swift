//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// MARK: - Enums
enum Message: CustomStringConvertible {
    var description: String {
        switch self {
        case .menu:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case .draw:
            return "비겼습니다!"
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        }
    }
    
    case menu
    case draw
    case win
    case lose
}

enum GameError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidInput:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .exit:
            return "게임 종료"
        }
    }
    
    case invalidInput
    case exit
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
        print(Message.draw)
        runProgram()
        return
    } else if computerHand < input {
        print(Message.win)
        print(GameError.exit)
    } else {
        print(Message.lose)
        print(GameError.exit)
    }
    return
}

func runProgram() {
    print(Message.menu, terminator: "")
    let userHand: ExpectedHand
    
    do {
        userHand = try readUserInput()
        judgeGameResult(userHand)
    } catch GameError.invalidInput {
        print(GameError.invalidInput)
        runProgram()
    } catch GameError.exit {
        print(GameError.exit)
    } catch {
        print("Unexpected error: \(error).")
    }
}

// MARK: - Program start
runProgram()
