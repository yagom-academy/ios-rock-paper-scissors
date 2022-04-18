//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by NAMU on 2022/04/18.
//

import Foundation

struct RockPaperScissorsGame {
    var inputNumber: Int?
    
    func printMenu() {
        print(GameMessage.menuMessage.rawValue)
    }
    
    mutating func inputUserSelect() {
        inputNumber = Int(readLine() ?? "") ?? 4
    }
}
