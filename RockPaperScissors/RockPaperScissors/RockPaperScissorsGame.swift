//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 나이든별,Judy,웡빙 on 2022/04/18.
//

import Foundation

class RockPaperScissorsGame {
    private var userSelection: RockPaperScissors?
    private var computerSelection: RockPaperScissors?
    private var turnIndicator: GameResult = .win
}

extension RockPaperScissorsGame {
    
    func printGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료: 0>:", terminator: " ")
        receiveUserInput()
    }
    
    private func printMukjipaMenu() {
        print("[\(turnIndicator.rawValue) 턴] 묵(1) 찌(2) 빠(3)! <종료: 0>:", terminator: " ")
        receiveMukjipaInput()
    }
}

extension RockPaperScissorsGame {
    
    private func receiveUserInput() {
        let userInputNumber = readLine()
        
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
            printGameMenu()
            return
        }
        
        playGame()
    }
    
    private func playGame() {
        makeComputerSelection()
        let gameResult = judgeVictory(userSide: userSelection, computerSide: computerSelection)
        if gameResult == .win {
            print("이겼습니다!")
            turnIndicator = gameResult
            printMukjipaMenu()
        } else if gameResult == .lose {
            print("졌습니다!")
            turnIndicator = gameResult
            printMukjipaMenu()
        } else {
            print("비겼습니다!")
            printGameMenu()
            return
        }
    }
    
    private func makeComputerSelection() {
        let computerRandomNumber = Int.random(in: 1...3)
        
        switch computerRandomNumber {
        case 1:
            computerSelection = .scissors
        case 2:
            computerSelection = .rock
        case 3:
            computerSelection = .paper
        default:
            return
        }
    }
    
    private func judgeVictory(userSide: RockPaperScissors?, computerSide: RockPaperScissors?) -> GameResult {
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

extension RockPaperScissorsGame {
    
    private func receiveMukjipaInput() {
        let userInputNumber = readLine()
        
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
            printMukjipaMenu()
            return
        }
        
        playMukjipa()
    }
    
    private func playMukjipa() {
        makeComputerSelection()
        let mukjipaResult = judgeVictory(userSide: userSelection, computerSide: computerSelection)
        if mukjipaResult == .draw {
            print("\(turnIndicator.rawValue)의 승리!")
            endGame()
            return
        } else if mukjipaResult == .win {
            turnIndicator = .win
        } else {
            turnIndicator = .lose
        }
        
        printTurn()
        printMukjipaMenu()
    }
    
    private func printTurn() {
        print("\(turnIndicator.rawValue)의 턴입니다")
    }
}

extension RockPaperScissorsGame {
    
    private func displayError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    private func endGame() {
        print("게임 종료")
    }
}
