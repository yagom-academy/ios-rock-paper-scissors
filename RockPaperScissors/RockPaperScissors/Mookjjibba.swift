func playMookjjibba() {
    let userHand = inputUserHand()
    switch userHand {
    case .rock, .scissors, .paper :
        comparePlayerAndComputerMookjjibba(userHand: userHand, computerHand: convertComputerNumberToHand())
    case .exit :
        printExitMessage()
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        turn.inputWinner(winner: "컴퓨터")
        printGameMenu(game: Game.mookjjibba)
    }
}

func comparePlayerAndComputerMookjjibba(userHand: Hand?, computerHand: Hand?) {
    var isWin: Bool {
        return computerHand == .rock && userHand == .scissors || computerHand == .scissors && userHand == .paper ||
        computerHand == .paper && userHand == .rock
    }
    if isWin {
        print("사용자의 턴입니다")
        changeTurn(winner: "사용자")
    } else if computerHand == userHand {
        print("\(turn.winner)의 승리!")
    } else {
        print("컴퓨터의 턴입니다")
        changeTurn(winner: "컴퓨터")
    }
}

func changeTurn(winner: String) {
    turn.inputWinner(winner: winner)
    printGameMenu(game: Game.mookjjibba)
}
