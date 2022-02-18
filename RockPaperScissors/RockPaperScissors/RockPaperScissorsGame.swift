//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

struct RockPaperScissorsGame {
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
        let userHand: RockPaperScissorsType = user
            .selectedMenu()
            .convertedIntToRockPaperScissorsType()

        let rock: RockPaperScissorsType = RockPaperScissorsType.rock
        let paper: RockPaperScissorsType = RockPaperScissorsType.paper
        let scissor: RockPaperScissorsType = RockPaperScissorsType.scissor
        let exit: RockPaperScissorsType = RockPaperScissorsType.exit
        
        switch userHand {
        case scissor, rock, paper:
            judgeGameResult(userHand: userHand)
        case exit:
            userInterface.printGameOver()
        default:
            userInterface.printErrorMessage()
            startProgram()
        }
    }
    
    private func judgeGameResult(userHand: RockPaperScissorsType) {
        let computerHand: RockPaperScissorsType = computer
            .generatedComputerNumber()
            .convertedIntToRockPaperScissorsType()
                
        var mukjipaGame = MukjipaGame(
            user: self.user,
            computer: self.computer,
            userInterface: self.userInterface
        )
        
        switch (userHand, computerHand) {
        case (.rock, .rock), (.scissor, .scissor), (.paper, .paper):
            userInterface.printRockPaperScissorsGameResut(gameResult: .draw)
            startProgram()
        case (.rock, .scissor), (.scissor, .paper), (.paper, .rock):
            userInterface.printRockPaperScissorsGameResut(gameResult: .win)
            mukjipaGame.startMukjipaGame(currentTurn: .user)
        case (.rock, .paper), (.scissor, .rock), (.paper, .scissor):
            userInterface.printRockPaperScissorsGameResut(gameResult: .lose)
            mukjipaGame.startMukjipaGame(currentTurn: .computer)
        default:
            break
        }
    }
}

fileprivate extension Int {
    func convertedIntToRockPaperScissorsType() -> RockPaperScissorsType {
        switch self {
        case RockPaperScissorsType.scissor.rawValue:
            return .scissor
        case RockPaperScissorsType.rock.rawValue:
            return .rock
        case RockPaperScissorsType.paper.rawValue:
            return .paper
        case RockPaperScissorsType.exit.rawValue:
            return .exit
        default:
            return .error
        }
    }
}

