//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/16.
//

import Foundation

struct MukjipaGame {
    private enum MukjipaType: Int {
        case muk = 1
        case ji = 2
        case pa = 3
        case exit = 0
    }
    
    private var currentTurn: Player = .none
    private let user: User
    private let computer: Computer
    private let userInterface: UserInterface
    
    init(user: User, computer: Computer, userInterface: UserInterface) {
        self.user = user
        self.computer = computer
        self.userInterface = userInterface
    }
    
    mutating func startMujipaGame(currentTurn: Player) {
        self.currentTurn = currentTurn
        userInterface.printMukjipaGameUserInterface(currentTurn: currentTurn)
    }
}
