//  Created by rhovin and zhilly on 2022/08/22.

class RockPaperScissorsLibrary {
    private func displayRockPaperScissorsInterface() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    }
    
    private func inputUserSelction() -> Int? {
        guard let userInput = readLine() else { return nil }
        
        return Int(userInput)
    }
    
    private func judgeValidInput(userEnter: Int?) -> RockPaperScissorCase? {
        switch userEnter {
        case 0:
            return .end
        case 1:
            return .scissor
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
    }
    
    private func generateRandomComputerHand() -> RockPaperScissorCase {
        let computerHand = Int.random(in: 1...3)
        
        switch computerHand {
        case 1:
            return .scissor
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            return .end
        }
    }
    
    private func judgeWin(
        userHand: RockPaperScissorCase,
        computerHand: RockPaperScissorCase
    ) -> WinLoseDrawCase
    {
        let bothHands = (userHand, computerHand)
        
        switch bothHands {
        case let (userHand, computerHand) where userHand == computerHand:
            return .draw
        case (.scissor, .paper):
            return .win
        case (.rock, .scissor):
            return .win
        case (.paper, .rock):
            return .win
        default:
            return .lose
        }
    }
    
    private func injectTurnToMukChiBba(_ rockPaperScissorsResult: WinLoseDrawCase) {
        switch rockPaperScissorsResult {
        case .lose:
            print("졌습니다!")
            startMukChiBba(turn: .ComputerTurn)
        case .win:
            print("이겼습니다!")
            startMukChiBba(turn: .UserTurn)
        case .draw:
            print("비겼습니다!")
            startGame()
        }
    }
    
    private func startGame() {
        displayRockPaperScissorsInterface()
        
        guard let userInput = judgeValidInput(userEnter: inputUserSelction()) else {
            return startGame()
        }
        
        if userInput == .end {
            return
        }
        
        let rockPaperScissorsResult: WinLoseDrawCase = judgeWin(
            userHand: userInput,
            computerHand: generateRandomComputerHand()
        )
        
        injectTurnToMukChiBba(rockPaperScissorsResult)
    }
    
    private func displayMukChiBbaInterface(turn: TurnCase) {
        print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func judgeNextTurn(by mukChiBbaResult: WinLoseDrawCase, currentTurn: TurnCase) {
        switch mukChiBbaResult {
        case .lose:
            print("컴퓨터의 턴입니다.")
            startMukChiBba(turn: .ComputerTurn)
        case .win:
            print("사용자의 턴입니다.")
            startMukChiBba(turn: .UserTurn)
        case .draw:
            print("\(currentTurn.rawValue)의 승리!")
        }
    }
    
    private func startMukChiBba(turn: TurnCase) {
        displayMukChiBbaInterface(turn: turn)
        
        guard let userInput = judgeValidInput(userEnter: inputUserSelction()) else {
            return startMukChiBba(turn: .ComputerTurn)
        }
        
        if userInput == .end {
            return
        }
        
        let mukChiBbaResult: WinLoseDrawCase = judgeWin(
            userHand: userInput,
            computerHand: generateRandomComputerHand()
        )
        
        judgeNextTurn(by: mukChiBbaResult, currentTurn: turn)
    }
}

extension RockPaperScissorsLibrary: RockPaperScissorsLibraryProtocol {
    func callStartGame() {
        startGame()
    }
}
