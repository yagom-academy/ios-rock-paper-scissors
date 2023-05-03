//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Daehoon Lee on 2023/05/01.
//

class RockPaperScissorsGame {
    private var turn: Player = .user
    private var matchResult: Result = .win
    private var selectedGame: Game = .rockPaperScissors
    private var isRunning: Bool = true
    
    func playGame() {
        while isRunning {
            if selectedGame == .rockPaperScissors {
                playRockPaperScissors()
            } else {
                playMukJjiPpa()
            }
        }
    }
    
    private func playRockPaperScissors() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>:", terminator: " ")
        
        guard let user = readLine(), let menu = Menu(rawValue: user) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return
        }
        
        switch menu {
        case .paper, .rock, .scissors:
            let computer: String = generateComputerRandomNumber()
            comparePick(user, computer)
        case .termination:
            isRunning = false
        }
    }
    
    private func playMukJjiPpa() {
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>:", terminator: " ")
        
        guard let user = readLine(), let menu = mukjjippaMenu(rawValue: user) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return
        }
        
        switch menu {
        case .paper, .rock, .scissors:
            let computer: String = generateComputerRandomNumber()
            comparePick(user, computer)
            //matchResult 처리
        case .termination:
            isRunning = false
        }
    }
    
    private func generateComputerRandomNumber() -> String {
        return String(Int.random(in: 1...3))
    }
    
    private func comparePick(_ user: String, _ computer: String) {
        let winningPair: [(user: Menu, computer: Menu)] = [(.rock, .scissors),
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
}
