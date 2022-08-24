//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

class RockPaperScissors {
    
    func startGame() {
        print(GameText.start.rawValue, terminator: "")
        guard let inputtedUserNumber: Int = Int(bindUserInput()) else {
            print(GameText.caution.rawValue)
            startGame()
            return
        }
        playRockPaperScissors(inputtedUserNumber)
    }
    
    func bindUserInput() -> String {
        guard let userInput = readLine() else {
            return bindUserInput()
        }
        return userInput
    }
    
    func playRockPaperScissors(_ userNumber: Int) {
        switch selectOption(userNumber) {
        case .exit:
            print(GameOver.exit.rawValue)
        case .play:
            compareNumbers(makeComputerNumber(), userNumber)
        default:
            print(GameText.caution)
            startGame()
        }
    }
    
    func selectOption(_ userNumber: Int) -> UserSelect {
        switch userNumber {
        case 0:
            return .exit
        case 1, 2, 3:
            return .play
        default:
            return .wrong
        }
    }
    
    func makeComputerNumber() -> Int {
        let computerNumber: Int = Int.random(in: 1...3)
        return computerNumber
    }
    
    func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int) {
        let differenceNumber: GameJudgment = makeResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            print(GameJudgment.win.rawValue)
        case .lose:
            print(GameJudgment.lose.rawValue)
        default:
            print(GameJudgment.draw.rawValue)
            startGame()
        }
    }
    
    func makeResult(_ differenceNumber: Int) -> GameJudgment {
        switch differenceNumber {
        case -2, 1:
            return .win
        case -1, 2:
            return .lose
        default:
            return .draw
        }
    }
}
