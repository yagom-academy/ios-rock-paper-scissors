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
    case end, again, next
}

class ScissorsRockPaper {    
    private var computer: HandShape?
    private var user: HandShape?
    var srpResult: GameResult?
    
    func startSRP() {
        while self.srpResult == .again {
            printMenu()
            self.computer = generateComputerHandShape()
            let menu = getMenuFromUser()
            executeMenu(by: menu)
        }
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    func generateComputerHandShape() -> HandShape? {
        return HandShape(rawValue: Int.random(in: 1...3))
    }
    
    func getMenuFromUser() -> Int? {
        guard let menu = readLine(), let menuNumber = Int(menu) else {
            return nil
        }
        return menuNumber
    }
    
    private func executeMenu(by menuNumber: Int?) {
        switch menuNumber {
        case 0:
            print("게임 종료")
            self.srpResult = .end
        case 1, 2, 3:
            if let user = convertHandShape(from: menuNumber) {
                self.srpResult = judgeGameSRP(user, with: self.computer)
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    func convertHandShape(from shapeNumber: Int?) -> HandShape? {
        guard let shapeNumber = shapeNumber else { return nil }
        return HandShape(rawValue: shapeNumber)
    }
    
    func judgeGameSRP(_ user: HandShape?, with computer: HandShape?) -> GameResult {
        switch (user, computer) {
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
            print("비겼습니다!")
            return .again
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            print("이겼습니다!")
            return .next
        default:
            print("졌습니다!")
            return .next
        }
    }
}
