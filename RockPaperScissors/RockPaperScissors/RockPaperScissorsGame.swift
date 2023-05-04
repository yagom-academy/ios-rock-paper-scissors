//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 민다훈 on 2023/05/01.
//

class RockPaperScissorsGame: GameBase {
    func playRockPaperScissors() -> (Player, Result) {
        while matchResult == .draw {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>:", terminator: " ")
            
            guard let user = readLine(), let menu = RockPaperScissorsMenu(rawValue: user) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            switch menu {
            case .paper, .rock, .scissors:
                let computer: String = generateComputerRandomNumber()
                compareRockPaperScissors(user, computer)
                printResult()
            case .termination:
                matchResult = .giveUp
            }
        }
        
        return (turn, matchResult)
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
        case .draw:
            print("\(matchResult.rawValue)")
        default:
            break
        }
    }
}
