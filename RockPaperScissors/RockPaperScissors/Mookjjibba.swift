func playMookjjibba() {
    let userHand = inputUserHand()
    switch userHand {
    case .rock, .scissors, .paper :
        comparePlayerAndComputerMookjjibba(userHand: userHand, computerHand: convertComputerNumberToHand())
    case .exit :
        printExitMessage()
    default :
        print(Message.invalidInput.rawValue)
        turn.inputWinner(winner: Player.computer.rawValue)
        startGame(game: Game.mookjjibba)
    }
}

func comparePlayerAndComputerMookjjibba(userHand: Hand, computerHand: Hand) {
    var isWin: Bool {
        return computerHand == .rock && userHand == .scissors || computerHand == .scissors && userHand == .paper ||
        computerHand == .paper && userHand == .rock
    }
    if isWin {
        printAndChangeTurn(winner: Player.user.rawValue, message: Message.userTurn.rawValue)
    } else if computerHand == userHand {
        print("\(turn.winner)의 승리!")
    } else {
        printAndChangeTurn(winner: Player.computer.rawValue, message: Message.computerTurn.rawValue)
    }
}

func printAndChangeTurn(winner: String, message: String) {
    print(message)
    turn.inputWinner(winner: winner)
    startGame(game: Game.mookjjibba)
}
