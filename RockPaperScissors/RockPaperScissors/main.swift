enum GameError: Error {
    case invalidInput
    case unknownError
}

class RockPaperScissors {
    private var handOfComputer: Hand = .rock
    private var handOfUser: Hand = .rock
    
    enum GameResult: String {
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case draw = "비겼습니다!"
    }
    
    enum Hand: Int, CaseIterable {
        case scissor = 1
        case rock = 2
        case paper = 3
    }
    
    func renewComputerHand() {
        if let randomHand = Hand.allCases.randomElement() {
            handOfComputer = randomHand
        }
    }
    
    func startGame() {
        outer: while true {
            renewComputerHand()
            showMenu()
            
            guard let stringUserInput = readLine() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            
            if stringUserInput == "0" {
                break outer
            }
            
            do {
                handOfUser = try checkedUserHand(stringUserInput)
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            
            let resultOfRockPaperScissors = rockPaperScissorsResult()
            showResult(resultOfRockPaperScissors)
            if resultOfRockPaperScissors == .draw {
                continue outer
            }
            
            MukChiBa(rockPaperScissorsResult: resultOfRockPaperScissors).startGame()
            break outer
        }
    }
    
    func rockPaperScissorsResult() -> GameResult {
        switch (handOfUser, handOfComputer) {
        case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
            return .draw
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
            return .win
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
            return .lose
        }
    }
    
    func showMenu() {
        print("가위(1). 바위(2). 보(3)! <종료 : 0>", terminator: " : ")
    }
    
    func checkedUserHand(_ stringUserInput: String) throws -> Hand {
        guard let integerUserInput = Int(stringUserInput),
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

class MukChiBa {
    private var handOfComputer: Hand = .rock
    private var handOfUser: Hand = .rock
    
    enum Hand: Int, CaseIterable {
        case rock = 1
        case scissor = 2
        case paper = 3
    }
    
    enum GameResult: CustomStringConvertible {
        case userTurn
        case computerTurn
        case somebodyWin
        
        var description: String {
            switch self {
            case .userTurn:
                return "사용자"
            case .computerTurn:
                return "컴퓨터"
            default:
                return ""
            }
        }
    }
    
    var currentTurn: GameResult
    
    init(rockPaperScissorsResult: RockPaperScissors.GameResult) {
        switch rockPaperScissorsResult {
        case .win:
            currentTurn = .userTurn
        case .lose:
            currentTurn = .computerTurn
        default:
            currentTurn = .computerTurn
        }
    }
    
    func showMenu() {
        print("[\(currentTurn) 턴] 묵(1). 찌(2). 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    func renewComputerHand() {
        if let randomHand = Hand.allCases.randomElement() {
            handOfComputer = randomHand
        }
    }
    
    func startGame() {
        outer: while true {
            showMenu()
            renewComputerHand()
            
            guard let stringUserInput = readLine() else {
                currentTurn = .computerTurn
                continue outer
            }
            
            if stringUserInput == "0" {
                break outer
            }
            
            do {
                handOfUser = try checkedUserHand(stringUserInput)
            } catch {
                currentTurn = .computerTurn
                continue outer
            }
            
            if (isGameOver()) {
                print("\(currentTurn) 승리!")
                break outer
            }
            print("\(currentTurn)의 턴입니다")
        }
    }
    
    func checkedUserHand(_ stringUserInput: String) throws -> Hand {
        guard let integerUserInput = Int(stringUserInput),
              let userInput = Hand(rawValue: integerUserInput)
        else {
            throw GameError.invalidInput
        }
        return userInput
    }
    
    func isGameOver() -> Bool {
        switch (handOfUser, handOfComputer) {
        case (.rock, .rock), (.scissor, .scissor), (.paper, .paper):
            return true
        case (.rock, .paper), (.scissor, .rock), (.paper, .scissor):
            currentTurn = .computerTurn
            return false
        case (.rock, .scissor), (.scissor, .paper), (.paper, .rock):
            currentTurn = .userTurn
            return false
        }
    }
}

RockPaperScissors().startGame()
