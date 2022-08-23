//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by LJ, 준호 on 2022/08/23.
//

struct RockPaperScissorsGame {
    func startGame() {
        let selectedUserMenu: Int = getSelectedUserMenu()
       
        if let userHand: RockPaperScissors = RockPaperScissors.init(rawValue: selectedUserMenu) {
            let computerHand: RockPaperScissors = getComputerHand()
            let gameResult: WinLoseDraw = compareUserHandWithComputerHand(userHand: userHand, computerHand: computerHand)
            gameResult.printResult()
            if gameResult == .draw {
                startGame()
            }
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
