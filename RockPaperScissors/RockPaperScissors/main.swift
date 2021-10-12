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
    
    init(userInput: Int) {
        switch userInput {
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
}

enum Validity {
    case invalid
    case valid(userInput: Int)
}

func getUserInput() -> Int? {
    guard let userInput = readLine()?.replacingOccurrences(of: " ", with: "") else { return nil }
    return Int(userInput)
}

func isWithinRange(input: Int) -> Bool {
    return (0...Sign.count).contains(input)
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

func generatePlayersSign(userInput: Int) -> (userSign: Sign, computerSign: Sign) {
    let userSign = Sign(userInput: userInput)
    let computerSign = SignFactory.generateRandomElement()
    
    return (userSign, computerSign)
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
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func printInputError() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printGameResult(gameResult: GameResult?) {
    switch gameResult {
    case .userWin:
        print("이겼습니다!")
    case .computerWin:
        print("졌습니다!")
    case .draw:
        print("비겼습니다!")
    default:
        fatalError("\(#function)에 전달된 인자의 값이 nil입니다")
    }
}

func printGameOver() {
    print("게임 종료")
}

func playGame() {
    printMenu()
    let userInput = getUserInput()
    let validationResult = isValid(userInput: userInput)
    
    switch validationResult {
    case .invalid:
        printInputError()
        playGame()
    case .valid(0):
        printGameOver()
    case .valid(let userInput):
        let (userSign, computerSign) = generatePlayersSign(userInput: userInput)
        let gameResult = checkWinner(userSign: userSign, computerSign: computerSign)
        printGameResult(gameResult: gameResult)
        (gameResult == .draw) ? playGame() : printGameOver()
    }
}

playGame()


