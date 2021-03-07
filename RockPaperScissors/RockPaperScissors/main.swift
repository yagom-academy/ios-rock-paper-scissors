
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
    
    private func handOfComputer() -> Hand {
        // enum Hand가 nil이 아닌게 확실한 경우에는 느낌표(!)를 써도 무방하다.
        return Hand.allCases.randomElement()!
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
                let userHand = try handOfUser(stringUserInput)
                let computerHand = handOfComputer()
                let resultOfGame = result(of: userHand, with: computerHand)
                showResult(resultOfGame)
                if resultOfGame == .draw {
                    continue outer
                }
                let _ = MukChiBa(didUserWin: resultOfGame == .win ? true : false)
                break outer
                
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
        }
    }
    // class 내에서 result는 가위바위보의 result인게 확실하니까 굳이 앞에 부가설명을 적지 않아도 된다.
    private func result(of user: Hand, with computer: Hand) -> GameResult {
        switch (user, computer) {
        case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
            return .draw
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
            return .win
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
            return .lose
        }
    }
    
    private func showMenu() {
        print("가위(1). 바위(2). 보(3)! <종료 : 0>", terminator: " : ")
        
    }
    
    // handOfUser라고 적어도 로직을 이해할 수 있으면 이렇게 작성해도 괜찮다.
    // hand를 강조!
    private func handOfUser(_ stringUserInput: String) throws -> Hand {
        guard let integerUserInput = Int(stringUserInput),
              let userInput = Hand(rawValue: integerUserInput)
        else {
            throw GameError.invalidInput
        }
        return userInput
    }
    
    private func showResult(_ input: GameResult) {
        let resultStatement = input.rawValue
        print(resultStatement)
    }
}
// enum -> 프로퍼티 -> init -> 메소드 순서대로 코드를 배치하였다.
class MukChiBa {
    
    // 굳이 두 개의 프로토콜을 따로 채택할 필요 없이 이렇게 한 줄에 묶어서 채택하고 바로 rawValue값을 불러올 수 있다.
    enum GameTurn: String, CustomStringConvertible {
        case userTurn = "사용자"
        case computerTurn = "컴퓨터"
        
        var description: String {
            self.rawValue
        }
    }
    enum Hand: Int, CaseIterable {
        case muk = 1
        case chi = 2
        case ba = 3
    }
    
    private var currentPlayer: GameTurn
    
    init(didUserWin: Bool) {
        currentPlayer = didUserWin ? .userTurn : .computerTurn
        startGame()
    }
    
    private func handOfComputer() -> Hand {
        // enum Hand가 nil이 아닌게 확실한 경우에는 느낌표(!)를 써도 무방하다.
        return Hand.allCases.randomElement()!
    }
    
    private func showMenu() {
        print("[\(currentPlayer) 턴] 묵(1). 찌(2). 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    
    private func startGame() {
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
                let userHand = try handOfUser(stringUserInput)
                let computerHand = handOfComputer()
                if isGameEnd(userHand, computerHand) {
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
    
    private func handOfUser(_ input: String) throws -> Hand {
        guard let userInput = Int(input),
              let userHand = Hand(rawValue: userInput)
        else {
            throw GameError.invalidInput
        }
        return userHand
    }
    
    private func isGameEnd(_ user: Hand, _ computer: Hand) -> Bool {
        switch (user, computer) {
        case (.muk, .muk), (.chi, .chi), (.ba, .ba):
            return true
        case (.muk, .ba), (.chi, .muk), (.ba, .chi):
            currentPlayer = .computerTurn
            return false
        case (.muk, .chi), (.chi, .ba), (.ba, .muk):
            currentPlayer = .userTurn
            return false
        }
    }
}

RockPaperScissors().startGame()
