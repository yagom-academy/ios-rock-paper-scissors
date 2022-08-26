//
//  MukChiBbaGame.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

func startMukChiBbaGame(isUserTurn: Bool) {
    var isExitGame: Bool = false
    var isUserTurn = isUserTurn
    var roundOneWinner: String {
        get {
            if isUserTurn == true {
                return "사용자"
            } else {
                return "컴퓨터" }
        }
    }
    
    while isExitGame == false {
        print("[\(roundOneWinner) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = filterUserInput() else {
            if isUserTurn == true {
                isUserTurn = !isUserTurn
            }
            continue
        }
        
        var exitOrTurnChange = (canExit: isExitGame, checkUserTurn: isUserTurn)
        exitOrTurnChange = decideWhoWins(userNumber: userNumber, takeUserWin: isUserTurn)
        
        switch exitOrTurnChange {
        case (canExit: true, _):
            isExitGame = true
        case (canExit: false, checkUserTurn: false):
            isUserTurn = false
        case (canExit: false, checkUserTurn: true):
            isUserTurn = true
        }
    }
}

func decideWhoWins(userNumber: Int, takeUserWin: Bool) -> (Bool,Bool) {
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
        return (false,true)
    default:
        return (false,false)
    }
}
