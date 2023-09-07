//
//   MukchippaManager.swift
//  RockPaperScissors
//
//  Created by Charles, Toy on 2023/09/07.
//

struct MukchippaManager {
    
    private func printMenu(turn: String) {
        print("[\(turn)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
    
    func showCurrentTurn(computerCard: RockPaperScissors?, userCard: RockPaperScissors?) -> String {
        if computerCard == .paper && userCard == .rock ||
            computerCard == .rock && userCard == .scissors ||
            computerCard == .scissors && userCard == .paper {
            return "컴퓨터"
        } else {
            return "사용자"
        }
    }
    
    
    
    
}
