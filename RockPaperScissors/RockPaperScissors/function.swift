func makeComputerRandomNumber() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

func inputUserNumber() -> Int {
    var userInput: Int
    let inputNumber = readLine() ?? ""
    userInput = checkUserInputNumber(userInput: inputNumber)
    return userInput
}

func checkUserInputNumber(userInput: String) -> Int {
    var selectedNumber = ExceptionalInput.wrongInput.correspondingNumber
    let rockPaperScissorCases = RockPaperScissor.allCases.map( {$0.correspondingNumber} )
    let closeInputCase = [ExceptionalInput.closeInput.correspondingNumber]
    let verifiedInputCases = rockPaperScissorCases + closeInputCase
    if let verifiedUserInput = Int(userInput) {
        switch verifiedUserInput {
        case _ where verifiedInputCases.contains(verifiedUserInput):
            selectedNumber = verifiedUserInput
        default:
            selectedNumber = ExceptionalInput.wrongInput.correspondingNumber
        }
    }
    return selectedNumber
}

func compareTwoNumbers (userInput: Int, computerInput: Int, winningNumberCase: Array<(Int, Int)>) -> String {
    let selectedNumberCase = winningNumberCase
    var matchResult = GameResult.draw.result
    let comparisonGroup = (userInput, computerInput)
    if userInput == computerInput {
        matchResult = GameResult.draw.result
    } else if selectedNumberCase.contains(where: { $0 == comparisonGroup }) {
        matchResult = GameResult.win.result
    } else {
        matchResult = GameResult.lose.result
    }
    return matchResult
}
