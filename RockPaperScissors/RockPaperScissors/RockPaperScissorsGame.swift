//  Created by 감자 and som on 2022/08/22.

struct RockPaperScissorsGame {
    func play() {
        guard let userRPS = generateUserRPS() else {
            print("게임 종료")
            return
        }
        
        let computerRPS = generateComputerRandomRPS()
        let userGameResult = judgeWinOrLose(userRPS, computerRPS)
        
        showResult(userGameResult)
    }
    
    func showMenu() {
        print("가위(\(RockPaperScissors.scissors.rawValue)),",
              "바위(\(RockPaperScissors.rock.rawValue)),",
              "보(\(RockPaperScissors.paper.rawValue))! <종료 : 0>: ", terminator: "")
    }
    
    func inputUserNumber() -> Int? {
        guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
            print("입력된 값이 없습니다.")
            return inputUserNumber()
        }
        let inputUserNumberToInt = Int(inputUserNumber)
        return inputUserNumberToInt
    }
    
    func generateUserRPS() -> RockPaperScissors? {
        showMenu()
        
        guard let userNumber = inputUserNumber() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateUserRPS()
        }
        
        guard userNumber != 0 else {
            return nil
        }
        
        guard let userRPS: RockPaperScissors = .init(rawValue: userNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateUserRPS()
        }
        return userRPS
    }
    
    func generateComputerRandomRPS() -> RockPaperScissors {
        let computerNumber = Int.random(in: 1...3)
        
        guard let computerRPS: RockPaperScissors = .init(rawValue: computerNumber) else {
            return generateComputerRandomRPS()
        }
        return computerRPS
    }
    
    func judgeWinOrLose(_ userRPS: RockPaperScissors, _ computerRPS: RockPaperScissors) -> GameResult {
        var gameResult: GameResult = .draw
        
        if userRPS == computerRPS {
            return gameResult
        }
        
        switch userRPS {
        case .scissors:
            if computerRPS == .paper {
                gameResult = .win
            } else if computerRPS == .rock {
                gameResult = .lose
            }
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
        }
        return gameResult
    }
    
    func showResult(_ result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
            play()
        }
    }
}


