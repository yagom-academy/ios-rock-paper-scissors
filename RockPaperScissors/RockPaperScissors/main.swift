//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum RockPaperScissors: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
}

enum GameError: Error {
    case invalidValueError
    case emptyValueError
    case wrongChooseError
}

func getUserInput() throws -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
        throw GameError.invalidValueError
    }
    return userInputNumber
}

func generateRandomNumber() throws -> Int {
    let handsOfComputer: [Int] = RockPaperScissors.allCases.map({ $0.rawValue })
    
    guard let handOfComputer = handsOfComputer.randomElement() else {
        throw GameError.emptyValueError
    }
    
    return handOfComputer
}

func determineGameResult(handOfUser: Int, handOfComputer: Int) throws {
    let pointToWin: [RockPaperScissors: RockPaperScissors] = [.scissor: .paper,
                                                                .rock: .scissor,
                                                                .paper: .rock]
    
    guard let definedValue = RockPaperScissors(rawValue: handOfUser),
          let matchedWin = pointToWin[definedValue]?.rawValue else {
        throw GameError.emptyValueError
    }
    if matchedWin == handOfComputer {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

func isDraw(handOfUser: Int, handOfComputer: Int) -> Bool {
    if handOfUser == handOfComputer {
        print("비겼습니다!")
        return true
    }
    return false
}

func chooseGamePlaying(handOfUser: Int, handOfComputer: Int) throws {
    let gameOver = 0
    let gameRunning = 1...3
    
    switch handOfUser {
    case gameOver :
        print("게임 종료")
    case gameRunning :
        try determineGameResult(handOfUser: handOfUser, handOfComputer: handOfComputer)
    default:
        throw GameError.wrongChooseError
    }
}

func isRestartGame(handOfUser: Int, handOfComputer: Int) throws -> Bool {
    
    if isDraw(handOfUser: handOfUser, handOfComputer: handOfComputer) {
        return true
    } else if (0...3).contains(handOfUser) {
        try chooseGamePlaying(handOfUser: handOfUser, handOfComputer: handOfComputer)
        return false
    } else {
        throw GameError.invalidValueError
    }
}

func startGame() {
    var isRestart: Bool = false
    do {
        let handOfUser = try getUserInput()
        let handOfComputer = try generateRandomNumber()
        
        isRestart = try isRestartGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
    } catch GameError.invalidValueError {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    } catch GameError.emptyValueError {
        print("값이 비었습니다.")
    } catch {
        print(error)
    }
    
    if isRestart {
        startGame()
    }
}

startGame()
