//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Daehoon Lee on 2023/05/01.
//

class RockPaperScissorsGame {
    private var turn: Player
    private var matchResult: Result
    private var selectedGame: Game
    
    init(turn: Player, matchResult: Result, selectedGame: Game) {
        self.turn = turn
        self.matchResult = matchResult
        self.selectedGame = selectedGame
    }
    
    func playRockPaperScissors() -> (Player, Game) {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>:", terminator: " ")
        
        guard let user = readLine(), let menu = RockPaperScissorsMenu(rawValue: user) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return (.user, .rockPaperScissors)
        }
        
        switch menu {
        case .paper, .rock, .scissors:
            let computer: String = generateComputerRandomNumber()
            compareRockPaperScissors(user, computer)
            printResult()
        case .termination:
            return (.user, .termination)
        }
        
        return (turn, selectedGame)
    }
    
    private func generateComputerRandomNumber() -> String {
        return String(Int.random(in: 1...3))
    }
    
    private func compareRockPaperScissors(_ user: String, _ computer: String) {
        let winningPair: [(user: RockPaperScissorsMenu, computer: RockPaperScissorsMenu)] = [(.rock, .scissors),
                                                           (.scissors, .paper),
                                                           (.paper, .rock)]
        
        if winningPair.contains(where: { $0.user.rawValue == user && $0.computer.rawValue == computer }) {
            matchResult = .win
            turn = .user
        } else if user == computer {
            matchResult = .draw
        } else {
            matchResult = .lose
            turn = .computer
        }
    }
    
    private func printResult() {
        switch matchResult {
        case .win, .lose:
            print("\(matchResult.rawValue)")
            selectedGame = .mukJjiPpa
        case .draw :
            print("\(matchResult.rawValue)")
        }
    }

}
