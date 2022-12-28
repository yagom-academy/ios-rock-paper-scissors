//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 레옹아범, Rhode, Rowan on 2022/12/26.
//

class RockPaperScissors {
    private enum Menu: Int, CaseIterable {
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
    
    private func compare(_ userChoice: Result<Menu, InputError>, and computerChoice: Menu) -> String? {
        switch userChoice {
        case .success(let userMenu):
            let winner = decideWinner(user: userMenu, computer: computerChoice)
            return winner
        case .failure(let error):
            print(error.rawValue)
            return nil
        }
    }
    
    private func decideWinner(user: Menu, computer: Menu) -> String {
        switch (user, computer) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return WinnerResult.user
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return WinnerResult.computer
        case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
            return WinnerResult.noWinner
        default:
            return ""
        }
    }
    
    private func printResult(winner: String) {
        switch winner {
        case WinnerResult.user:
            print("이겼습니다!")
        case WinnerResult.computer:
            print("졌습니다!")
        case WinnerResult.noWinner:
            print("비겼습니다!")
            startGame()
        default:
            print("게임종료")
        }
    }
}
