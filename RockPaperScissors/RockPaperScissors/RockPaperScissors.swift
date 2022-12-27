//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 레옹아범, Rhode, Rowan on 2022/12/26.
//

import Foundation

class RockPaperScissors {
    enum Menu: Int, CaseIterable {
        case end = 0
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    func startGame() {
        displayMenu()
        
        let userChoice = readInput()
        let computerChoice = generateRockPaperScissors()
        var winner: String = ""
        
        switch userChoice {
        case .success(let selectedUserNumber):
            winner = decideWinner(user: selectedUserNumber, computer: computerChoice)
        case .failure(let error):
            print(error.rawValue)
            startGame()
        }
        
        if winner == "사용자" {
            print("이겼습니다!")
        } else if winner == "컴퓨터" {
            print("졌습니다!")
        } else if winner == "무승부"{
            print("비겼습니다!")
            startGame()
        }
    }
    
    private func displayMenu() {
        let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func readInput() -> Result<Menu, InputError> {
        guard let input = readLine(), let number = Int(input) else {
            return .failure(.invalidInput)
        }
        
        switch number {
        case Menu.end.rawValue:
            return .success(.end)
        case Menu.scissors.rawValue:
            return .success(.scissors)
        case Menu.rock.rawValue:
            return .success(.rock)
        case Menu.paper.rawValue:
            return .success(.paper)
        default:
            return .failure(.invalidInput)
        }
    }
        
    private func generateRockPaperScissors() -> Menu {
        let result = Menu.allCases[Int.random(in: 1...3)]
        
        return result
    }
    
    private func decideWinner(user: Menu, computer: Menu) -> String {
        switch (user, computer) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return "사용자"
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return "컴퓨터"
        default:
            return "무승부"
        }
    }
}
