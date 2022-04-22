import CoreGraphics
func startGame(game: Game) {
    switch game {
    case .rockPaperScissors:
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        playRockPaperScissors()
    case .mookjjibba:
        print("[\(turn.winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        playMookjjibba()
    }
}

func inputUserHand() -> Hand {
    guard let convertedInput = Int(readLine() ?? "") else { return Hand.invalidInput }
    guard convertedInput < 5 && convertedInput >= 0 else { return Hand.invalidInput }
    return Hand.allCases[convertedInput]
}

func convertComputerNumberToHand() -> Hand {
    return Hand.allCases[Int.random(in: 1...3)]
}

func printRockPaperScissorsResult(gameResult: RockPaperScissorsResult) {
    switch gameResult {
    case .draw:
        print("\(RockPaperScissorsResult.draw.rawValue)")
    case .win:
        print("\(RockPaperScissorsResult.win.rawValue)")
    case .lose:
        print("\(RockPaperScissorsResult.lose.rawValue)")
    }
}

func printExitMessage() {
    print("게임 종료")
}
