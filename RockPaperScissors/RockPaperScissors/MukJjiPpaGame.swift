//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by Yena on 2023/05/03.
//

class MukJjiPpaGame {
    private var turn: Player
    private var matchResult: Result
    private var selectedGame: Game
    
    init(turn: Player, matchResult: Result, selectedGame: Game) {
        self.turn = turn
        self.matchResult = matchResult
        self.selectedGame = selectedGame
    }
    
    func playMukJjiPpa(_ time: Player) -> (Player, Game) {
        turn = time
        
        print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>:", terminator: " ")
        
        guard let user = readLine(), let menu = MukJjiPpaMenu(rawValue: user) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return (.computer, .mukJjiPpa)
        }
        
        switch menu {
        case .paper, .rock, .scissors:
            let computer: String = generateComputerRandomNumber()
            compareMukJjiPpa(user, computer)
            return (turn, printResult())
        case .termination:
            return (turn, .termination)
        }
    }
    
    private func generateComputerRandomNumber() -> String {
        return "1"
        //return String(Int.random(in: 1...3))
    }
    
    private func compareMukJjiPpa(_ user: String, _ computer: String) {
        print(MukJjiPpaMenu(rawValue: user)!, MukJjiPpaMenu(rawValue: computer)!)
        let winningPair: [(user: MukJjiPpaMenu, computer: MukJjiPpaMenu)] = [(.rock, .scissors),
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
    
    private func printResult() -> Game {
        switch matchResult {
        case .win, .lose:
            print("\(turn.rawValue)의 턴입니다.")
            return .mukJjiPpa
        case .draw:
            print("\(turn.rawValue)의 승리!")
            return .termination
        }
    }
}
