//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct RockScissorsPaper {
    private enum Hand : Int, CaseIterable {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    private enum Result: CustomStringConvertible {
        case win
        case draw
        case lose
        
        var description: String {
            switch self {
            case .win:
                return "이겼습니다!"
            case .draw:
                return "비겼습니다!"
            case .lose:
                return "졌습니다!"
            }
        }
        
        static func compareHand(_ user: Hand, with computer: Hand) -> Result {
            switch (user, computer) {
            case let (x, y) where x == y:
                return .draw
            case (.scissors, let x):
                return x == .rock ? .lose : .win
            case (.rock, let x):
                return x == .paper ? .lose : .win
            case (.paper, let x):
                return x == .scissors ? .lose : .win
            }
        }
    }
    
    private func choiceUserHand() -> Hand? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        let userInputArray: Array<Int> = [0, 1, 2, 3]
        guard let userInput = (readLine().flatMap{ Int($0) }), userInputArray.contains(userInput) else {
            print("잘못된 입력입니다. 다시 입력해주세요")
            return choiceUserHand()
        }

        return Hand(rawValue: userInput)
    }

    private func computerHand() -> Hand {
        if let randomHand = Hand.allCases.randomElement() {
            return randomHand
        } else {
            return computerHand()
        }
    }

    private func compare(userHand: Hand, computerHand: Hand) {
        let result = Result.compareHand(userHand, with: computerHand)
        switch result {
        case .draw:
            print(Result.draw)
        case .win:
            print(Result.win)
        case .lose:
            print(Result.lose)
        }
    }

    func startGame() {
        guard let userHand = choiceUserHand() else {
            print("게임 종료")
            return
        }
        compare(userHand: userHand, computerHand: computerHand())
    }
}

var rockScissorsPaper = RockScissorsPaper()
rockScissorsPaper.startGame()

