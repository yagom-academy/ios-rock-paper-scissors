//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 나이든별,Judy,웡빙 on 2022/04/18.
//

final class MukjipaGame {
    
    func printRockPaperScissorsMenu() {
        print("가위(1), 바위(2), 보(3)! <종료: 0>:", terminator: " ")
        receiveUserInput()
    }
    
    private func printMukjipaMenu(_ turnIndicator: GameResult) {
        print("[\(turnIndicator.rawValue) 턴] 묵(1) 찌(2) 빠(3)! <종료: 0>:", terminator: " ")
        receiveMukjipaInput(turnIndicator)
    }
}

extension MukjipaGame {
    
    private func receiveUserInput() {
        let userInputNumber = readLine()
        var userSelection: RockPaperScissors? = nil
        
        switch userInputNumber {
        case "1":
            userSelection = .scissors
        case "2":
            userSelection = .rock
        case "3":
            userSelection = .paper
        case "0":
            endGame()
            return
        default:
            displayError()
            printRockPaperScissorsMenu()
            return
        }
        
        playRockPaperScissorsGame(with: userSelection)
    }
    
    private func playRockPaperScissorsGame(with userSelection: RockPaperScissors?) {
        let computerSelection = makeComputerSelection()
        
        let gameResult = judgeVictory(by: userSelection, and: computerSelection)
        printGameResult(result: gameResult)
        
        if gameResult == .draw {
            printRockPaperScissorsMenu()
        } else {
            let turnIndicator = gameResult
            printMukjipaMenu(turnIndicator)
        }
    }
    
    private func printGameResult(result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
    
    private func makeComputerSelection() -> RockPaperScissors? {
        let computerRandomNumber = Int.random(in: 1...3)
        var computerSelection: RockPaperScissors? = nil
        
        switch computerRandomNumber {
        case 1:
            computerSelection = .scissors
        case 2:
            computerSelection = .rock
        case 3:
            computerSelection = .paper
        default:
            return nil
        }
        
        return computerSelection
    }
    
    private func judgeVictory(by userSide: RockPaperScissors?, and computerSide: RockPaperScissors?) -> GameResult {
        switch (userSide, computerSide) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .lose
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        default:
            return .draw
        }
    }
}

extension MukjipaGame {
    
    private func receiveMukjipaInput(_ turnIndicator: GameResult) {
        let userInputNumber = readLine()
        var userSelection: RockPaperScissors? = nil
        var turnIndicator = turnIndicator
        
        switch userInputNumber {
        case "1":
            userSelection = .rock
        case "2":
            userSelection = .scissors
        case "3":
            userSelection = .paper
        case "0":
            endGame()
            return
        default:
            displayError()
            turnIndicator = .lose
            printMukjipaMenu(turnIndicator)
            return
        }
        
        playMukjipaGame(with: userSelection, turn: turnIndicator)
    }
    
    private func playMukjipaGame(with userSelection: RockPaperScissors?, turn turnIndicator: GameResult) {
        let computerSelection = makeComputerSelection()
        var turnIndicator = turnIndicator
        
        let mukjipaResult = judgeVictory(by: userSelection, and: computerSelection)
        
        if mukjipaResult == .draw {
            print("\(turnIndicator.rawValue)의 승리!")
            endGame()
            return
        } else {
            turnIndicator = mukjipaResult
        }
        
        printTurn(turnIndicator)
        printMukjipaMenu(turnIndicator)
    }
    
    private func printTurn(_ turnIndicator: GameResult) {
        print("\(turnIndicator.rawValue)의 턴입니다")
    }
}

extension MukjipaGame {
    
    private func displayError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    private func endGame() {
        print("게임 종료")
    }
}
