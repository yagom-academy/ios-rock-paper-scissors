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
    
    init(rockPaperScissorsUserInput: Int) {
        switch rockPaperScissorsUserInput {
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
    
    init(mukJjiPpaUserInput: Int) {
        switch mukJjiPpaUserInput {
        case 1:
            self = .rock
        case 2:
            self = .scissors
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
    case same
}

enum Player: CustomStringConvertible {
    case user
    case computer
    
    var description: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        }
    }
}

enum Game: Equatable {
    case rockPaperScissors
    case mukJjiPpa(prevResult: GameResult)
}

enum Validity {
    case invalid
    case valid(userInput: Int)
}

enum Menu: Int {
    case zero
    case one
    case two
    case three
}

func getUserInput() -> Int? {
    guard let userInput = readLine()?.replacingOccurrences(of: " ", with: "") else {
        return nil
    }
    return Int(userInput)
}

func isWithinRange(input: Int) -> Bool {
    switch input {
    case Menu.zero.rawValue, Menu.one.rawValue, Menu.two.rawValue, Menu.three.rawValue:
        return true
    default:
        return false
    }
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

func generatePlayersSign(userInput: Int, gameType: Game) -> (userSign: Sign, computerSign: Sign) {
    let userSign: Sign

    if gameType == .rockPaperScissors {
        userSign = Sign(rockPaperScissorsUserInput: userInput)
    } else {
        userSign = Sign(mukJjiPpaUserInput: userInput)
    }
    
    let computerSign = SignFactory.generateRandomElement()
    
    return (userSign, computerSign)
}

func checkGameResult(userSign: Sign, computerSign: Sign) -> GameResult {
    if userSign == computerSign.counter {
        return .userWin
    } else if userSign == computerSign {
        return .same
    } else {
        return .computerWin
    }
}

func checkWinner(prevResult: GameResult) -> Player? {
    if prevResult == .userWin {
        return Player.user
    } else if prevResult == .computerWin {
        return Player.computer
    } else {
        return nil
    }
}

func printGameMenu(gameType: Game) {
    switch gameType {
    case .rockPaperScissors:
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    case .mukJjiPpa(let prevResult):
        guard let player = checkWinner(prevResult: prevResult) else {
            return
        }
        print("[\(player) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
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
    case .same:
        print("비겼습니다!")
    default:
        print("컴퓨터가 판단할 수 없습니다")
    }
}

func printMukJjiPpaGameResult(gameResult: GameResult) {
    guard let currentTurn = checkWinner(prevResult: gameResult) else {
        return
    }
    
    print("\(currentTurn)의 턴입니다.")
}

func printGameOver() {
    print("게임 종료")
}

func printFinalWinner(finalResult: GameResult) {
    guard let finalWinner = checkWinner(prevResult: finalResult) else {
        return
    }
    
    print("\(finalWinner)의 승리!")
}

func playRockPaperScissorsGame() -> GameResult? {
    printGameMenu(gameType: .rockPaperScissors)
    let userInput = getUserInput()
    let validationResult = isValid(userInput: userInput)
    var gameResult: GameResult?
    
    switch validationResult {
    case .invalid:
        printInputError()
        gameResult = playRockPaperScissorsGame()
    case .valid(0):
        printGameOver()
        return nil
    case .valid(let userInput):
        let (userSign, computerSign) = generatePlayersSign(userInput: userInput, gameType: .rockPaperScissors)
        gameResult = checkGameResult(userSign: userSign, computerSign: computerSign)
        printGameResult(gameResult: gameResult)
        gameResult = (gameResult == .same) ? playRockPaperScissorsGame() : (gameResult)
    }
    return gameResult
}

func playMukJjiPpaGame(prevResult: GameResult) -> GameResult? {
    printGameMenu(gameType: .mukJjiPpa(prevResult: prevResult))
    let userInput = getUserInput()
    let validationResult = isValid(userInput: userInput)
    
    switch validationResult {
    case .invalid:
        printInputError()
        let gameResult = playMukJjiPpaGame(prevResult: prevResult)
        return gameResult
    case .valid(0):
        printGameOver()
        return nil
    case .valid(let userInput):
        let (userSign, computerSign) = generatePlayersSign(userInput: userInput, gameType: .mukJjiPpa(prevResult: prevResult))
        let currentGameResult = checkGameResult(userSign: userSign, computerSign: computerSign)
        printMukJjiPpaGameResult(gameResult: currentGameResult)
        let finalGameResult = (currentGameResult == .same) ? (prevResult) : playMukJjiPpaGame(prevResult: currentGameResult)
        return finalGameResult
    }
}

func playGame() {
    guard let rockPaperScissorsResult = playRockPaperScissorsGame() else {
        return
    }
    guard let finalResult = playMukJjiPpaGame(prevResult: rockPaperScissorsResult) else {
        return
    }
    
    printFinalWinner(finalResult: finalResult)
}

playGame()
