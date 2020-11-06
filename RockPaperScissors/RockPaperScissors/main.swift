//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Game {
    case gawibawibo
    case mukzzibba
    
    func consoleMessage() -> String {
        switch self {
        case .gawibawibo:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case .mukzzibba:
            guard let winner = turn else { return "" }
            return "[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
        }
    }
}

enum Player: String {
    case computer
    case user
}

func whosTurn(user: Int, computer: Int) {
    switch computer {
    case 1:
        turn = user == 2 ? .user : .computer
    case 2:
        turn = user == 3 ? .user : .computer
    case 3:
        turn = user == 1 ? .user : .computer
    default:
        return
    }
}

func gawibawibo(user: String, computer: String) {
    guard let userNum = Int(user), let computerNum = Int(computer) else { return }
    
    if userNum == computerNum {
        print("비겼습니다!")
    }
    else {
        whosTurn(user: userNum, computer: computerNum)
    }
    
    guard let winner = turn else { return }
    if winner == .user {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

func mukzzibba(user: String, computer: String) {
    guard let userNum = Int(user), let computerNum = Int(computer) else { return }
    
    if userNum == computerNum {
        guard let winner = turn else { return }
        print("\(winner.rawValue)의 승리!")
        flag = false
    } else {
        whosTurn(user: userNum, computer: computerNum)
    
        guard let winner = turn else { return }
        print("\(winner.rawValue)의 턴입니다")
    }
}

var flag = true
var mode: Game = .gawibawibo
var turn: Player?

while(flag) {
    guard let computerPick = ["1", "2", "3"].randomElement() else { break }
    
    print(mode.consoleMessage(), terminator: " ")
    guard let userPick = readLine() else { break }
    
    switch userPick {
    case "0":
        flag = false
    case "1", "2", "3":
        if mode == .gawibawibo {
            gawibawibo(user: userPick, computer: computerPick)
            guard let _ = turn else { continue }
            mode = .mukzzibba
        } else if mode == .mukzzibba {
            mukzzibba(user: userPick, computer: computerPick)
        }
    default:
        if mode == .gawibawibo {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        } else if mode == .mukzzibba {
            turn = .computer
        }
    }
}
