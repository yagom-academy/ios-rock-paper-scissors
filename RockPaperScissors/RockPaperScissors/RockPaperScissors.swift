//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 레옹아범, Rhode, Rowan on 2022/12/26.
//

class RockPaperScissors {
    var isFirst = true
    var selectedRule: Rule = .rockpaperscissors
    
    func startGame() {
        displayMenu()
        
        let userChoice = readInput(rule: selectedRule)
        let computerChoice = generateRockPaperScissors(rule: selectedRule)
        guard let winner = compare(userChoice, and: computerChoice) else {
            return startGame()
        }
    
        printResult(winner: winner)
    }
    
    private func displayMenu() {
        let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func readInput(rule: Rule) -> Result<Menu, InputError> {
        guard let input = readLine(),
              let number = Int(input),
              let menu = Menu.get(number, type: rule) else {
            return .failure(.invalidInput)
        }
        
        switch menu {
        case .end, .scissors, .rock, .paper:
            return .success(menu)
        }
    }
    
    private func generateRockPaperScissors(rule: Rule) -> Menu? {
        let randomIndex = Int.random(in: 1...3)
        let result = Menu.get(randomIndex, type: rule)
        
        return result
    }
    
    private func compare(_ userChoice: Result<Menu, InputError>, and computerChoice: Menu?) -> String? {
        switch userChoice {
        case .success(let userMenu):
            let winner = decideWinner(user: userMenu, computer: computerChoice)
            return winner
        case .failure(let error):
            print(error.rawValue)
            return nil
        }
    }
    
    private func decideWinner(user: Menu, computer: Menu?) -> String {
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
            startMookZziPpa(winner: winner)
        case WinnerResult.computer:
            print("졌습니다!")
            startMookZziPpa(winner: winner)
        case WinnerResult.noWinner:
            print("비겼습니다!")
            startGame()
        default:
            print("게임종료")
        }
    }
}

extension RockPaperScissors {
    func startMookZziPpa(winner: String) {
        self.selectedRule = .mookZziPpa
        var turn = printTurn(winner)
        isFirst = false
        
        displayMookZziPpa(winner: turn)
        
        let userChoice = readInput(rule: selectedRule)
        let computerChoice = generateRockPaperScissors(rule: selectedRule)
        
        guard let winner = compare(userChoice, and: computerChoice) else {
            changeTurn(turn: &turn)
            
            return startMookZziPpa(winner: turn)
        }
        
        printFinalResult(winner: winner, turn: turn)
    }
    
    private func changeTurn(turn: inout String) {
        if turn == WinnerResult.user {
            turn = WinnerResult.computer
        }
    }
    
    private func printTurn(_ turn: String) -> String {
        if isFirst == false {
            print("\(turn)의 턴입니다.")
        }

        return turn
    }
    
    private func displayMookZziPpa(winner: String) {
        let menuMessage = "[\(winner)턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func printFinalResult(winner: String, turn: String) {
        switch winner {
        case WinnerResult.user:
            startMookZziPpa(winner: winner)
        case WinnerResult.computer:
            startMookZziPpa(winner: winner)
        case WinnerResult.noWinner:
            print("\(turn)의 승리!")
        default:
            print("게임종료")
        }
    }
}
