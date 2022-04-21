func playMookjjibba() {
    let userHand = inputUserHand()
    switch userHand {
    case 1, 2, 3 :
        comparePlayerAndComputerMookjjibba(userHand: convertUserInputToHand(input: userHand), computerHand: convertComputerNumberToHand())
    case 0 :
        printExitMessage()
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        turn.inputWinner(winner: "컴퓨터")
        printGameMenu(game: "mookjjibba")
    }
}

func comparePlayerAndComputerMookjjibba(userHand: Hand?, computerHand: Hand?) {
    if computerHand == .rock && userHand == .scissors || computerHand == .scissors && userHand == .paper ||
        computerHand == .paper && userHand == .rock {
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
    printGameMenu(game: "mookjjibba")
}
