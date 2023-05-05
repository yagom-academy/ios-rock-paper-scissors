//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by maxhyunm, Mary on 2023/05/02.
//

struct MukJjiPpaGame {
    enum Menu: String {
        case scissors
        case rock
        case paper
        case exit
        
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

    enum Result {
        case win
        case lose
        case draw
        case exit
        
        func selectMessage(isFirstGame: Bool, turn: String) -> String {
            switch self {
            case .win:
                return isFirstGame ? "이겼습니다!" : "\(turn)의 턴입니다."
            case .lose:
                return isFirstGame ? "졌습니다!" : "\(turn)의 턴입니다."
            case .draw:
                return isFirstGame ? "비겼습니다!" : "\(turn)의 승리!"
            case .exit:
                return "게임 종료"
            }
        }
    }
    
    var choices: Dictionary<String, Menu> {
        switch isFirstGame {
        case true:
            return ["0": .exit, "1": .scissors, "2": .rock, "3": .paper]
        case false:
            return ["0": .exit, "1": .rock, "2": .scissors, "3": .paper]
        }
    }
    var menuMessage: String {
        switch isFirstGame {
        case true:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case false:
            return "[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
        }
    }
    var isFirstGame: Bool = true
    var turn: String = ""
    
    mutating func startGame() {
        do {
            let menu = try inputMenu()
            let gameResult = try playGame(menu)
            let resultMessage = gameResult.selectMessage(isFirstGame: isFirstGame, turn: turn)
            
            print(resultMessage)
            
            guard gameResult != .exit,
                  !(!isFirstGame && gameResult == .draw) else { return }
            if isFirstGame && (gameResult == .win || gameResult == .lose) {
                isFirstGame = false
            }
            startGame()
        } catch GameError.menuNotFound {
            print(GameError.menuNotFound.errorMessage)
            if !isFirstGame {
                turn = "컴퓨터"
            }
            startGame()
        } catch {
            print(GameError.unknown.errorMessage)
        }
    }
    
    private func inputMenu() throws -> Menu {
        print(menuMessage, terminator: " ")
        guard let inputValue = readLine(),
              let menu = choices[inputValue] else {
            throw GameError.menuNotFound
        }
        
        return menu
    }

    private mutating func playGame(_ usersChoice: Menu) throws -> Result {
        guard usersChoice != .exit else { return .exit }
        guard let computersChoice = choices[String(Int.random(in: 1...3))] else {
            throw GameError.unknown
        }
        if usersChoice == computersChoice {
            return .draw
        } else if usersChoice.winningOpponent == computersChoice {
            turn = "사용자"
            return .win
        } else {
            turn = "컴퓨터"
            return .lose
        }
    }
}

