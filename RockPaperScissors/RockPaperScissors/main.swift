//
//  RockPaperScissors - main.swift
//  Created by LJ, 준호.
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissors: Int, CaseIterable {
    case rock = 1
    case scissors = 2
    case paper = 3
}

struct RockPaperScissorsGame {
    func startGame() {
        var selectedUserMenu: Int = getSelectedUserMenu()
        switch selectedUserMenu {
        case 1...3:
            let userHand: RockPaperScissors = RockPaperScissors.init(rawValue: selectedUserMenu) ?? .rock
            let computerHand: RockPaperScissors = getComputerHand()
            break
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
}

var game = RockPaperScissorsGame()
game.startGame()

