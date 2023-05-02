//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Daehoon Lee on 2023/05/01.
//

struct RockPaperScissorsGame {
    func startGame() {
        var isRunning: Bool = true
        
        while isRunning {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>:", terminator: " ")
            
            guard let user = readLine(), let menu = Menu(rawValue: user) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            switch menu {
            case .paper, .rock, .scissors:
                let computer: String = generateComputerRandomNumber()
                comparePick(user, computer)
            case .termination:
                isRunning = false
            }
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
            print("이겼습니다!")
        } else if user == computer {
            print("비겼습니다!")
        } else {
            print("졌습니다!")
        }
    }
}
