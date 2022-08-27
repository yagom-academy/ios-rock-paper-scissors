class Game {
    static var offensivePlayer: String = ""
    
    func generateRandomComputerNumber() -> Int {
        return Int.random(in: 1...3)
    }
    
    func translateNumbersToHandSigns(of input: Int) -> HandSigns? {
        return HandSigns(rawValue: input)
    }
    
    func getUserInput() -> Int? {
        guard let input = readLine(), input.count == 1, let userNumber = Int(input) else {
            return nil
        }
        return userNumber
    }
    
    func intToHandSigns(with userNumber: Int, and computerNumber: Int) -> (HandSigns?, HandSigns?) {
        let userHandSign = translateNumbersToHandSigns(of: userNumber)
        let computerHandSign = translateNumbersToHandSigns(of: computerNumber)
        
        return (userHandSign, computerHandSign)
    }
    
    func switchMenu(with userNumber: Int, before judgingWinner: (Int, Int) -> Void) {
        switch userNumber {
        case 1, 2, 3:
            let computerNumber = generateRandomComputerNumber()
            judgingWinner(userNumber, computerNumber)
        case 0:
            print("게임 종료")
        default:
            executeDefaultBehavior()
        }
    }
    
    func executeDefaultBehavior() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

class RockPaperScissors: Game {
    var mukchiba: Mukchiba = Mukchiba()
    
    func startRockPaperScissors() {
        if var userNumber = self.getUserInput() {
            userNumber = Int(userNumber)
            self.switchMenu(with: userNumber, before: judgeWinner(with:and:))
        } else {
            executeDefaultBehavior()
        }
    }
    
    override func getUserInput() -> Int? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        return super.getUserInput()
    }
    
    override func executeDefaultBehavior() {
        super.executeDefaultBehavior()
        startGame()
    }
    
    func judgeWinner(with userNumber: Int, and computerNumber: Int) {
        let (userHandSign, computerHandSign) = super.intToHandSigns(with: userNumber, and: computerNumber)
        
        switch (userHandSign, computerHandSign) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors) :
            print("이겼습니다!")
            Game.offensivePlayer = "사용자"
            mukchiba.startMukchiba()
        case (.scissors, .rock), (.paper, .scissors), (.rock, .paper) :
            print("졌습니다!")
            Game.offensivePlayer = "컴퓨터"
            mukchiba.startMukchiba()
        default:
            print("비겼습니다!")
            self.startRockPaperScissors()
        }
    }
}

class Mukchiba: Game {
    func startMukchiba() {
        if var userNumber = self.getUserInput() {
            userNumber = Int(userNumber)
            self.switchMenu(with: userNumber, before: judgeWinner(with:and:))
        } else {
            executeDefaultBehavior()
        }
    }
    
    override func getUserInput() -> Int? {
        print("[\(Game.offensivePlayer) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        return super.getUserInput()
    }
    
    override func executeDefaultBehavior() {
        super.executeDefaultBehavior()
        
        if Game.offensivePlayer == "사용자" {
            Game.offensivePlayer = "컴퓨터"
            startMukchiba()
        } else {
            startMukchiba()
        }
    }
    
    func judgeWinner(with userNumber: Int, and computerNumber: Int) {
        let (userHandSign, computerHandSign) = super.intToHandSigns(with: userNumber, and: computerNumber)
        
        switch (userHandSign, computerHandSign) {
        case (.scissors, .scissors), (.paper, .paper), (.rock, .rock) :
            print("\(Game.offensivePlayer)의 승리!")
        case (.scissors, .rock), (.paper, .scissors), (.rock, .paper) :
            print("컴퓨터의 턴입니다.")
            Game.offensivePlayer = "컴퓨터"
            startMukchiba()
        default:
            print("사용자의 턴입니다.")
            Game.offensivePlayer = "사용자"
            startMukchiba()
        }
    }
}
