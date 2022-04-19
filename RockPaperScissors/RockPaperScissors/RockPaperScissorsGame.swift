//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 이원빈 on 2022/04/18.
//

import Foundation

class RockPaperScissorsGame {
    private var userSelection: RockPaperScissors?
    private var computerSelection: RockPaperScissors?
}

extension RockPaperScissorsGame {
    
    func printGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료: 0>:", terminator: " ")
        receiveUserInput()
        return
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
            print("잘못된 입력입니다. 다시 시도해주세요.")
            printGameMenu()
            return
        }
        
        startGame()
        return
    }
    
    private func startGame() {
        makeComputerSelection()
        judgeVictory(userSide: userSelection, computerSide: computerSelection)
        return
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
        return
    }
    
    private func judgeVictory(userSide: RockPaperScissors?, computerSide: RockPaperScissors?) {
        switch (userSide, computerSide) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            print("졌습니다!")
            endGame()
            return
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            print("이겼습니다!")
            endGame()
            return
        default:
            print("비겼습니다!")
            printGameMenu()
            return
        }
    }
    
    private func endGame() {
        print("게임 종료")
        return
    }
    
}
