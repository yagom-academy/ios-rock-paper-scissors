enum GameError: Error {
    case invalidInput
    case unknownError
}
enum GameResult {
    case win
    case lose
    case draw
}

class RockScissorPaper {
    var handOfComputer = 0
    var handOfUser = 0
    
    func initialize() {
        handOfUser = 0
        handOfComputer = Int.random(in: 1...3)
    }
    func startGame() {
        var userInput = 0
        outer: while true{
            initialize()
            printMenu()
            do {
                userInput = try getUserInput()
                if userInput == 0 {
                    break outer
                }
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
            let winner = compareHands(handOfUser, with: handOfComputer)
            printResult(winner)
        }
    }

    func compareHands(_ user: Int, with computer: Int) -> GameResult {
        return GameResult.win
    }
    
    func printMenu() {
        
    }
    
    func getUserInput() throws ->Int {
        return 0
    }
    
    func printResult(_ input: GameResult) {
        
    }
}

