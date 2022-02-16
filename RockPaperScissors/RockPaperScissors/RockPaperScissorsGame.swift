//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

struct RockPaperScissorsGame {
    private enum RockPaperScissorsType: Int {
        case scissor = 1
        case rock = 2
        case paper = 3
        case exit = 0
    }
    
    private let user: User
    private let computer: Computer
    private let userInterface: UserInterface
    
    init(user: User, computer: Computer, userInterface: UserInterface) {
        self.user = user
        self.computer = computer
        self.userInterface = userInterface
    }
    
    func startProgram() {
        userInterface.printRockPaperScissorsGameUserInterface()
        playSelectedMenu()
    }
    
    private func playSelectedMenu() {
        let userSelectedMenu: Int = user.selectedMenu()
        let rock: Int = RockPaperScissorsType.rock.rawValue
        let paper: Int = RockPaperScissorsType.paper.rawValue
        let scissor: Int = RockPaperScissorsType.scissor.rawValue
        
        switch userSelectedMenu {
        case scissor, rock, paper:
            judgeGameResult(userSelectedNumber: userSelectedMenu)
            
        case RockPaperScissorsType.exit.rawValue:
            userInterface.printGameOver()
            
        default:
            userInterface.printErrorMessage()
            startProgram()
        }
    }
    
    private func judgeGameResult(userSelectedNumber: Int) {
        let computerSelectedNumber: Int = computer.generatedComputerNumber(numberRange: GameOption.computerNumberRange)
        
        var mukjipaGame = MukjipaGame(
            user: self.user,
            computer: self.computer,
            userInterface: self.userInterface
        )
        
        if userSelectedNumber == computerSelectedNumber {
            userInterface.printRockPaperScissorsGameResut(gameResult: .draw)
            startProgram()
        }
        
        if userSelectedNumber == computerSelectedNumber + 1 || userSelectedNumber == computerSelectedNumber - 2 {
            userInterface.printRockPaperScissorsGameResut(gameResult: .win)
            mukjipaGame.startMukjipaGame(currentTurn: .user)
        }
        
        if userSelectedNumber == computerSelectedNumber - 1 || userSelectedNumber == computerSelectedNumber + 2 {
            userInterface.printRockPaperScissorsGameResut(gameResult: .lose)
            mukjipaGame.startMukjipaGame(currentTurn: .computer)
        }
    }
}
