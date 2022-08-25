//
//  Turn.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

enum Turn {
    case user
    case computer
    
    func displayTurn() {
        switch self {
        case .user:
            print("[사용자 턴]", terminator: " ")
        case .computer:
            print("[컴퓨터 턴]", terminator: " ")
        }
    }
}
