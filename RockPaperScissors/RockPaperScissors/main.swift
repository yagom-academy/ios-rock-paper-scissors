class RockPaperScissors {
    var handOfComputer: Hand = .rock
    var handOfUser: Hand = .rock
    
    enum ResultOfRockPaperScissors: String {
        case userWin = "이겼습니다!"
        case userLose = "졌습니다!"
        case draw = "비겼습니다!"
    }
    
    enum ResultOfMukChiBa {
        case userTurn
        case computerTurn
        case somebodyWin
        case exitInput
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
        outer: while true {
            renewComputerHand()
            showMenu()
            
            do {
                if let safeHandOfUser = RockPaperScissors.Hand(rawValue: try getUserInput().rawValue) {
                    handOfUser = safeHandOfUser
                }
                if handOfUser == .exit {
                    break outer
                }
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            
            let ResultOfRockPaperScissors = compareHandsOfRockPaperScissors()
            showResult(ResultOfRockPaperScissors)
            if ResultOfRockPaperScissors == .draw{
                continue outer
            }
            MukChiBa(winner: ResultOfRockPaperScissors == .userWin ? "사용자" : "컴퓨터").mukChiBaStart()
            break outer
        }
    }
    
    func compareHandsOfRockPaperScissors() -> ResultOfRockPaperScissors {
        switch (handOfUser.rawValue, handOfComputer.rawValue) {
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
    
    func getUserInput() throws -> Hand {
        guard let stringUserInput = readLine(),
              let integerUserInput = Int(stringUserInput),
              let userInput = Hand(rawValue: integerUserInput)
        else {
            throw GameError.invalidInput
        }
        return userInput
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
    
    override func showMenu() {
        print("[\(currentTurn) 턴] 묵(1). 찌(2). 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    func mukChiBaStart() {
        outer: while true {
            showMenu()
            renewComputerHand()
            
            do {
                if let safeHandOfUser = MukChiBa.Hand(rawValue:try getUserInput().rawValue) {
                    handOfUser = safeHandOfUser
                }
            } catch {
                currentTurn = "컴퓨터"
                continue outer
            }
            
            let resultOfMukChiBa = compareHandsOfMukChiBa()
            switch resultOfMukChiBa {
            case .somebodyWin:
                print("\(currentTurn) 승리!")
                break outer
            case .userTurn:
                currentTurn = "사용자"
            case .computerTurn:
                currentTurn = "컴퓨터"
            case .exitInput:
                break outer
            }
            print("\(currentTurn)의 턴입니다")
        }
    }
    
    func compareHandsOfMukChiBa() -> ResultOfMukChiBa {
        switch (handOfUser.rawValue, handOfComputer.rawValue) {
        case (1, 1), (2, 2), (3, 3):
            return .somebodyWin
        case (1, 3), (2, 1), (3, 2):
            return .computerTurn
        case (1, 2), (2, 3), (3, 1):
            return .userTurn
        case (0,_):
            return .exitInput
        default:
            print("알 수 없는 오류입니다.")
            return .exitInput
        }
    }
}

RockPaperScissors().startGame()
