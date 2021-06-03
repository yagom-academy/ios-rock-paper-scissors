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
    
    private enum Turn: CustomStringConvertible {
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
    }
    
    private var gameTurn: Turn?

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

    private mutating func compare(userHand: Hand, computerHand: Hand) {
        let result = Result.compareHand(userHand, with: computerHand)
        switch result {
        case .draw:
            print(Result.draw)
            if let turn = gameTurn {
                print(turn,"의 승리!", separator: "")
                return
            } else {
                startGame()
            }
            
        case .win:
            print(Result.win)
            if var turn = gameTurn {
                switch turn {
                case .userTurn:
                    turn = .computerTurn
                    
                case .computerTurn:
                    turn = .userTurn
                }
                print("[\(turn)턴]",terminator: "")
                gameTurn = turn
                startGame()
            } else {
                gameTurn = .userTurn
                print("[\(Turn.userTurn)턴]",terminator: "")
                startGame()
            }
            
        case .lose:
            print(Result.lose)
            if var turn = gameTurn {
                switch turn {
                case .userTurn:
                    turn = .computerTurn
                case .computerTurn:
                    turn = .userTurn
                }
                print("[\(turn)턴]",terminator: "")
                gameTurn = turn
                startGame()
            } else {
                gameTurn = .computerTurn
                print("[\(Turn.computerTurn)턴]",terminator: "")
                startGame()
            }
        }
    }

    //묵찌빠 비교 함수 -> 해당 분기로 이동 1. 비기면 승리 출력하고 게임 종료, 2. 이기거나 질 경우 턴 넘기고 양쪽 손모양 생성 -> 묵찌빠 비교

    mutating func startGame() {
        guard let userHand = choiceUserHand() else {
            print("게임 종료")
            return
        }
        compare(userHand: userHand, computerHand: computerHand())
    }
}

var rockScissorsPaper = RockScissorsPaper()
rockScissorsPaper.startGame()
