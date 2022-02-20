import Foundation

class RockPaperScissors {
    
    func selectGameMenu() -> String {
        print(Messages.StartAndEndMessage.startOfFirstGame, terminator: PunctuationMarks.colon)
        guard let userInput = readLine() else { return PunctuationMarks.emptyString }
        return userInput
    }
    
    func returnValidNumbers(of userInput: String) -> Int? {
        if NumbersForGame.ValidNumbersForGame.contains(userInput) {
            guard let intUserInput = Int(userInput) else { return nil }
            return intUserInput
        } else {
            print(Messages.ErrorMessage.wrongInput)
            startGame(selectGameMenu())
            return nil
        }
    }
    
    func startGame(_ userInput: String) {
        let endingNumber = 0
        guard let validNumber = returnValidNumbers(of: userInput) else { return }
        
        if validNumber == endingNumber {
            print(Messages.StartAndEndMessage.endOfGame)
            return
        } else {
            decideWinner(validNumber)
        }
    }
    
    func decideWinner(_ validNumber: Int) {
        let allowedNumberRange: ClosedRange<Int> = 1...3
        let computerNumber = Int.random(in: allowedNumberRange)
        let numberToDecideWinner: Int = validNumber - computerNumber
        
        switch numberToDecideWinner {
        case NumbersForGame.winNumber[0], NumbersForGame.winNumber[1]:
            let mukjipa = MukJiPa()
            print(Messages.ResultMessage.win)
            mukjipa.isTurnOfUser = true
            mukjipa.startGame(mukjipa.selectGameMenu())
        case NumbersForGame.defeatNumber[0], NumbersForGame.defeatNumber[1]:
            let mukjipa = MukJiPa()
            print(Messages.ResultMessage.defeat)
            mukjipa.isTurnOfUser = false
            mukjipa.startGame(mukjipa.selectGameMenu())
        default:
            print(Messages.ResultMessage.draw)
            startGame(selectGameMenu())
        }
    }
}
