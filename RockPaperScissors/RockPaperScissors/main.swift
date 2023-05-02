//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, Mary
//

import Foundation

enum Menu: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
    
    var winningOpponent: Menu {
        switch self {
        case .scissors:
            return .paper
        case .rock:
            return .scissors
        case .paper:
            return .rock
        case .exit:
            return .exit
        }
    }
}

enum Result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

enum GameError: Error {
    case menuNotFound
    case unknownError
    
    var errorMessage: String {
        switch self {
        case .menuNotFound:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .unknownError:
            return "알 수 없는 오류입니다."
        }
    }
}

func startGame() {
    do {
        let menu = try inputMenu()
        
        guard menu != .exit else {
            print("게임 종료")
            return
        }
        let gameResult = try playGame(menu)
        
        print(gameResult.rawValue)
        
        if gameResult == .draw { startGame() }
    } catch GameError.menuNotFound {
        print("\(GameError.menuNotFound.errorMessage)")
        startGame()
    } catch {
        print("\(GameError.unknownError.errorMessage)")
    }
}

func inputMenu() throws -> Menu {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let inputValue = readLine(),
          let menu = Menu(rawValue: inputValue)
    else { throw GameError.menuNotFound }
        
    return menu
}

func playGame(_ usersChoice: Menu) throws -> Result {
    guard let computersChoice = Menu(rawValue: String(Int.random(in: 1...3)))
    else { throw GameError.unknownError }
    print("컴퓨터 : \(computersChoice)")

    if usersChoice == computersChoice {
        return .draw
    } else if usersChoice.winningOpponent == computersChoice {
        return .win
    } else {
        return .lose
    }
}

startGame()
