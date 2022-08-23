//  Created by rhovin and zhilly on 2022/08/22.

class RockPaperScissorsLibrary {
    private func displayGameMessege() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    }

    private func inputUserSelction() -> Int? {
        guard let userInput = readLine(), let userSelection = Int(userInput) else {
            return nil
        }
        
        return userSelection
    }

    private func judgeValidInput(userInput: Int?) -> RockPaperScissorCase? {
        switch userInput {
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

    private func judgeWin(userHand: RockPaperScissorCase, computerHand: RockPaperScissorCase) -> WinLoseDrawCase {
        if userHand == computerHand {
            return .draw
        } else if userHand == .scissor && computerHand == .paper {
            return .win
        } else if userHand == .rock && computerHand == .scissor {
            return .win
        } else if userHand == .paper && computerHand == .rock {
            return .win
        } else {
            return .lose
        }
    }
}

extension RockPaperScissorsLibrary: RockPaperScissorsLibraryProtocol {
    func startGame() {
        displayGameMessege()
        
        guard let userInput = judgeValidInput(userInput: inputUserSelction()) else {
            return startGame()
        }
        
        if userInput == .end {
            return
        }
        
        let result: WinLoseDrawCase = judgeWin(userHand: userInput, computerHand: generateRandomComputerHand())
        
        switch result {
        case .lose:
            print("졌습니다!")
            return
        case .win:
            print("이겼습니다!")
            return
        case .draw:
            print("비겼습니다!")
            return startGame()
        }
    }
}
