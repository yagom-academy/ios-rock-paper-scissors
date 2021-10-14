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

func playGame(handOfUser: Int, handOfComputer: Int) {
    let pointToWin: [RockPaperScissors: RockPaperScissors] = [.scissor: .paper,
                                                                .rock: .scissor,
                                                                .paper: .rock]
    
    guard let definedValue = RockPaperScissors(rawValue: handOfUser) ,
          let matchedWin = pointToWin[definedValue]?.rawValue else {
        return
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

func isRestartGame(handOfUser: Int, handOfComputer: Int) -> Bool {
    var isRestart: Bool = false
    let exit = 0
    let run = 1...3
    
    switch handOfUser {
    case exit :
        print("게임 종료")
        isRestart = false
    case run : isDraw(handOfUser: handOfUser, handOfComputer: handOfComputer) ?
            isRestart = true :
            playGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        isRestart = true
    }
    return isRestart
}

func startGame() {
    var isRestart: Bool = false
    do {
        let handOfUser = try getUserInput()
        let handOfComputer = try generateRandomNumber()
        isRestart = isRestartGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
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
