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

enum Choice: Int{
    case scissors = 1
    case rock = 2
    case paper = 3
    case exit = 0
}

enum ErrorMessage: Error {
    case wrongInput
    case systemError
}

struct RockPaperScissorsGame {
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
        
        guard userChoice == Choice.scissors.rawValue || userChoice == Choice.rock.rawValue || userChoice == Choice.paper.rawValue || userChoice == Choice.exit.rawValue else {
            throw ErrorMessage.wrongInput
        }
        
        guard userChoice == Choice.exit.rawValue else {
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

let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.startGame()
