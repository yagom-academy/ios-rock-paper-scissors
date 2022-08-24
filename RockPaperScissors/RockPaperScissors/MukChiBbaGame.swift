//
//  MukChiBbaGame.swift
//  RockPaperScissors
//
//  Created by Victor on 2022/08/24.
//

import Foundation

func readyMukChiBbaGame(takeUserWin: Bool) {
    var exit: Bool = false
    var takeUserWin = takeUserWin
    var computerNumber: Int
    var roundOneWinner: String {
        get {
            if takeUserWin == true {
                return "사용자"
            } else {
                return "컴퓨터" }
        }
    }
    
    while exit == false {
        computerNumber = Int.random(in: 1...3)
        print("[\(roundOneWinner) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = filterUserInput() else {
            if takeUserWin == true {
                takeUserWin = !takeUserWin
            }
            continue
        }
        
        var exitOrTurnChange = (종료하기: exit, 유저이겼나체크: takeUserWin)
        exitOrTurnChange = startMukChiBbaGame(computerNumber: computerNumber, userNumber: userNumber, takeUserWin: takeUserWin)
        
        switch exitOrTurnChange {
        case (종료하기: true, _):
            exit = true
        case (종료하기: false, 유저이겼나체크: false):
            takeUserWin = false
            continue
        case (종료하기: false, 유저이겼나체크: true):
            takeUserWin = true
            continue
        }
    }
}

func startMukChiBbaGame(computerNumber: Int, userNumber: Int, takeUserWin: Bool) -> (Bool,Bool) {
    var takeUserWin = takeUserWin
    let computerPick = MukChiBba(rawValue: computerNumber)
    let userPick = MukChiBba(rawValue: userNumber)
    let compareTwoThings = (컴퓨터가낸것: computerPick, 유저가낸것: userPick)
    
    if userNumber == 0 {
        print("게임 종료")
        return (true,takeUserWin)
    } else if computerPick == userPick && takeUserWin == true {
        print("사용자의 승리!")
        return (true,takeUserWin)
    } else if computerPick == userPick && takeUserWin == false {
        print("컴퓨터의 승리!")
        return (true,takeUserWin)
    }
    
    switch compareTwoThings {
    case (컴퓨터가낸것: .묵, 유저가낸것: .빠),
        (컴퓨터가낸것: .찌, 유저가낸것: .묵),
        (컴퓨터가낸것: .빠, 유저가낸것: .찌):
        takeUserWin = true
    default:
        takeUserWin = false
    }
    return (false,takeUserWin)
}
