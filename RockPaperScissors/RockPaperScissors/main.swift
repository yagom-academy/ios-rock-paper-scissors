enum GameError: Error {
    case invalidInput
    case unknownError
}
enum ResultOfRockPaperScissors {
    case userWin
    case userLose
    case draw
}
enum ResultOfMukChiBa {
    case userTurn
    case computerTurn
    case somebodyWin
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
            let ResultOfRockPaperScissors = compareHandsOfRockPaperScissors(handOfUser, with: handOfComputer)
            showResult(ResultOfRockPaperScissors)
            if ResultOfRockPaperScissors == .draw{
                continue outer
            }
            MukChiBa(winner: ResultOfRockPaperScissors == .userWin ? "사용자" : "컴퓨터").mukChiBaStart()
            break outer
        }
    }
    func compareHandsOfRockPaperScissors(_ user: Int, with computer: Int) -> ResultOfRockPaperScissors {
        switch (user, computer) {
        case (1, 1), (2, 2), (3, 3):
            return .draw
        case (1, 3), (2, 1), (3, 2):
            return .userWin
        case (1, 2), (2, 3), (3, 1):
            return .userLose
        default:
            print("알 수 없는 오류입니다.")
            return .userLose
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
        case .userWin:
            print("이겼습니다!")
        case .userLose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
}
class MukChiBa : RockPaperScissors {
    var currentTurn: String
    
    init(winner: String) {
        currentTurn = winner
    }
    
    func mukChiBaStart() {
        outer: while true {
            print("[\(currentTurn)턴] 묵(1). 찌(2). 빠(3)! <종료 : 0>", terminator: " : ")
            handOfComputer = Int.random(in: 1...3)
            do {
                handOfUser = try getUserInput()
            } catch {
                currentTurn = "컴퓨터"
                continue outer
            }
            let resultOfMukChiBa = compareHandsOfMukChiBa(handOfUser, with: handOfComputer, turn: currentTurn)
            switch resultOfMukChiBa {
            case .somebodyWin:
                print("\(currentTurn) 승리!")
                break outer
            case .userTurn:
                currentTurn = "사용자"
                print("\(currentTurn)의 턴입니다")
            case .computerTurn:
                currentTurn = "컴퓨터"
                print("\(currentTurn)의 턴입니다")
            }
            
        }
    }
    func compareHandsOfMukChiBa(_ user: Int, with computer: Int, turn: String) -> ResultOfMukChiBa {
        switch (user, computer, turn) {
        case (1, 1, _), (2, 2, _), (3, 3, _):
            return .somebodyWin
        case (1, 3, _), (2, 1, _), (3, 2, _):
            return .computerTurn
        case (1, 2, _), (2, 3, _), (3, 1, _):
            return .userTurn
        default:
            print("알 수 없는 오류입니다.")
            return .somebodyWin
        }
    }
}

RockPaperScissors().startGame()
