func translateNumbersToHandSigns(of input: Int) -> HandSigns? {
    return HandSigns(rawValue: input)
}

func startGame() {
    let rockPaperScissors: RockPaperScissors = RockPaperScissors()
    rockPaperScissors.startRockPaperScissors()
}
