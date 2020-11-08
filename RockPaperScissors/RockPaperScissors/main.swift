//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Game {
    case gawibawibo
    case mukzzibba
    
    func consoleMessage(turn: inout Player?) -> String? {
        switch self {
        case .gawibawibo:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case .mukzzibba:
            assert(turn != nil, "승패가 갈렸을 때만 묵찌빠 게임 가능!")
            guard let winner = turn else { return nil }
            return "[\(winner.description()) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
        }
    }
}

enum Player: String {
    case computer
    case user = "사용자"
    
    func description() -> String {
        switch self {
        case .computer:
            return "컴퓨터"
        case .user:
            return "사용자"
        }
    }
}

func whosTurn(user: Int, computer: Int) -> Player? {
    switch computer {
    case 1:
        return user == 2 ? .user : .computer
    case 2:
        return user == 3 ? .user : .computer
    case 3:
        return user == 1 ? .user : .computer
    default:
        return nil
    }
}

func gawibawibo(userPick: String, computerPick: String, turn: inout Player?) {
    guard let userNum = Int(userPick), let computerNum = Int(computerPick) else {
        print("1, 2, 3 중에 하나를 입력해주세요.")
        return
    }
    
    if userNum == computerNum {
        print("비겼습니다!")
    } else {
        turn = whosTurn(user: userNum, computer: computerNum)
    }
    
    guard let winner = turn else { return }
    if winner == .user {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

func mukzzibba(userPick: String, computerPick: String, turn: inout Player?) {
    guard let userNum = Int(userPick), let computerNum = Int(computerPick) else {
        print("유효한 입력이 아닙니다. 다시 시도해주세요.")
        return
    }
    
    if userNum == computerNum {
        guard let winner = turn else { return }
        print("\(winner.rawValue)의 승리!")
        flag = false
    } else {
        turn = whosTurn(user: userNum, computer: computerNum)
    
        guard let winner = turn else { return }
        print("\(winner.rawValue)의 턴입니다")
    }
}

private var flag = true

func game() {
    var mode: Game = .gawibawibo
    var turn: Player?

    while(flag) {
        guard let computerPick = ["1", "2", "3"].randomElement() else { break }
        
        guard let message = mode.consoleMessage(turn: &turn) else { break }
        print(message, terminator: " ")
        
        guard let userPick = readLine() else {
            print("유효하지 않은 입력으로 게임이 종료됩니다.")
            break
        }
        
        switch userPick {
        case "0":
            flag = false
        case "1", "2", "3":
            if mode == .gawibawibo {
                gawibawibo(userPick: userPick, computerPick: computerPick, turn: &turn)
                guard let _ = turn else { continue }
                mode = .mukzzibba
            } else if mode == .mukzzibba {
                mukzzibba(userPick: userPick, computerPick: computerPick, turn: &turn)
            }
        default:
            if mode == .gawibawibo {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            } else if mode == .mukzzibba {
                turn = .computer
            }
        }
    }
}

game()
