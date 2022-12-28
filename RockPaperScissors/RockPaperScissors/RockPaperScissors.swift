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
    private enum MookZziPpa: Int, CaseIterable {
        case end
        case rock
        case scissors
        case paper
    }
    
    func calculateTurn(winner: String) -> String {
        if isFirst {
            isFirst = false
        } else {
            print("\(winner)의 턴입니다.")
        }
        displayMookZziPpa(winner: winner)
        return winner
    }
    
    private func displayMookZziPpa(winner: String) {
        let menuMessage = "[\(winner)턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func generateRockPaperScissorsTwo() -> MookZziPpa {
        let result = MookZziPpa.allCases[Int.random(in: 1...3)]
        
        return result
    }
    
    private func readInputTwo() -> Result<MookZziPpa, InputError> {
        guard let input = readLine(),
              let number = Int(input),
              let menu = MookZziPpa(rawValue: number) else {
            return .failure(.invalidInput)
        }
        
        switch menu {
        case .end, .scissors, .rock, .paper:
            return .success(menu)
        }
    }
    
    private func compareTwo(_ userChoice: Result<MookZziPpa, InputError>, and computerChoice: MookZziPpa) -> String? {
        switch userChoice {
        case .success(let userMenu):
            let winner = decideWinnerTwo(user: userMenu, computer: computerChoice)
            return winner
        case .failure(let error):
            print(error.rawValue)
            return nil
        }
    }
    
    private func decideWinnerTwo(user: MookZziPpa, computer: MookZziPpa) -> String {
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
    
    func startMookZziPpa(winner: String) {
        var turn = calculateTurn(winner: winner)
        let userChoice = readInputTwo()
        let computerChoice = generateRockPaperScissorsTwo()
        
        guard let winner = compareTwo(userChoice, and: computerChoice) else {
            if turn == WinnerResult.user {
                turn = WinnerResult.computer
            }
            
            return startMookZziPpa(winner: turn)
        }
        
        printResultTwo(winner: winner, turn: turn)
    }
    
    private func printResultTwo(winner: String, turn: String) {
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
