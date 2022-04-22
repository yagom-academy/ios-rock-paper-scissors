func playRockPaperScissors() {
    switch inputUserHand() {
    case .rock, .scissors, .paper :
        comparePlayerAndComputerRockPaperScissors(userHand: userHand, computerHand: convertComputerNumberToHand())
    case .exit :
        printExitMessage()
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame(game: Game.rockPaperScissors)
    }
}

func comparePlayerAndComputerRockPaperScissors(userHand: Hand?, computerHand: Hand?) {
    var isWin: Bool {
        computerHand == .scissors && userHand == .rock || computerHand == .rock && userHand == .paper ||
        computerHand == .paper && userHand == .scissors
    }
    if isWin {
        printResultAndGameMenu(gameResult: RockPaperScissorsResult.win, winner: "사용자")
    } else if computerHand == userHand {
        printResultAndGameMenu(gameResult: RockPaperScissorsResult.draw)
    } else {
        printResultAndGameMenu(gameResult: RockPaperScissorsResult.lose, winner: "컴퓨터")
    }
}

func printResultAndGameMenu(gameResult: RockPaperScissorsResult, winner: String = "") {
    if gameResult == RockPaperScissorsResult.win || gameResult == RockPaperScissorsResult.lose {
        turn.inputWinner(winner: winner)
        printRockPaperScissorsResult(gameResult: gameResult)
        startGame(game: Game.mookjjibba)
    } else {
        printRockPaperScissorsResult(gameResult: gameResult)
        startGame(game: Game.rockPaperScissors)
    }
}
