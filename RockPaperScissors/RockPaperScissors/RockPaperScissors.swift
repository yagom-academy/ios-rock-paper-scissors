func playRockPaperScissors() {
    let userHand = inputUserHand()
    switch userHand {
    case .rock, .scissors, .paper :
        comparePlayerAndComputerRockPaperScissors(userHand: userHand, computerHand: convertComputerNumberToHand())
    case .exit :
        printExitMessage()
    default :
        print(Message.invalidInput.rawValue)
        startGame(game: Game.rockPaperScissors)
    }
}

func comparePlayerAndComputerRockPaperScissors(userHand: Hand, computerHand: Hand) {
    var isWin: Bool {
        return computerHand == .scissors && userHand == .rock || computerHand == .rock && userHand == .paper ||
        computerHand == .paper && userHand == .scissors
    }
    if isWin {
        verifyGameResult(gameResult: RockPaperScissorsResult.win, winner: Player.user.rawValue)
    } else if computerHand == userHand {
        verifyGameResult(gameResult: RockPaperScissorsResult.draw)
    } else {
        verifyGameResult(gameResult: RockPaperScissorsResult.lose, winner: Player.computer.rawValue)
    }
}

func verifyGameResult(gameResult: RockPaperScissorsResult, winner: String = "") {
    if gameResult == RockPaperScissorsResult.win || gameResult == RockPaperScissorsResult.lose {
        turn.inputWinner(winner: winner)
        printResultAndstartGame(gameResult: gameResult, game: Game.mookjjibba)
    } else {
        printResultAndstartGame(gameResult: gameResult, game: Game.rockPaperScissors)
    }
}

func printResultAndstartGame (gameResult: RockPaperScissorsResult, game: Game) {
    printRockPaperScissorsResult(gameResult: gameResult)
    startGame(game: game)
}
