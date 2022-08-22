import Foundation

struct GameManager {
    func startRPSGame() {
        let userRPS = generateUserRPS()
        let computerRPS = generateComputerRPS()
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }

    func fetchUserInput() -> Int? {
        let userInput = readLine()

        guard let userInput = userInput else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
        
        return Int(userInput)
    }
    
    func generateUserRPS() -> RPS {
        printMenu()
        let userInput = fetchUserInput()
        guard let userInput = userInput else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateUserRPS()
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
            case 1: return .scissors
            case 2: return .rock
            case 3: return .paper
            default : return generateComputerRPS()
            }
        }
        
        return computerRPS
    }
}
