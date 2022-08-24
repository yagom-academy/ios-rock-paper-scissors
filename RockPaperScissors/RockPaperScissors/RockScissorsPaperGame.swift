//
//  step1.swift
//  RockPaperScissors
//
//  Created by Victor on 2022/08/23.
//

import Foundation

enum RockScissorsPaper: Int {
    case 가위 = 1
    case 바위 = 2
    case 보 = 3
}

// readyRound1
// startRound1
// readyRound2
// startRound2

func startRockScissorsPaperGame() {
    var computerNumber: Int
    var exitGame: Bool = false

    while exitGame == false {
        computerNumber = Int.random(in: 1...3)

        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")

        guard let input = readLine(),
            let userNumber = Int(input.replacingOccurrences(of: " ", with: ""))else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }

        exitGame = showGameResult(by : computerNumber, and : userNumber)
    }
}

func showGameResult(by computerChoice: Int, and userChoice: Int) -> Bool {
    var exit: Bool = false
    var userWin: Bool
    let selectMenu = userChoice
    let computerPick = RockScissorsPaper(rawValue: computerChoice)
    let userPick = RockScissorsPaper(rawValue: userChoice)
    let compareTwoThings = (컴퓨터가낸것: computerPick, 유저가낸것: userPick)
    
    if selectMenu == 0 {
        print("게임 종료")
        exit = true
        return exit
    } else if computerPick == userPick {
        print("비겼습니다!")
        return exit
    }
    
    switch compareTwoThings {
    case (컴퓨터가낸것: .가위, 유저가낸것: .바위),
        (컴퓨터가낸것: .바위, 유저가낸것: .보),
        (컴퓨터가낸것: .보, 유저가낸것: .가위):
        print("이겼습니다!")
        userWin = true
        startMukChiBbaGame(takeUserWin: userWin)
    case (컴퓨터가낸것: .가위, 유저가낸것: .보),
        (컴퓨터가낸것: .바위, 유저가낸것: .가위),
        (컴퓨터가낸것: .보, 유저가낸것: .바위):
        print("졌습니다!")
        userWin = false
        startMukChiBbaGame(takeUserWin: userWin)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }

    return exit
}

func startMukChiBbaGame(takeUserWin: Bool) -> Bool {
    var exit: Bool = false
    var takeUserWin = takeUserWin
    var computerNumber: Int
    var roundOneWinner: String {
        get {
            if takeUserWin == true { return "사용자" } else { return "컴퓨터" }
        }
    }
    
    while exit == false {
        computerNumber = Int.random(in: 1...3)
        print("[\(roundOneWinner) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = readLine() ,
              let userNumber = Int(input.replacingOccurrences(of: " ", with: ""))
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            takeUserWin = !takeUserWin
            continue
        }
        
        let computerPick = RockScissorsPaper(rawValue: computerNumber)
        let userPick = RockScissorsPaper(rawValue: userNumber)
        let compareTwoThings = (컴퓨터가낸것: computerPick, 유저가낸것: userPick)
        
        if userNumber == 0 {
            print("게임 종료")
            exit = true
            return exit
        } else if computerPick == userPick && takeUserWin == true {
            print("사용자의 승리!")
            exit = true
            return exit
        } else if computerPick == userPick && takeUserWin == false {
            print("컴퓨터의 승리!")
            exit = true
            return exit
        }
    }
}
