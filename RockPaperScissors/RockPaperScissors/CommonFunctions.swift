func printGameMenu(game: String) {
    switch game {
    case "rockpaperscissors":
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        playRockPaperScissors()
    case "mookjjibba":
        print("[\(turn.winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        playMookjjibba()
    default:
        break
    }
}

func inputUserHand() -> Int {
    guard let convertedInput = Int(readLine() ?? "") else { return 4 }
    return convertedInput
}

func convertUserInputToHand(input: Int) -> Hand? {
    return Hand(rawValue: input)
}

func convertComputerNumberToHand() -> Hand? {
    return Hand(rawValue: Int.random(in: 1...3))
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
