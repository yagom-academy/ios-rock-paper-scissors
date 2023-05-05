//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by 민다훈 on 2023/05/03.
//

class MukJjiPpaGame: GameBase {
    func playMukJjiPpa() -> (winner: Player, status: Result) {
        while matchResult != .draw && matchResult != .giveUp {            
            print("[\(turn.koreanMessage) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>:", terminator: " ")
            
            guard let input = readLine(),
                  let index = Int(input),
                  MukJjiPpaMenu.allCases.indices.contains(index)
            else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                turn = .computer
                continue
            }
            
            let user: MukJjiPpaMenu = MukJjiPpaMenu.allCases[index]
            
            switch user {
            case .paper, .rock, .scissors:
                let computer: MukJjiPpaMenu = MukJjiPpaMenu.allCases[generateComputerRandomNumber()]
                compareMukJjiPpa(user, computer)
                printResult()
            case .termination:
                matchResult = .giveUp
            }
        }
        
        return (turn, matchResult)
    }
    
    private func compareMukJjiPpa(_ user: MukJjiPpaMenu, _ computer: MukJjiPpaMenu) {
        let winningPair: [(user: MukJjiPpaMenu, computer: MukJjiPpaMenu)] = [(.rock, .scissors),
                                                                             (.scissors, .paper),
                                                                             (.paper, .rock)]
        
        if winningPair.contains(where: { $0.user == user && $0.computer == computer }) {
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
            print("\(turn.koreanMessage)의 턴입니다.")
        default:
            break
        }
    }
}
