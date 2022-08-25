func startGame() {
    startRockPaperScissors()
}

func startRockPaperScissors() {
    let rockPaperScissors = RockPaperScissors()
    let userNumber = rockPaperScissors.getUserInput()
    let computerNumber = rockPaperScissors.generateRandomComputerNumber()
    rockPaperScissors.switchMenu(userNumber: userNumber, computerNumber: computerNumber)
}

func startMukjjippa(with: String) {
    let mukjjippaGame = mukjjippa()
    let userNumber = mukjjippaGame.getUserInput()
    let computerNumber = mukjjippaGame.generateRandomComputerNumber()
    mukjjippaGame.switchMenu(userNumber: userNumber, computerNumber: computerNumber)
}

func translateNumbersToHandSigns(of input: Int) -> HandSigns? {
    return HandSigns(rawValue: input)
}
