import Foundation

struct RPSGameMachine {
    func startRPSGame() {
        guard let userRPS = generateUserRPS() else {
            print("게임 종료")
            return
        }
        
        let computerRPS = generateComputerRPS()
        let userGameResult = decideUserVictory(userRPS, vs: computerRPS)
        
        printResult(of: userGameResult)
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    func fetchUserInput() -> Int? {
        guard let userInput = readLine() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
        
        return Int(userInput)
    }
    
    func generateUserRPS() -> RPS? {
        printMenu()
        
        guard let userInput = fetchUserInput() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateUserRPS()
        }
        
        guard userInput != 0 else {
            return nil
        }
        
        let userRPS: RPS
        
        switch userInput {
        case 1:
            userRPS = .scissors
        case 2:
            userRPS = .rock
        case 3:
            userRPS = .paper
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateUserRPS()
        }
        
        return userRPS
    }
    
    func generateComputerRPS() -> RPS {
        var computerRPS: RPS {
            let RPSNumber = Int.random(in: 1...3)
            
            switch RPSNumber {
            case 1:
                return .scissors
            case 2:
                return .rock
            case 3:
                return .paper
            default :
                return generateComputerRPS()
            }
        }
        
        return computerRPS
    }
    
    func decideUserVictory(_ userRPS: RPS, vs computerRPS: RPS) -> GameResult {
        var gameResult: GameResult = .draw
        
        if userRPS == computerRPS {
            return gameResult
        }
        
        switch userRPS {
        case .rock:
            if computerRPS == .scissors {
                gameResult = .win
            } else if computerRPS == .paper {
                gameResult = .lose
            }
        case .paper:
            if computerRPS == .rock {
                gameResult = .win
            } else if computerRPS == .scissors {
                gameResult = .lose
            }
        case .scissors:
            if computerRPS == .paper {
                gameResult = .win
            } else if computerRPS == .rock {
                gameResult = .lose
            }
        }
        
        return gameResult
    }
    
    func printResult(of result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
            startRPSGame()
        }
    }
}


