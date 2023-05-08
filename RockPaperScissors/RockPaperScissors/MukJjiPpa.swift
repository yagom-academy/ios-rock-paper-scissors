//
//  File.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/04.
//

final class MukJjiPpa: HandShapeGamePreparation {
    private var computer: HandShape?
    private var gameResult: GameResult
    private var turn: Turn
    
    init(from rockPaperScissorsResult: GameResult) {
        self.gameResult = rockPaperScissorsResult
        
        if case let .next(turn) = self.gameResult {
            self.turn = turn
        } else {
            self.turn = .none
        }
    }
    
    func start() {
        while gameResult != .end {
            printMenu(text: "[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
            self.computer = generateComputerHandShape()
            let menu = getMenuFromUser()
            executeMenu(by: menu)
        }
    }
    
    private func executeMenu(by menuNumber: Int?) {
        switch menuNumber {
        case 0:
            print("게임 종료")
            self.gameResult = .end
        case 1, 2, 3:
            if let user = convertHandShape(from: menuNumber) {
                self.gameResult = judgeGame(user, with: computer)
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            self.turn = .computer
            self.gameResult = .again
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
