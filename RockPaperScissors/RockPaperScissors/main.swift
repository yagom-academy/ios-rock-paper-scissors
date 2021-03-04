class RockPaperScissors {
    var handOfComputer: Hand = .rock
    var handOfUser: Hand = .rock
    var rawUserInput: String? = ""
    
    enum GameResult: String {
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case draw = "비겼습니다!"
    }
    
    enum GameError: Error {
        case invalidInput
        case unknownError
    }
    
    enum Hand: Int, CaseIterable {
        case rock = 1
        case scissor = 2
        case paper = 3
    }
    
    func renewComputerHand() {
        handOfComputer = Hand.allCases.map{$0}[Int.random(in: 0...2)]
    }
    
    func startGame() {
        outer: while true {
            renewComputerHand()
            showMenu()
            
            rawUserInput = readLine()
            if let rawUserInput = rawUserInput {
                if rawUserInput == "0" {
                    break outer
                }
            }
            
            do {
                if let safeHandOfUser = RockPaperScissors.Hand(rawValue: try checkUserInput().rawValue) {
                    handOfUser = safeHandOfUser
                }
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            
            let resultOfRockPaperScissors = rockPaperScissorsResult()
            showResult(resultOfRockPaperScissors)
            if resultOfRockPaperScissors == .draw {
                continue outer
            }
            
            MukChiBa(rockPaperScissorsResult: resultOfRockPaperScissors).gameStart()
            break outer
        }
    }
    
    func rockPaperScissorsResult() -> GameResult {
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
    
    func checkUserInput() throws -> Hand {
        guard let stringUserInput = rawUserInput,
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

class MukChiBa : RockPaperScissors {
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
    
    override func showMenu() {
        print("[\(currentTurn) 턴] 묵(1). 찌(2). 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    func gameStart() {
        outer: while true {
            showMenu()
            renewComputerHand()
            
            rawUserInput = readLine()
            if let rawUserInput = rawUserInput {
                if rawUserInput == "0" {
                    break outer
                }
            }
            
            do {
                handOfUser = try checkUserInput()
            } catch {
                currentTurn = .computerTurn
                continue outer
            }
            
            let resultOfMukChiBa = mukChiBaResult()
            switch resultOfMukChiBa {
            case .somebodyWin:
                print("\(currentTurn) 승리!")
                break outer
            default:
                currentTurn = resultOfMukChiBa
                print("\(resultOfMukChiBa)의 턴입니다")
            }
        }
    }
    
    func mukChiBaResult() -> GameResult {
        switch (handOfUser.rawValue, handOfComputer.rawValue) {
        case (1, 1), (2, 2), (3, 3):
            return .somebodyWin
        case (1, 3), (2, 1), (3, 2):
            return .computerTurn
        case (1, 2), (2, 3), (3, 1):
            return .userTurn
        default:
            print("알 수 없는 오류입니다.")
            return .computerTurn
        }
    }
}

RockPaperScissors().startGame()
