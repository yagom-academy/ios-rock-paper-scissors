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
        guard let winner = compare(userChoice, and: computerChoice) else {
            return startGame()
        }
    
        printResult(winner: winner)
    }
    
    func printResult(winner: String) {
        switch winner {
        case "사용자":
            print("이겼습니다!")
        case "컴퓨터":
            print("졌습니다!")
        case "무승부":
            print("비겼습니다!")
            startGame()
        default:
            print("게임종료")
        }
    }
    
    func compare(_ userChoice: Result<Menu, InputError>, and computerChoice: Menu) -> String? {
        switch userChoice {
        case .success(let userMenu):
            let winner = decideWinner(user: userMenu, computer: computerChoice)
            return winner
        case .failure(let error):
            print(error.rawValue)
            return nil
        }
    }
    
    private func displayMenu() {
        let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func readInput() -> Result<Menu, InputError> {
        guard let input = readLine(),
              let number = Int(input),
              let menu = Menu(rawValue: number) else {
            return .failure(.invalidInput)
        }
        
        switch menu {
        case .end, .scissors, .rock, .paper:
            return .success(menu)
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
