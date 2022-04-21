//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Derrick kim, ZZBAE on 2022/04/18.
//

import Foundation

protocol Runnable {
    func run()
}

final class RockPaperScissorsGame: Runnable {
    private var order: Player?
    private var userValue: RockPaperScissorsType?
    private var computerValue: RockPaperScissorsType?
    
    func run() {
        let selectionList: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        selectionList.printSelf()
        
        guard let userInputValue = inputValue(),
              let user = RockPaperScissorsType(rawValue: userInputValue) else {
            restartFirstGame(as: "잘못된 입력입니다. 다시 시도해주세요")
            return
        }
        
        switch user {
        case .scissors, .rock, .paper:
            let result = compare(of: createRandomNumber(), and: user)
            judge(result)
        case .none:
            judge()
        }
    }
}

//MARK: RockPaperScissorsGame 클래스 내에서 사용될 함수.
private extension RockPaperScissorsGame {
    func judge(_ result: GameResult = .none) {
        if result == .win
            || result == .lose {
            print(result.value)
            startSecondGame()
        } else if result == .draw {
            restartFirstGame(as: result.value)
        } else {
            print(result.value)
        }
    }
    
    func startSecondGame() {
        var result: Bool = true
        
        while result {
            let selectionList: String = "[\(order?.rawValue ?? "") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
            selectionList.printSelf()
            
            guard let inputValue = inputValue(),
                  let user = RockPaperScissorsType(rawValue: inputValue) else {
                order = .computer
                restartSecondGame(as: "잘못된 입력입니다. 다시 시도해주세요.")
                return
            }
            result = compareSecondGame(of: createRandomNumber(), and: user)
        }
    }

    func inputValue() -> Int? {
        let value: String = readLine()?.replacingOccurrences(of: " ", with: "") ?? "0"
        return value.convertAsInt()
    }
    
    func restartFirstGame(as quote: String) {
        print(quote)
        run()
    }
    
    func restartSecondGame(as quote: String) {
        print(quote)
        startSecondGame()
    }
    
    func createRandomNumber() -> RockPaperScissorsType {
        let computer = RockPaperScissorsType(rawValue: Int.random(in: 1...3))
        return computer ?? .scissors
    }
    
    func compare(of computer: RockPaperScissorsType?, and user: RockPaperScissorsType?) -> GameResult {
        switch (computer, user) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            allocate(order: .computer, user: user, and: computer)
            return .lose
        case (.paper, .scissors), (.rock, .paper), (.scissors, .rock):
            allocate(order: .user, user: user, and: computer)
            return .win
        default:
            return .draw
        }
    }
    
    func allocate(order: Player?, user: RockPaperScissorsType?, and computer: RockPaperScissorsType? ) {
        self.order = order
        self.userValue = user
        self.computerValue = computer
        print("\(order?.rawValue ?? "")의 턴입니다.")
    }
    
    func compareSecondGame(of computer: RockPaperScissorsType?, and user: RockPaperScissorsType?) -> Bool {
        if computer == user {
            print("\(order?.rawValue ?? "" )의 승리!")
            print("게임종료")
            return false
        } else {
            compare(of: computer, and: user)
            return true
        }
    }
}
