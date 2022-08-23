//
//  RockPaperScissors - main.swift
//  Created by LJ, 준호.
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum WinLoseDraw {
    case win
    case lose
    case draw
    
    func printResult() {
        switch self {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
}

struct RockPaperScissorsGame {
    func startGame() {
        let selectedUserMenu: Int = getSelectedUserMenu()
        switch selectedUserMenu {
        case 1...3:
            let userHand: RockPaperScissors = RockPaperScissors.init(rawValue: selectedUserMenu) ?? .rock
            let computerHand: RockPaperScissors = getComputerHand()
            let gameResult: WinLoseDraw = compareUserHandWithComputerHand(userHand: userHand, computerHand: computerHand)
            gameResult.printResult()
            if gameResult == .draw {
                startGame()
            } else {
                return
            }
        default:
            return
        }
    }
    
    private func getSelectedUserMenu() -> Int {
        printMenu()
        guard let selectedUserMenu: Int = Int(readLine() ?? ""),
              isCorrectUserMenu(selectedUserMenu) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getSelectedUserMenu()
        }
        return selectedUserMenu
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }

    private func isCorrectUserMenu(_ userMenu: Int) -> Bool {
        switch userMenu {
        case 0...3:
            return true
        default:
            return false
        }
    }
    
    private func getComputerHand() -> RockPaperScissors {
        return RockPaperScissors.allCases.randomElement() ?? .rock
    }
    
    private func compareUserHandWithComputerHand(userHand: RockPaperScissors, computerHand: RockPaperScissors) -> WinLoseDraw {
        guard userHand != computerHand else {
            return .draw
        }
        
        switch userHand {
        case .rock:
            if computerHand == .scissors {
                return .win
            } else {
                return .lose
            }
        case .paper:
            if computerHand == .rock {
                return .win
            } else {
                return .lose
            }
        case .scissors:
            if computerHand == .paper {
                return .win
            } else {
                return .lose
            }
        }
    }
    

}

var game = RockPaperScissorsGame()
game.startGame()
