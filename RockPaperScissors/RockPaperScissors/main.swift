
enum GameError: Error {
    case invalidInput
    case unknownError
}

class RockPaperScissors {

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
    
    func renewComputerHand() -> Hand {
        let randomHand = Hand.rock
        if let randomHand = Hand.allCases.randomElement()  {
            let handOfComputer = randomHand
            return handOfComputer
        }
        return randomHand
    }
    
    func startGame() {
        outer: while true {
            showMenu()
            
            guard let stringUserInput = readLine() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            
            if stringUserInput == "0" {
                break outer
            }
            
            do {
                let userHand = try checkedUserHand(stringUserInput)
                let computerHand = renewComputerHand()
                let result = rockPaperScissorsResult(of: userHand, with: computerHand )
                showResult(result)
                if result == .draw {
                    continue outer
                }
                MukChiBa(didUserWin: result == .win ? true : false).startGame()
                break outer
                
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
        }
    }
    
    func rockPaperScissorsResult(of user: Hand, with computer: Hand) -> GameResult {
        switch (user, computer) {
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
    
    enum GameTurn: CustomStringConvertible {
        case userTurn
        case computerTurn
        
        var description: String {
            switch self {
            case .userTurn:
                return "사용자"
            case .computerTurn:
                return "컴퓨터"
            }
        }
    }
    
    enum MukchibaHand: Int, CaseIterable {
        case rock = 1
        case scissor = 2
        case paper = 3
    }
    
    func renewComputerHand() -> MukchibaHand {
        let randomHand = MukchibaHand.rock
        if let randomHand = MukchibaHand.allCases.randomElement()  {
            let handOfComputer = randomHand
            return handOfComputer
        }
        return randomHand
    }
    
    var currentPlayer: GameTurn
    
    init(didUserWin: Bool) {
        currentPlayer = didUserWin ? .userTurn : .computerTurn
    }
    
    func showMenu() {
        print("[\(currentPlayer) 턴] 묵(1). 찌(2). 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    
    func startGame() {
        outer: while true {
            showMenu()
            
            guard let stringUserInput = readLine() else {
                currentPlayer = .computerTurn
                continue outer
            }
            
            if stringUserInput == "0" {
                break outer
            }
            
            do {
                let handOfUser = try checkedUserHand(stringUserInput)
                let handOfComputer = renewComputerHand()
                if isTurnEnd(compared: handOfUser, with: handOfComputer) {
                    print("\(currentPlayer) 승리!")
                    break outer
                }
                print("\(currentPlayer)의 턴입니다")
                
            } catch {
                currentPlayer = .computerTurn
                continue outer
            }
        }
    }
    
    func checkedUserHand(_ stringUserInput: String) throws -> MukchibaHand {
        guard let integerUserInput = Int(stringUserInput),
              let userInput = MukchibaHand(rawValue: integerUserInput)
        else {
            throw GameError.invalidInput
        }
        return userInput
    }
    
    func isTurnEnd(compared user: MukchibaHand, with computer: MukchibaHand) -> Bool {
        switch (user, computer) {
        case (.rock, .rock), (.scissor, .scissor), (.paper, .paper):
            return true
        case (.rock, .paper), (.scissor, .rock), (.paper, .scissor):
            currentPlayer = .computerTurn
            return false
        case (.rock, .scissor), (.scissor, .paper), (.paper, .rock):
            currentPlayer = .userTurn
            return false
        }
    }
}

RockPaperScissors().startGame()
