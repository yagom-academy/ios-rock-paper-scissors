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
    private var turnIndicator: Bool?
}

extension RockPaperScissorsGame {
    
    func printGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료: 0>:", terminator: " ")
        startGame()
    }
}

extension RockPaperScissorsGame {
    
    private func startGame() {
        receiveUserInput()
        playGame()
    }
    
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
            
            if turnIndicator == nil {
                printGameMenu()
            } else {
                print("묵찌빠 메뉴")
            }
        }
    }
    
    private func playGame() {
        makeComputerSelection()
        let gameResult = judgeVictory(userSide: userSelection, computerSide: computerSelection)
        if gameResult == 1 {
            print("이겼습니다!")
            mukjipa()
        } else if gameResult == -1 {
            print("졌습니다!")
            mukjipa()
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
    
    private func judgeVictory(userSide: RockPaperScissors?, computerSide: RockPaperScissors?) -> Int {
        switch (userSide, computerSide) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return -1
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return 1
        default:
            return 0
        }
    }
}

extension RockPaperScissorsGame {
    
    private func mukjipa() {
        
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
