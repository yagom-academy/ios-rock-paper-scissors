//
//  File.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/04.
//

enum Turn: String {
    case user = "사용자", computer = "컴퓨터"
}

final class MukJjiPpa: HandShapeGamePreparation {
    var turn: Turn
    var computer: HandShape?
    var user: HandShape?
    var gameResult: GameResult?
    
    init(turn: Turn) {
        self.turn = turn
    }
    
    func start() {
        
    }
    
    private func executeMenuMJP(by menuNumber: Int?) {
        switch menuNumber {
        case 0:
            print("게임 종료")
        case 1, 2, 3:
            if let user = convertHandShape(from: menuNumber) {
                self.gameResult = judgeGame(user, with: computer)
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    private func judgeGame(_ user: HandShape?, with computer: HandShape?) -> GameResult {
        switch (user, computer) {
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
            print("\(turn.rawValue)의 승리!")
            return .end
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            self.turn = .user
            print("\(turn.rawValue)의 턴입니다.")
            return .again
        default:
            self.turn = .computer
            print("\(turn.rawValue)의 턴입니다.")
            return .again
        }
    }
}
