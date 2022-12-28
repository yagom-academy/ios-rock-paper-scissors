//
//  mukjjibba.swift
//  RockPaperScissors
//
//  Created by Riji, Rilla on 2022/12/28.
//



var isUserWin = false
var mukjjibbaMode = false

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

func handleMukjjibbaError(userInput: Result<GameMenu, GameError>) -> GameMenu? {
    switch userInput {
    case .failure(_):
        print("잘못된 입력입니다. 다시 시도해주세요")
        isUserWin = false
        startMukjjibbaGame()
        return nil
    case .success(let handMotion):
        if handMotion == .endGame {
            print("게임종료")
            return nil
        }
        return handMotion
    }
}


func startMukjjibbaGame() {
    printMukjjibbaMenu()
    let userInput = checkAvailability(input: getUserInput())
    let userHandMotion = handleGameError(userInput: userInput)
    let computerHandMotion = makeRandomHandMotion()
    compareMukjjibba(userHandMotion, with: computerHandMotion)
}
