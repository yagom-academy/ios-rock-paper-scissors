class RockPaperScissors {
    var handOfComputer: Hand = .rock
    var handOfUser: Hand = .rock
    var rawUserInput: String? = ""
    
    enum ResultsOfRockPaperScissors: String {
        case userWin = "이겼습니다!"
        case userLose = "졌습니다!"
        case draw = "비겼습니다!"
    }
    
    enum ResultsOfMukChiBa: String {
        case userTurn = "사용자"
        case computerTurn = "컴퓨터"
        case somebodyWin
    }
    
    enum GameError: Error {
        case invalidInput
        case unknownError
    }
    
    enum Hand: Int {
        case rock = 1
        case scissor = 2
        case paper = 3
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
            
            let resultOfRockPaperScissors = RockPaperScissorsResult()
            showResult(resultOfRockPaperScissors)
            if resultOfRockPaperScissors == .draw {
                continue outer
            }
            
            MukChiBa(winner: resultOfRockPaperScissors == .userWin ? "사용자" : "컴퓨터").mukChiBaStart()
            break outer
        }
    }
    
    func RockPaperScissorsResult() -> ResultsOfRockPaperScissors {
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
    
    func checkUserInput() throws -> Hand {
        guard let stringUserInput = rawUserInput,
              let integerUserInput = Int(stringUserInput),
              let userInput = Hand(rawValue: integerUserInput)
        else {
            throw GameError.invalidInput
        }
        return userInput
    }
    
    func showResult(_ input: ResultsOfRockPaperScissors) {
        let resultStatement = input.rawValue
        print(resultStatement)
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
            
            rawUserInput = readLine()
            if let rawUserInput = rawUserInput {
                if rawUserInput == "0" {
                    break outer
                }
            }
            
            do {
                if let safeHandOfUser = MukChiBa.Hand(rawValue:try checkUserInput().rawValue) {
                    handOfUser = safeHandOfUser
                }
            } catch {
                currentTurn = "컴퓨터"
                continue outer
            }
            
            let resultOfMukChiBa = mukChiBaResult()
            switch resultOfMukChiBa {
            case .somebodyWin:
                print("\(currentTurn) 승리!")
                break outer
            default:
                currentTurn = resultOfMukChiBa.rawValue
                print("\(currentTurn)의 턴입니다")
            }
        }
    }
    
    func mukChiBaResult() -> ResultsOfMukChiBa {
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
