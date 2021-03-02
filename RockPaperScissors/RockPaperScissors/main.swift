enum GameError: Error {
    case invalidInput
    case unknownError
}
enum ResultOfRockPaperScissors {
    case win
    case lose
    case draw
}
enum ResultOfMukChiBa {
    case win
    case lose
    case draw
}
class RockPaperScissors {
    var handOfComputer = 0
    var handOfUser = 0
    func initialize() {
        handOfUser = 0
        handOfComputer = Int.random(in: 1...3)
    }
    func startGame() {
        var userInput = 0
        outer: while true {
            initialize()
            showMenu()
            do {
                userInput = try getUserInput()
                if userInput == 0 {
                    break outer
                }
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            handOfUser = userInput
            let winner = compareHands(handOfUser, with: handOfComputer)
            showResult(winner)
            if winner == .draw{
                continue outer
            }
            MukChiBa().mukChiBaStart(winner)
        }
    }
    func compareHands(_ user: Int, with computer: Int) -> ResultOfRockPaperScissors {
        switch (user, computer) {
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
    func getUserInput() throws -> Int {
        guard let unsafeUserInput = readLine() else {
            throw GameError.invalidInput
        }
        
        guard let integerUserInput = Int(unsafeUserInput) else {
            throw GameError.invalidInput
        }
        
        switch integerUserInput {
        case 0, 1, 2, 3:
            return integerUserInput
        default:
            throw GameError.invalidInput
        }
    }
    func showResult(_ input: ResultOfRockPaperScissors) {
        switch input {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
}
class MukChiBa : RockPaperScissors {
    func renewHand(){
        handOfComputer = Int.random(in: 1...3)
    }
    func mukChiBaStart(_ winner: ResultOfRockPaperScissors) {
        
    }
    func showMenu(_ winner: ResultOfRockPaperScissors){
        
    }
    override func compareHands(_ user: Int, with computer: Int) -> ResultOfRockPaperScissors {
        switch (user, computer) {
        case (1, 1), (2, 2), (3, 3):
            return .win
        case (1, 3), (2, 1), (3, 2):
            return .draw
        case (1, 2), (2, 3), (3, 1):
            return .draw
        default:
            print("알 수 없는 오류입니다.")
            return .lose
        }
    }
}

RockPaperScissors().startGame()
