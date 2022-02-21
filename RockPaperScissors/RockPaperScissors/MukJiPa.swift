import Foundation

class MukJiPa: RockPaperScissors {
    var isTurnOfUser: Bool = false
    var thisTurn: String = PunctuationMarks.emptyString
    
    override func selectGameMenu() -> String {
        print("[\(decideTurn()) 턴]", Messages.StartAndEndMessage.startOfSecondGame, terminator: PunctuationMarks.colon)
        guard let userInput = readLine() else { return PunctuationMarks.emptyString }
        return userInput
    }
    
    override func returnValidNumbers(of userInput: String) -> Int? {
        
        if NumbersForGame.ValidNumbersForGame.contains(userInput) {
            guard let intUserInput = Int(userInput) else { return nil }
            return intUserInput
        } else {
            print(Messages.ErrorMessage.wrongInput)
            isTurnOfUser = false
            startGame(selectGameMenu())
            return nil
        }
    }
    
    override func startGame(_ userInput: String) {
        let endingNumber = 0
        guard let validNumber = returnValidNumbers(of: userInput) else { return }
        
        if validNumber == endingNumber {
            print(Messages.StartAndEndMessage.endOfGame)
            return
        } else {
            decideWinner(validNumber)
        }
    }
    
    override func decideWinner(_ validNumber: Int) {
        let allowedNumberRange: ClosedRange<Int> = 1...3
        let computerNumber = Int.random(in: allowedNumberRange)
        let numberToDecideWinner: Int = validNumber - computerNumber
        thisTurn = decideTurn()
        
        if validNumber == computerNumber {
            print(thisTurn,Messages.ResultMessage.victoryOfThisTurn)
            print(Messages.StartAndEndMessage.endOfGame)
            return
        }
        changeTurnAndRestartGame(numberToDecideWinner)
    }
    
    func changeTurnAndRestartGame(_ numberToDecideWinner: Int) {
        var winner: String = PunctuationMarks.emptyString

        switch numberToDecideWinner {
        case NumbersForGame.winNumber[0], NumbersForGame.winNumber[1]:
            winner = Player.user
        default:
            winner = Player.computer
        }
        
        if winner == thisTurn {
            print(thisTurn,Messages.ResultMessage.turn)
            startGame(selectGameMenu())
        } else {
            isTurnOfUser = !isTurnOfUser
            print(thisTurn,Messages.ResultMessage.turn)
            startGame(selectGameMenu())
        }
    }
    
    func decideTurn() -> String {
        if isTurnOfUser == true {
            return Player.user
        } else {
            return Player.computer
        }
    }
}
