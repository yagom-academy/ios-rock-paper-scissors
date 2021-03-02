import Foundation
class RockScissorPaper {
    var handOfComputer: Hand = .rock
    var handOfUser: Hand = .rock
    
    enum GameResult: String {
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case draw = "비겼습니다!"
    }
    enum GameError: Error {
        case invalidInput
        case unknownError
    }
    enum Hand: Int {
        case rock = 1
        case scissor = 2
        case paper = 3
        case exit = 0
    }
    
    func renewComputerHand() {
        if let randomHand = Hand(rawValue: Int.random(in: 1...3)) {
            handOfComputer = randomHand
        }
    }
    
    func startGame() {
        var userInput: Hand
        outer: while true {
            renewComputerHand()
            showMenu()
            
            do {
                userInput = try getUserInput()
                if userInput == .exit {
                    break outer
                }
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            
            handOfUser = userInput
            let winner = returnResultOfGame()
            showResult(winner)
        }
    }
    
    func returnResultOfGame() -> GameResult {
        switch (handOfUser.rawValue, handOfComputer.rawValue) {
        case (1, 1), (2, 2), (3, 3):
            return .draw
        case (1, 3), (2, 1), (3, 2):
            return .win
        case (1, 2), (2, 3), (3, 1):
            return .lose
        default:
            print("알 수 없는 오류입니다.")
            return .lose
        }
    }
    
    func showMenu() {
        print("가위(1). 바위(2). 보(3)! <종료 : 0>", terminator: " : ")
    }
    
    func getUserInput() throws -> Hand {
        guard let stringUserInput = readLine(),
              let integerUserInput = Int(stringUserInput),
              let userInput = Hand(rawValue: integerUserInput)
              else {
            throw GameError.invalidInput
        }
        return userInput
    }
    
    func showResult(_ input: GameResult) {
        let resultStatement = input.rawValue
        print(resultStatement)
    }
}

RockScissorPaper().startGame()
