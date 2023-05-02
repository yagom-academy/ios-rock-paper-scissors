//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by maxhyunm, Mary on 2023/05/02.
//

struct RockPaperScissorsGame {
    enum Menu: String {
        case scissors = "1"
        case rock = "2"
        case paper = "3"
        case exit = "0"
        
        var winningOpponent: Menu {
            switch self {
            case .scissors:
                return .paper
            case .rock:
                return .scissors
            case .paper:
                return .rock
            case .exit:
                return .exit
            }
        }
    }

    enum Result: String {
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case draw = "비겼습니다!"
    }

    func startGame() {
        do {
            let menu = try inputMenu()
            
            guard menu != .exit else {
                print("게임 종료")
                return
            }
            let gameResult = try playGame(menu)
            
            print(gameResult.rawValue)
            
            if gameResult == .draw { startGame() }
        } catch GameError.menuNotFound {
            print("\(GameError.menuNotFound.errorMessage)")
            startGame()
        } catch {
            print("\(GameError.unknownError.errorMessage)")
        }
    }

    private func inputMenu() throws -> Menu {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        
        guard let inputValue = readLine(),
              let menu = Menu(rawValue: inputValue)
        else { throw GameError.menuNotFound }
            
        return menu
    }

    private func playGame(_ usersChoice: Menu) throws -> Result {
        guard let computersChoice = Menu(rawValue: String(Int.random(in: 1...3)))
        else { throw GameError.unknownError }

        if usersChoice == computersChoice {
            return .draw
        } else if usersChoice.winningOpponent == computersChoice {
            return .win
        } else {
            return .lose
        }
    }
}

