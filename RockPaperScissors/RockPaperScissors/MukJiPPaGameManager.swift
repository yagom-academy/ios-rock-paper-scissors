//
//  MukJiPPaGameManager.swift
//  RockPaperScissors
//
//  Created by Harry, Andrew on 2022/12/28.
//

import Foundation

class MukJiPPaGameManager: RockScissorsPaperGameManager {
    init() {
        super.init(gameType: .mukJiPPa)
    }
    
    override func printMenu() {
        print("[ 턴]묵(1), 찌(2), 빠(3)! <종료: 0>", terminator: ": ")
    }
    
    func turn(matchResult: MatchResult?) {
        guard let matchResult = matchResult else {
            return
        }
        
        switch matchResult {
        case .win:
            print("사용자 턴")
        case .lose:
            print("컴퓨터 턴")
        case .same:
            print("게임 끝")
        }
        
    }
    
    func changeTurn() {
        var whosTurn: String = "사용자"
        if whosTurn == "사용자" {
            whosTurn = "컴퓨터"
        } else {
            whosTurn = "사용자"
        }
    }
    
    func playMukJiPPa() {
        printMenu()
    }
    
    
}
