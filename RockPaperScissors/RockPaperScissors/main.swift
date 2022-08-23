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
}

struct RockPaperScissorsGame {
    func startGame() {
        let selectedUserMenu: Int = getSelectedUserMenu()
        switch selectedUserMenu {
        case 1...3:
            let userHand: RockPaperScissors = RockPaperScissors.init(rawValue: selectedUserMenu) ?? .rock
            let computerHand: RockPaperScissors = getComputerHand()
            if compareUserHandWithComputerHand(userHand: userHand, computerHand: computerHand) == .draw {
                startGame()
            } else {
                return
            }
        default:
            return
        }
    }
    
    func getSelectedUserMenu() -> Int {
        printMenu()
        guard let selectedUserMenu: Int = Int(readLine() ?? ""),
              isCorrectUserMenu(selectedUserMenu) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getSelectedUserMenu()
        }
        return selectedUserMenu
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }

    func isCorrectUserMenu(_ userMenu: Int) -> Bool {
        switch userMenu {
        case 0...3:
            return true
        default:
            return false
        }
    }
    
    func getComputerHand() -> RockPaperScissors {
        return RockPaperScissors.allCases.randomElement() ?? .rock
    }
    
    func compareUserHandWithComputerHand(userHand: RockPaperScissors, computerHand: RockPaperScissors) -> WinLoseDraw {
        guard userHand != computerHand else {
            return .draw
        }
        
        switch userHand {
        case .rock:
            if computerHand == .scissors {
                print("이겼습니다!")
                return .win
            } else {
                print("졌습니다!")
                return .lose
            }
        case .paper:
            if computerHand == .rock {
                print("이겼습니다!")
                return .win
            } else {
                print("졌습니다!")
                return .lose
            }
        case .scissors:
            if computerHand == .paper {
                print("이겼습니다!")
                return .win
            } else {
                print("졌습니다!")
                return .lose
            }
        }
    }
}

var game = RockPaperScissorsGame()
game.startGame()

