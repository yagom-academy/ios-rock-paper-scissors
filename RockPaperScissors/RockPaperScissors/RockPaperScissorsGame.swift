//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by maxhyunm, Mary on 2023/05/02.
//

struct RockPaperScissorsGame {
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
        
        var message: String {
            switch self {
            case .win:
                return "이겼습니다!"
            case .lose:
                return "졌습니다!"
            case .draw:
                return "비겼습니다!"
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
    var printMessage: String {
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
            let resultMessage = selectResultMessage(gameResult)
            
            print(resultMessage)
            
            guard gameResult != .exit else { return }
            guard !(!isFirstGame && gameResult == .draw) else { return }
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
    
    private func selectResultMessage(_ result: Result) -> String {
        if isFirstGame || result == .exit {
            return result.message
        } else if result == .draw {
            return "\(turn)의 승리!"
        } else {
            return "\(turn)의 턴입니다."
        }
    }

    private func inputMenu() throws -> Menu {
        print(printMessage, terminator: " ")
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
        print("사용자: \(usersChoice)")
        print("컴퓨터: \(computersChoice)")
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

