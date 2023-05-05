//
//  HandShape.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/03.
//

final class RockPaperScissors: HandShapeGamePreparation {    
    private var computer: HandShape?    
    private var gameResult: GameResult = .again
    
    func start() -> GameResult {
        while self.gameResult == .again {
            printMenu(text: "가위(1), 바위(2), 보(3)! <종료 : 0> :")
            self.computer = generateComputerHandShape()
            let menu = getMenuFromUser()
            self.gameResult = executeMenu(by: menu)
        }
        return self.gameResult
    }
    
    private func executeMenu(by menuNumber: Int?) -> GameResult {
        switch menuNumber {
        case 0:
            print("게임 종료")
            return .end
        case 1, 2, 3:
            guard let user = convertHandShape(from: menuNumber) else { return .again }
            return judgeGame(user, with: self.computer)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return .again
        }
    }
     
    private func judgeGame(_ user: HandShape?, with computer: HandShape?) -> GameResult {
        switch (user, computer) {
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
            print("비겼습니다!")
            return .again
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            print("이겼습니다!")
            return .next(.user)
        default:
            print("졌습니다!")
            return .next(.computer)
        }
    }
}
