//
//  File.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/04.
//

enum Turn: String {
    case user = "사용자", computer = "컴퓨터"
}

final class MukJjiPpa {
    var turn: Turn
    var computer: HandShape?
    var user: HandShape?
    
    init(turn: Turn) {
        self.turn = turn
    }
    
    func start() {
        printMenu()
        self.computer = generateComputerHandShape()
        
        let menu = getMenuFromUser()
        executeMenu(by: menu)
    }
    
    func printMenu() {
        print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
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
        case 1, 2, 3:
            if let user = convertHandShape(from: menuNumber) {
                judgeGame(user, with: computer)
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
            print("\(turn.rawValue)의 승리!")
            return .end
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            self.turn = .user
            print("\(turn.rawValue)의 턴입니다.")
            return .end
        default:
            self.turn = .computer
            print("\(turn.rawValue)의 턴입니다.")
            return .end
        }
    }
    
}
