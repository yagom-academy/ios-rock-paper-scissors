//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

class RockPaperScissorsGame {
    let user: User
    let computer: Computer
    
    init(user: User, computer: Computer) {
        self.user = user
        self.computer = computer
    }
    
    private enum RockPaperScissorsType: Int {
        case rock = 1
        case paper = 2
        case scissor = 3
        case exit = 0
        
        var value: Int {
            switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissor: return 3
            case .exit: return 0
                
            }
        }
    }
    
    private func printUserInterface() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :" , terminator: "")
    }
}
