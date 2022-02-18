//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/16.
//

import Foundation

struct MukjipaGame {    
    private var currentTurn: Player = .user
    private let user: User
    private let computer: Computer
    private let userInterface: UserInterface
    
    init(user: User, computer: Computer, userInterface: UserInterface) {
        self.user = user
        self.computer = computer
        self.userInterface = userInterface
    }
    
    mutating func startMukjipaGame(currentTurn: Player) {
        self.currentTurn = currentTurn
        userInterface.printMukjipaGameUserInterface(currentTurn: currentTurn)
        playSelectedMenu()
    }
    
    private mutating func playSelectedMenu() {
        let userHand: MukjipaType = user
            .selectedMenu()
            .convertedIntToMukjipaType()
        
        let muk: MukjipaType = MukjipaType.muk
        let ji: MukjipaType = MukjipaType.ji
        let pa: MukjipaType = MukjipaType.pa
        let exit: MukjipaType = MukjipaType.exit
        
        switch userHand {
        case muk, ji, pa:
            judgeGameResult(userHand: userHand)
        case exit:
            userInterface.printGameOver()
        default:
            userInterface.printErrorMessage()
            currentTurn = .computer
            startMukjipaGame(currentTurn: self.currentTurn)
        }
    }
    
    private mutating func judgeGameResult(userHand: MukjipaType) {
        let computerHand: MukjipaType = computer
            .generatedComputerNumber()
            .convertedIntToMukjipaType()
                
        guard userHand == computerHand else {
            changeCurrentTurn()
            startMukjipaGame(currentTurn: self.currentTurn)
            return
        }
        
        userInterface.printMukjipaGameWinner(currentTurn: self.currentTurn)
    }
    
    private mutating func changeCurrentTurn() {
        switch currentTurn {
        case .user:
            currentTurn = .computer
            userInterface.printCurrentTurn(currentTurn: .computer)
        case .computer:
            currentTurn = .user
            userInterface.printCurrentTurn(currentTurn: .user)
        }
    }
}

fileprivate extension Int {
    func convertedIntToMukjipaType() -> MukjipaType {
        switch self {
        case MukjipaType.muk.rawValue:
            return .muk
        case MukjipaType.ji.rawValue:
            return .ji
        case MukjipaType.pa.rawValue:
            return .pa
        case MukjipaType.exit.rawValue:
            return .exit
        default:
            return .error
        }
    }
}
