//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

final class RockPaperScissorsGame {
    private enum RockPaperScissorsType: Int {
        case scissor = 1
        case rock = 2
        case paper = 3
        case exit = 0
    }
    
    private enum GameResult: String {
        case draw = "비겼습니다!"
        case win = "이겼습니다!"
        case lose = "졌습니다!"
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
        let rock: Int = RockPaperScissorsType.rock.rawValue
        let paper: Int = RockPaperScissorsType.paper.rawValue
        let scissor: Int = RockPaperScissorsType.scissor.rawValue
        
        switch userSelectedMenu {
        case scissor, rock, paper:
            judgeGameResult(userSelectedNumber: userSelectedMenu)
            
        case RockPaperScissorsType.exit.rawValue:
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
            printGameOver()
        }
        
        if userSelectedNumber == computerSelectedNumber - 1 || userSelectedNumber == computerSelectedNumber + 2 {
            printGameResut(gameResult: .lose)
            printGameOver()
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
        print(gameResult.rawValue)
    }
}
