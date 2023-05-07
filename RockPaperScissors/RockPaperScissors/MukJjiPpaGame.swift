//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by 민다훈 on 2023/05/03.
//

class MukJjiPpaGame: Gameable {
    var turn: Player
    var matchResult: Result

    init(turn: Player, matchResult: Result) {
        self.turn = turn
        self.matchResult = matchResult
    }

    func startMukJjiPpa() {
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
            
            playGame(user: index)
            printResult()
        }
    }
    
    func playGame(user index: Int) {
        let user: MukJjiPpaMenu = MukJjiPpaMenu.allCases[index]
        
        switch user {
        case .ppa, .muk, .jji:
            let computer: MukJjiPpaMenu = MukJjiPpaMenu.allCases[generateComputerRandomNumber()]
            compareMukJjiPpa(user, computer)
        case .termination:
            matchResult = .giveUp
        }
    }
    
    private func compareMukJjiPpa(_ user: MukJjiPpaMenu, _ computer: MukJjiPpaMenu) {
        let winningPair: [(user: MukJjiPpaMenu, computer: MukJjiPpaMenu)] = [(.muk, .jji),
                                                                             (.jji, .ppa),
                                                                             (.ppa, .muk)]
        
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
    
    func printResult() {
        switch matchResult {
        case .win, .lose:
            print("\(turn.koreanMessage)의 턴입니다.")
        case .draw:
            print("\(turn.koreanMessage)의 승리!")
        case .giveUp:
            print("게임 종료")
        }
    }
}
