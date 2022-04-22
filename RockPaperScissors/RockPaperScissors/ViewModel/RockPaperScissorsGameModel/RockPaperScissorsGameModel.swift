//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Derrick kim, ZZBAE on 2022/04/18.
//

import Foundation

protocol RockPaperScissorsRunnable {
    func start() -> Bool
    func compare(of computer: RockPaperScissors?, and user: RockPaperScissors?) -> GameResult
}

final class RockPaperScissorsGameModel: RockPaperScissorsRunnable {
    private var mukjjiba = Mukjjipa()
}

extension RockPaperScissorsGameModel {
    @discardableResult
    func start() -> Bool {
        let selectionList: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        selectionList.printSelf()
        
        let user = conveyType(from: selectionList.chooseValue() ?? 4)
        
        switch user {
        case .scissors, .rock, .paper:
            let result = compare(of: createComputerValue(), and: user)
            return judge(result)
        case .none:
            return judge()
        }
    }
    
    @discardableResult
    func compare(of computer: RockPaperScissors?, and user: RockPaperScissors?) -> GameResult {
        switch (computer, user) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            mukjjiba = Mukjjipa(order: .computer, userValue: user?.convert(), computerValue: computer?.convert())
            return .lose
        case (.paper, .scissors), (.rock, .paper), (.scissors, .rock):
            mukjjiba = Mukjjipa(order: .user, userValue: user?.convert(), computerValue: computer?.convert())
            return .win
        default:
            return .draw
        }
    }
}

//MARK: RockPaperScissorsGame 클래스 내에서 사용될 함수.
private extension RockPaperScissorsGameModel {
    func conveyType(from value: Int) -> RockPaperScissors {
        guard let user = RockPaperScissors(rawValue: value) else {
            restart(as: "잘못된 입력입니다. 다시 시도해주세요")
            return .none
        }
        return user
    }
    
    func judge(_ result: GameResult = .none) -> Bool {
        if result == .win
            || result == .lose {
            print(result.value)
            return true
        } else if result == .draw {
            restart(as: result.value)
            return false
        } else {
            print(result.value)
            return false
        }
    }
    
    func restart(as quote: String) {
        print(quote)
        start()
    }

    func createComputerValue() -> RockPaperScissors {
        let computer = RockPaperScissors(rawValue: Int.random(in: 1...3)) ?? .none
        return computer
    }
}
