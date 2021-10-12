//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Sign: CaseIterable {
    case scissors
    case rock
    case paper
    
    init(userSign: Int) {
        switch userSign {
        case 1:
            self = .scissors
        case 2:
            self = .rock
        case 3:
            self = .paper
        default:
            fatalError("\(Self.self)의 \(#function)에서 초기화에 실패했습니다")
        }
    }
    
    var counter: Self {
        switch self {
        case .scissors:
            return .rock
        case .paper:
            return .scissors
        case .rock:
            return .paper
        }
    }
    
    static var count: Int {
        return Self.allCases.count
    }
}

enum SignFactory {
    static func generateRandomElement() -> Sign {
        guard let randomSign = Sign.allCases.randomElement() else {
            fatalError("\(#function) 함수에서 랜덤값을 생성하는 데에 오류가 발생했습니다")
        }
        return randomSign
    }
}

enum GameResult {
    case userWin
    case computerWin
    case draw
    
    var message: String {
        switch self {
        case .userWin:
            return "이겼습니다!"
        case .computerWin:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
}

func checkWinner(userSign: Sign, computerSign: Sign) -> GameResult {
    if userSign == computerSign.counter {
        return .userWin
    } else if userSign == computerSign {
        return .draw
    } else {
        return .computerWin
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
}

func printInputError() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func getUserInput() -> Int? {
    guard let userInput = readLine()?.replacingOccurrences(of: " ", with: "") else { return nil }
    return Int(userInput)
}

func isWithinRange(input: Int) -> Bool {
    return (0...Sign.count).contains(input)
}

enum Validity {
    case invalid
    case valid(userInput: Int)
}

func isValid(userInput: Int?) -> Validity {
    guard let userInput = userInput else {
        return .invalid
    }
    guard isWithinRange(input: userInput) else {
        return .invalid
    }
    
    return .valid(userInput: userInput)
}

func playGame() {
    var gameResult: GameResult? = nil
    
    repeat {
        let userInput = getUserInput()
        let validationResult = isValid(userInput: userInput)
        
        switch validationResult {
        case .invalid:
            continue
        case .valid(0):
            continue
        case .valid(let userInput):
            break
        }
    } while gameResult != .draw
}
