//
//  MukChiBbaGame.swift
//  RockPaperScissors
//
//  Created by Victor on 2022/08/24.
//

import Foundation

func readyMukChiBbaGame(takeUserWin: Bool) {
    var exit: Bool = false
    var isUserWin = takeUserWin
    var computerNumber: Int
    var roundOneWinner: String {
        get {
            if isUserWin == true {
                return "사용자"
            } else {
                return "컴퓨터" }
        }
    }
    
    while exit == false {
        computerNumber = Int.random(in: 1...3)
        print("[\(roundOneWinner) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = filterUserInput() else {
            if isUserWin == true {
                isUserWin = !isUserWin
            }
            continue
        }
        
        var exitOrTurnChange = (canExit: exit, checkUserWin: isUserWin)
        exitOrTurnChange = startMukChiBbaGame(computerNumber: computerNumber, userNumber: userNumber, takeUserWin: isUserWin)
        
        switch exitOrTurnChange {
        case (canExit: true, _):
            exit = true
        case (canExit: false, checkUserWin: false):
            isUserWin = false
            continue
        case (canExit: false, checkUserWin: true):
            isUserWin = true
            continue
        }
    }
}

func startMukChiBbaGame(computerNumber: Int, userNumber: Int, takeUserWin: Bool) -> (Bool,Bool) {
    var takeUserWin = takeUserWin
    let computerPick = MukChiBba(rawValue: computerNumber)
    let userPick = MukChiBba(rawValue: userNumber)
    let compareTwoThings = (computerPick, userPick)
    
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
    case (.muk, .bba), (.chi, .muk), (.bba, .chi):
        takeUserWin = true
    default:
        takeUserWin = false
    }
    return (false,takeUserWin)
}
