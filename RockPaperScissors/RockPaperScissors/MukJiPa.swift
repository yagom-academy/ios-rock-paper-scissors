import Foundation

class MukJiPa: RockPaperScissors {
    override func selectGameMenu() -> String {
        print("[\(decideTurn()) 턴]", StartAndEndMessage.startOfSecondGame, terminator: PunctuationMarks.colon)
        guard let userInput = readLine() else { return PunctuationMarks.emptyString }
        return userInput
    }
    
    override func checkValidity(of userInput: String) -> Int? {
        let validNumbersForGame = ["0", "1", "2", "3"]
        if validNumbersForGame.contains(userInput) {
            guard let intUserInput = Int(userInput) else { return nil }
            return intUserInput
        } else {
            print(ErrorMessage.wrongInput)
            isTurnOfUser = false
            startGame(selectGameMenu())
            return nil
        }
    }
    
    override func startGame(_ userInput: String) {
        let endingNumber = 0
        guard let validNumber = checkValidity(of: userInput) else { return }
        if validNumber == endingNumber {
            print(StartAndEndMessage.endOfGame)
            return
        } else {
            decideWinner(validNumber)
        }
    }
    
    override func decideWinner(_ validNumber: Int) {
        thisTurn = decideTurn()
        var winner: String = PunctuationMarks.emptyString
        let allowedNumberRange: ClosedRange<Int> = 1...3
        let computerNumber = Int.random(in: allowedNumberRange)
        let numberToDecideWinner: Int = validNumber - computerNumber
        
        if validNumber == computerNumber {
            print("\(thisTurn)의 승리!")
            print(StartAndEndMessage.endOfGame)
            return
        }
        
        switch numberToDecideWinner {
        case Decision.winNumber[0], Decision.winNumber[1]:
            winner = Player.user
        default:
            winner = Player.computer
        }
        
        if winner == thisTurn {
            print("\(thisTurn)의 턴입니다")
            startGame(selectGameMenu())
        } else {
            isTurnOfUser = !isTurnOfUser
            print("\(decideTurn())의 턴입니다")
            startGame(selectGameMenu())
        }
    }
}
