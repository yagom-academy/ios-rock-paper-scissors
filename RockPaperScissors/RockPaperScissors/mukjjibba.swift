//
//  mukjjibba.swift
//  RockPaperScissors
//
//  Created by Riji, Rilla on 2022/12/28.
//



var isUserWin = false

func printMukjjibbaMenu() {
    let turn = checkTurn()
    print("[\(turn)]턴 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    
}

func checkTurn() -> String {
    if isUserWin {
        return "사용자"
    } else {
        return "컴퓨터"
    }
}

func compareMukjjibba(_ userInput: GameMenu?, with computerInput: GameMenu?) {
    guard let user = userInput, let computer = computerInput else { return }
    
    switch (user, computer) {
    case (.scissor, .scissor), (.rock, .rock), (.paper, .paper) :
        checkMukjjibbaResult()
    case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) :
        isUserWin = true
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) :
        isUserWin = false
    default :
        return
    }
}

func checkMukjjibbaResult() {
    if isUserWin {
        printMukjjibbaGameResult(gameResult: .win)
    } else {
        printMukjjibbaGameResult(gameResult: .lose)
    }
}

func printMukjjibbaGameResult(gameResult: GameResult) {
    switch gameResult {
    case .win:
        print("사용자의 승리!")
    case .lose:
        print("컴퓨터의 승리!")
    default :
        return
    }
}
