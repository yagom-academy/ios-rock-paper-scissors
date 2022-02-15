//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

final class RockPaperScissorsGame {
    private enum RockPaperScissorsType: Int {
        case scissor
        case rock
        case paper
        case exit
        
        var value: Int {
            switch self {
            case .scissor: return 1
            case .rock: return 2
            case .paper: return 3
            case .exit: return 0
                
            }
        }
    }
    
    private enum GameResult: String {
        case draw
        case win
        case lose
        
        var value: String {
            switch self {
            case .draw: return "비겼습니다!"
            case .win: return "이겼습니다!"
            case .lose: return "졌습니다!"
            }
        }
    }
    
    private let user: User
    private let computer: Computer
    
    init(user: User, computer: Computer) {
        self.user = user
        self.computer = computer
    }
    
    func startProgram() {
        printUserInterface()
        playSelectedMenu()
    }
    
    private func playSelectedMenu() {
        let userSelectedMenu: Int = user.selectedMenu()
        let rock: Int = RockPaperScissorsType.rock.value
        let paper: Int = RockPaperScissorsType.paper.value
        let scissor: Int = RockPaperScissorsType.scissor.value
        
        switch userSelectedMenu {
        case scissor, rock, paper:
            judgeGameResult(userSelectedNumber: userSelectedMenu)
            
        case RockPaperScissorsType.exit.value:
            printGameOver()
            
        default:
            printErrorMessage()
            startProgram()
        }
    }
    
    private func judgeGameResult(userSelectedNumber: Int) {
        let computerSelectedNumber: Int = computer.generatedComputerNumber(numberRange: GameOption.computerNumberRange)
        
        if userSelectedNumber == computerSelectedNumber {
            printGameResut(gameResult: .draw)
            startProgram()
        }
        
        if userSelectedNumber == computerSelectedNumber + 1 || userSelectedNumber == computerSelectedNumber - 2 {
            printGameResut(gameResult: .win)
        }
        
        if userSelectedNumber == computerSelectedNumber - 1 || userSelectedNumber == computerSelectedNumber + 2 {
            printGameResut(gameResult: .lose)
        }
    }
    
    private func printUserInterface() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :" , terminator: " ")
    }
    
    private func printGameOver() {
        print("게임 종료")
    }
    
    private func printErrorMessage() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    private func printGameResut(gameResult: GameResult) {
        print(gameResult.value)
    }
}
