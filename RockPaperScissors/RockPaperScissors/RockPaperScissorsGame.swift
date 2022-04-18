//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 이원빈 on 2022/04/18.
//

import Foundation

class RockPaperScissorsGame {
    var userSelection: RockPaperScissors?
    var computerSelection: RockPaperScissors?
}

extension RockPaperScissorsGame {
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료: 0>:", terminator: " ")
        getUserInput()
        return
    }
    
    private func getUserInput() {
        let userInput = readLine()
        
        switch userInput {
        case "1":
            userSelection = .scissor
        case "2":
            userSelection = .rock
        case "3":
            userSelection = .paper
        case "0":
            endGame()
            return
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            printMenu()
            return
        }
        
        startGame()
        return
    }
    
    private func makeComputerSelection() {
        let selection = Int.random(in: 1...3)
        
        switch selection {
        case 1:
            computerSelection = .scissor
        case 2:
            computerSelection = .rock
        case 3:
            computerSelection = .paper
        default:
            return
        }
        
        return
    }
    
    private func startGame() {
        makeComputerSelection()
        judgeVictory(selectedMenu: userSelection, computer: computerSelection)
        
        return
    }
    
    private func judgeVictory(selectedMenu: RockPaperScissors?, computer: RockPaperScissors?) {
        switch (selectedMenu, computer) {
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
            print("졌습니다!")
            endGame()
            return
        case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
            print("이겼습니다!")
            endGame()
            return
        default:
            print("비겼습니다!")
            printMenu()
            return
        }
    }
    
    private func endGame() {
        print("게임 종료")
        return
    }
}
