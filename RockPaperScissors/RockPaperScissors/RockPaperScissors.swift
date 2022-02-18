import Foundation

class RockPaperScissors {
    func selectGameMenu() -> String {
        print(StartAndEndMessage.startOfFirstGame, terminator: PunctuationMarks.colon)
        guard let userInput = readLine() else { return PunctuationMarks.emptyString }
        return userInput
    }
    
    func checkValidity(of userInput: String) -> Int? {
        let validNumbersForGame = ["0", "1", "2", "3"]
        
        if validNumbersForGame.contains(userInput) {
            guard let intUserInput = Int(userInput) else { return nil }
            return intUserInput
        } else {
            print(ErrorMessage.wrongInput)
            startGame(selectGameMenu())
            return nil
        }
    }
    
    func startGame(_ userInput: String) {
        let endingNumber = 0
        guard let validNumber = checkValidity(of: userInput) else { return }
        
        if validNumber == endingNumber {
            print(StartAndEndMessage.endOfGame)
            return
        } else {
            decideWinner(validNumber)
            mukjipa.startGame(mukjipa.selectGameMenu())
        }
    }
    
    func decideWinner(_ validNumber: Int) {
        let allowedNumberRange: ClosedRange<Int> = 1...3
        let computerNumber = Int.random(in: allowedNumberRange)
        let numberToDecideWinner: Int = validNumber - computerNumber
        
        switch numberToDecideWinner {
        case Decision.winNumber[0], Decision.winNumber[1]:
            print(ResultMessage.win)
            isTurnOfUser = true
        case Decision.defeatNumber[0], Decision.defeatNumber[1]:
            print(ResultMessage.defeat)
            isTurnOfUser = false
        default:
            print(ResultMessage.draw)
            startGame(selectGameMenu())
        }
    }
}
