//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

fileprivate enum Message {
    static let end = "게임 종료"
    static let invaild = "잘못된 입력입니다. 다시 시도해주세요."
}

fileprivate enum GameError: Error, CustomStringConvertible {
    case emptyCollection
    
    var description: String {
        switch self {
        case .emptyCollection:
            return "열거형이 비어있어요"
        }
    }
}

class RockScissorsPaper {
    fileprivate lazy var userInputArray: [Int] = [0, 1, 2, 3]
    fileprivate lazy var gameTurn = Turn.userTurn
    
    fileprivate enum Hand : Int, CaseIterable {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    fileprivate enum Result: CustomStringConvertible {
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
    
    fileprivate enum Turn: CustomStringConvertible {
        case userTurn
        case computerTurn
        
        var description: String {
            switch self {
            case .userTurn:
                return "사용자"
            case .computerTurn:
                return "컴퓨터"
            }
        }
        
        static func convert(_ turn: Turn) -> Turn {
            if turn == .userTurn {
                return .computerTurn
            } else {
                return .userTurn
            }
        }
    }
    
    fileprivate func choiceUserHand() -> Hand? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let userInput = (readLine().flatMap{ Int($0) }), userInputArray.contains(userInput) else {
            print(Message.invaild)
            return choiceUserHand()
        }
        
        return Hand(rawValue: userInput)
    }
    
    fileprivate func generateComputerHand() throws -> Hand {
        guard let randomHand = Hand.allCases.randomElement() else {
            throw GameError.emptyCollection
        }
        
        return randomHand
    }
    
    fileprivate func compare(userHand: Hand, computerHand: Hand) -> Result {
            let result = Result.compareHand(userHand, with: computerHand)
            return result
        }
}

