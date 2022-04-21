func playRockPaperScissors() {
    let userHand = inputUserHand()
    switch userHand {
    case 1, 2, 3 :
        comparePlayerAndComputerRockPaperScissors(userHand: convertUserInputToHand(input: userHand), computerHand: convertComputerNumberToHand())
    case 0 :
        printExitMessage()
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        printGameMenu(game: "rockpaperscissors")
    }
}

func comparePlayerAndComputerRockPaperScissors(userHand: Hand?, computerHand: Hand?) {
    if computerHand == .scissors && userHand == .rock || computerHand == .rock && userHand == .paper ||
        computerHand == .paper && userHand == .scissors {
        printResultAndGameMenu(gameResult: GameResult.win, winner: "사용자")
    } else if computerHand == userHand {
        printResultAndGameMenu(gameResult: GameResult.draw)
    } else {
        printResultAndGameMenu(gameResult: GameResult.lose, winner: "컴퓨터")
    }
}

func printResultAndGameMenu(gameResult: GameResult, winner: String = "") {
    if gameResult == GameResult.win || gameResult == GameResult.lose {
        turn.inputWinner(winner: winner)
        printResult(gameResult: gameResult)
        printGameMenu(game: "mookjjibba")
    } else {
        printResult(gameResult: gameResult)
        printGameMenu(game: "rockpaperscissors")
    }
}
