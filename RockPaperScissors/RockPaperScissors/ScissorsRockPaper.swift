//
//  HandShape.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/03.
//

enum HandShape: Int {
    case scissors = 1, rock, paper
}

enum GameResult {
    case end, again
}

final class ScissorsRockPaper {
    
    private var computer: HandShape?
    private var user: HandShape?
    private var gameResult: GameResult?
    
    func start() {
        while self.gameResult != .end {
            printMenu()
            self.computer = generateComputerHandShape()
            let menu = getMenuFromUser()
            executeMenu(by: menu)
        }
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    private func generateComputerHandShape() -> HandShape? {
        return HandShape(rawValue: Int.random(in: 1...3))
    }
    
    private func getMenuFromUser() -> Int? {
        guard let menu = readLine(), let menuNumber = Int(menu) else {
            return nil
        }
        return menuNumber
    }
    
    private func executeMenu(by menuNumber: Int?) {
        switch menuNumber {
        case 0:
            print("게임 종료")
            self.gameResult = .end
        case 1, 2, 3:
            if let user = convertHandShape(from: menuNumber) {
                self.gameResult = judgeGame(user, with: self.computer)
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    private func convertHandShape(from shapeNumber: Int?) -> HandShape? {
        guard let shapeNumber = shapeNumber else { return nil }
        return HandShape(rawValue: shapeNumber)
    }
    
    private func judgeGame(_ user: HandShape?, with computer: HandShape?) -> GameResult {
        switch (user, computer) {
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
            print("비겼습니다!")
            return .again
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            print("이겼습니다!")
            return .end
        default:
            print("졌습니다!")
            return .end
        }
    }
}
