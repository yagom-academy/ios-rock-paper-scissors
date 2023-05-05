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
            
            guard let input = readLine(),
                  let index = Int(input),
                  RockPaperScissorsMenu.allCases.indices.contains(index)
            else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            let user: RockPaperScissorsMenu = RockPaperScissorsMenu.allCases[index]
            
            switch user {
            case .paper, .rock, .scissors:
                let computer: RockPaperScissorsMenu = RockPaperScissorsMenu.allCases[generateComputerRandomNumber()]
                compareRockPaperScissors(user, computer)
                printResult()
            case .termination:
                matchResult = .giveUp
            }
        }
        
        return (turn, matchResult)
    }
    
    private func compareRockPaperScissors(_ user: RockPaperScissorsMenu, _ computer: RockPaperScissorsMenu) {
        let winningPair: [(user: RockPaperScissorsMenu, computer: RockPaperScissorsMenu)] = [(.rock, .scissors),
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
        case .draw:
            print("\(matchResult.koreanMessage)")
        default:
            break
        }
    }
}
