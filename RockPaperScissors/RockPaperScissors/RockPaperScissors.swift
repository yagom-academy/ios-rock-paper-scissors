//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 레옹아범, Rhode, Rowan on 2022/12/26.
//

class RockPaperScissors {
    var isFirst = true

    private enum Menu: Int, CaseIterable {
        case end
        case scissors
        case rock
        case paper
    }
    
    func startGame() {
        displayMenu()
        
        let userChoice = readInput()
        let computerChoice = generateRockPaperScissors()
        guard let winner = compare(userChoice, and: computerChoice) else {
            return startGame()
        }
    
        printResult(winner: winner)
        startMookZziPpa(winner: winner)
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

extension RockPaperScissors {
    private enum MookZziPpa: Int {
        case mook = 1
        case zzi
        case ppa
    }
    
    func calculateTurn(winner: String) {
        if isFirst {
            isFirst = false
        } else {
            print("\(winner)의 턴입니다.")
        }
        displayMookZziPpa(winner: winner)
    }
    
    private func displayMookZziPpa(winner: String) {
        let menuMessage = "[\(winner)턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    func startMookZziPpa(winner: String) {
        calculateTurn(winner: winner)
        
        let userChoice = readInput()
        let computerChoice = generateRockPaperScissors()
        var mookZziPpaWinner = ""
        
        switch userChoice {
        case .success(let selectedUserNumber):
            mookZziPpaWinner = decideWinner(user: selectedUserNumber, computer: computerChoice)
        case .failure(let error):
            print(error.rawValue)
            startMookZziPpa()
        }
        
        if mookZziPpaWinner == "사용자" {
            self.winner = mookZziPpaWinner
            startMookZziPpa()
        } else if mookZziPpaWinner == "컴퓨터" {
            self.winner = mookZziPpaWinner
            startMookZziPpa()
        } else if mookZziPpaWinner == "무승부"{
            print("\(winner)의 승리!")
        }
    }
}
