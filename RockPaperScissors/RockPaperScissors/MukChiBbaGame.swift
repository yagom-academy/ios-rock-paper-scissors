//
//  MukChiBbaGame.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

func readyMukChiBbaGame(takeUserWin: Bool) {
    var isExitGame: Bool = false
    var isUserWin = takeUserWin
    var roundOneWinner: String {
        get {
            if isUserWin == true {
                return "사용자"
            } else {
                return "컴퓨터" }
        }
    }
    
    while isExitGame == false {
        print("[\(roundOneWinner) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = filterUserInput() else {
            if isUserWin == true {
                isUserWin = !isUserWin
            }
            continue
        }
        
        var exitOrTurnChange = (canExit: isExitGame, checkUserWin: isUserWin)
        exitOrTurnChange = startMukChiBbaGame(userNumber: userNumber, takeUserWin: isUserWin)
        
        switch exitOrTurnChange {
        case (canExit: true, _):
            isExitGame = true
        case (canExit: false, checkUserWin: false):
            isUserWin = false
            continue
        case (canExit: false, checkUserWin: true):
            isUserWin = true
            continue
        }
    }
}

func startMukChiBbaGame(userNumber: Int, takeUserWin: Bool) -> (Bool,Bool) {
    var takeUserWin = takeUserWin
    let computerPick = MukChiBba.allCases.randomElement()
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
