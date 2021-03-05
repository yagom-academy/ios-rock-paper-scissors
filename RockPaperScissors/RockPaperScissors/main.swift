//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum RockPaperScissorsHand: Int {
    case exit, scissors, rock, paper
}

enum MukChiPaHand: Int {
    case exit, muk, chi, pa
}

enum GameResult: String {
    case win = "사용자의 승리!"
    case lose = "컴퓨터의 승리!"
    case draw = "비겼습니다!"
    case exit = "게임 종료"
    case error = "잘못된 입력입니다. 다시 입력해주세요."
}

enum TurnStatus: String {
    case userTurn = "사용자"
    case computerturn = "컴퓨터"
}

class RockPaperScissors {
    var userHand = 0
    var computerHand = 0
    var turnSwitch = TurnStatus.userTurn
    
    func choiceRandomComputerHand() -> Int {
        let createNumber = Int.random(in: 1...3)
        return createNumber
    }
    
    func choiceUserHand() -> Int {
        guard let userText = readLine(), let userNumber = Int(userText) else {
            return 4 // 옵셔널 해제 실패시 반환할 값
        }
        return userNumber
    }
    
    private func checkRockPaperScissorsResult(userNumber: Int, computerNumber: Int) -> GameResult {
        var result = GameResult.draw
        let userHand = RockPaperScissorsHand(rawValue: userNumber)
        let computerHand = RockPaperScissorsHand(rawValue: computerNumber)
        
        if userHand == .exit {
            result = .exit
        } else if userHand == computerHand {
            result = .draw
        } else {
            switch (userHand, computerHand) {
            case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
                result = .win
                turnSwitch = .userTurn
            case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
                result = .lose
                turnSwitch = .computerturn
            default:
                result = .error
            }
        }
        return result
    }
    
    private func checkMukChiPaResult(userNumber: Int, computerNumber: Int) -> GameResult {
        var result = GameResult.draw
        let userHand = MukChiPaHand(rawValue: userNumber)
        let computerHand = MukChiPaHand(rawValue: computerNumber)
        
        if userHand == .exit {
            result = .exit
        } else if userHand == computerHand {
            switch turnSwitch {
            case .userTurn:
                result = .win
            case .computerturn:
                result = .lose
            }
        } else {
            switch (userHand, computerHand) {
            case (.muk, .chi), (.chi, .pa), (.pa, .muk):
                turnSwitch = .userTurn
            case (.muk, .pa), (.chi, .muk), (.pa, .chi):
                turnSwitch = .computerturn
            default:
                turnSwitch = .computerturn
            }
        }
    return result
}
    
    // 승패결과 출력 메서드 분리
    func playGame() {
        outer: while true {
            computerHand = choiceRandomComputerHand()
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : \(computerHand)", terminator: " ")
            userHand = choiceUserHand()
            
            let result = checkRockPaperScissorsResult(userNumber: userHand, computerNumber: computerHand)
            print(result.rawValue)
            
            switch result {
            case .draw, .error:
                continue
            case .exit:
                return
            default:
                inner: while true {
                    computerHand = choiceRandomComputerHand()
                    print("[\(turnSwitch.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : \(computerHand)", terminator: " ")
                    userHand = choiceUserHand()
                    
                    let result = checkMukChiPaResult(userNumber: userHand, computerNumber: computerHand)
                    
                    switch result {
                    case .win, .lose, .exit:
                        print(result.rawValue)
                        return
                    default:
                        print("[\(turnSwitch.rawValue)의 턴입니다.]")
                        continue inner
                    }
                }
            }
        }
    }
}

let testGame = RockPaperScissors()
testGame.playGame()
