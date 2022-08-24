//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

import Foundation

enum GameOver: String {
    case exit = "게임 종료"
    case userWin = "사용자의 승리!"
    case computerWin = "컴퓨터의 승리!"
}

enum WinLoseDraw: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

enum UserSelect {
    case exit
    case play
    case error
}

class RockPaperScissors {
    let startText: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    let cautionText: String = "잘못된 입력입니다. 다시 시도해주세요."
    
    func startGame() {
        print(startText, terminator: "")
        guard let inputedUserNumber: Int = Int(bindUserInput()) else {
            print(cautionText)
            startGame()
            return
        }
        playRockPaperScissors(inputedUserNumber)
    }
    
    fileprivate func bindUserInput() -> String {
        guard let userInput = readLine() else {
            return bindUserInput()
        }
        return userInput
    }
    
    fileprivate func playRockPaperScissors(_ userNumber: Int) {
        switch selectOption(userNumber) {
        case .exit:
            print(GameOver.exit.rawValue)
        case .play:
            compareNumbers(makeComputerNumber(), userNumber)
        default:
            print(cautionText)
            startGame()
        }
    }
    
    fileprivate func selectOption(_ userNumber: Int) -> UserSelect {
        switch userNumber {
        case 0:
            return .exit
        case 1, 2, 3:
            return .play
        default:
            return .error
        }
    }
    
    fileprivate func makeComputerNumber() -> Int {
        let computerNumber: Int = Int.random(in: 1...3)
        return computerNumber
    }
    
    fileprivate func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int) {
        let differenceNumber: WinLoseDraw = makeResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            print(WinLoseDraw.win.rawValue)
        case .lose:
            print(WinLoseDraw.lose.rawValue)
        default:
            print(WinLoseDraw.draw.rawValue)
            startGame()
        }
    }
    
    fileprivate func makeResult(_ differenceNumber: Int) -> WinLoseDraw {
        switch differenceNumber {
        case -2, 1:
            return .win
        case -1, 2:
            return .lose
        default:
            return .draw
        }
    }
    
}

class MukChiba: RockPaperScissors {
    override fileprivate func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int) {
        let differenceNumber: WinLoseDraw = makeResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            print(WinLoseDraw.win.rawValue)
            startMukChiba(attackTurn: true)
        case .lose:
            print(WinLoseDraw.lose.rawValue)
            startMukChiba(attackTurn: false)
        default:
            print(WinLoseDraw.draw.rawValue)
            startGame()
        }
    }
    
    fileprivate func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int, _ turn: Bool) {
        let differenceNumber: WinLoseDraw = makeResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            startMukChiba(attackTurn: true)
        case .lose:
            startMukChiba(attackTurn: false)
        default:
            if turn == true {
                print(GameOver.userWin.rawValue)
            } else {
                print(GameOver.computerWin.rawValue)
            }
        }
    }
    
    fileprivate func startMukChiba(attackTurn: Bool) {
        let turn: String
        if attackTurn == true {
            turn = "[사용자 턴]"
        } else {
            turn = "[컴퓨터 턴]"
        }
        print("\(turn) \(startText)", terminator: "")
        guard let inputedUserNumber: Int = Int(bindUserInput()) else {
            print(cautionText)
            startMukChiba(attackTurn: false)
            return
        }
        playMukChiba(inputedUserNumber, attackTurn)
    }
    
    fileprivate func playMukChiba(_ userNumber: Int, _ attackTurn: Bool) {
        switch selectOption(userNumber) {
        case .exit:
            print(GameOver.exit.rawValue)
        case .play:
            compareNumbers(makeComputerNumber(), userNumber, attackTurn)
        default:
            print(cautionText)
            startMukChiba(attackTurn: false)
        }
    }
}
