import Foundation

enum Message: String, CustomStringConvertible {
    var description: String {
        return rawValue
    }
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
    case exit = "게임 종료"
}

enum ErrorMessage: Error {
    case wrongInput
    case systemError
}

struct RockPaperScissors {
    private var generatedChoiceOfComputer: Int {
        return Int.random(in: 1...3)
    }
    
    func startGame() {
        selectUserChoice()
    }
    
    private func receiveInput() throws -> String {
        guard let input = readLine() else {
            throw ErrorMessage.systemError
        }
        return input
    }
    
    private func selectUserChoice() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        
        do {
            let inputUserChoice = try receiveInput()
            try checkValidInput(from: inputUserChoice)
        } catch ErrorMessage.wrongInput {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            selectUserChoice()
        } catch ErrorMessage.systemError {
            print("[SystemError: nil]")
        } catch {
            print(error)
        }
    }
    
    private func checkValidInput(from userChoice: String) throws {
        guard let userChoice = Int(userChoice) else {
            throw ErrorMessage.wrongInput
        }
        
        guard userChoice == 1 || userChoice == 2 || userChoice == 3 || userChoice == 0 else {
            throw ErrorMessage.wrongInput
        }
        
        guard userChoice == 0 else {
            decideGameResult(from: userChoice)
            return
        }
        print(Message.exit)
    }
    
    private func decideGameResult(from userChoice: Int) {
        let choiceOfComputer = generatedChoiceOfComputer
        
        if choiceOfComputer == userChoice {
            print(Message.draw)
            selectUserChoice()
        } else if userChoice == choiceOfComputer + 1 || userChoice == choiceOfComputer - 2 {
            print(Message.win)
            print(Message.exit)
        } else {
            print(Message.lose)
            print(Message.exit)
        }
    }
}

let rockPaperScissors = RockPaperScissors()
rockPaperScissors.startGame()
