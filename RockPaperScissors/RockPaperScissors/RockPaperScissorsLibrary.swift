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

    private func judgeValidInput(userInput: Int?) -> Int? {
        switch userInput {
        case 0:
            return 0
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 3
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
    }

    private func generateRandomComputerHand() -> Int {
        return Int.random(in: 1...3)
    }

    private func judgeWin(userHand: Int, computerHand: Int) -> WinLoseDrawCase {
        if userHand == computerHand {
            return .draw
        } else if userHand == 1 && computerHand == 3 {
            return .win
        } else if userHand == 2 && computerHand == 1 {
            return .win
        } else if userHand == 3 && computerHand == 2 {
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
        
        if userInput == 0 {
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
