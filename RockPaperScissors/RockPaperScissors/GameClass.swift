var offensivePlayer: String = ""

class Game {
    func judgeWinner(with userNumber: Int, and computerNumber: Int) {
    }
    
    func generateRandomComputerNumber() -> Int {
        return Int.random(in: 1...3)
    }
    
    func getUserInput() -> Int {
        return 0
    }
    
    func switchMenu(userNumber: Int, computerNumber: Int) {
        switch userNumber {
        case 1, 2, 3:
            judgeWinner(with: userNumber, and: computerNumber)
        case 0:
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
        }
    }
}

class RockPaperScissors: Game {
    var mukchiba: Mukchiba = Mukchiba()
    
    override func judgeWinner(with userNumber: Int, and computerNumber: Int) {
        let userHandSign = translateNumbersToHandSigns(of: userNumber)
        let computerHandSign = translateNumbersToHandSigns(of: computerNumber)
         
        switch (userHandSign, computerHandSign) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors) :
            print("이겼습니다!")
            offensivePlayer = "사용자"
            mukchiba.startMukchiba()
        case (.scissors, .rock), (.paper, .scissors), (.rock, .paper) :
            print("졌습니다!")
            offensivePlayer = "컴퓨터"
            mukchiba.startMukchiba()

        default:
            print("비겼습니다!")
            self.startRockPaperScissors()
        }
    }
    
    override func getUserInput() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), input.count == 1, let userNumber = Int(input) else { return 4 }
        return userNumber
    }
    
    func startRockPaperScissors() {
        let userNumber = self.getUserInput()
        let computerNumber = self.generateRandomComputerNumber()
        self.switchMenu(userNumber: userNumber, computerNumber: computerNumber)
    }
}

class Mukchiba: Game {
    func startMukchiba() {
        let userNumber = getUserInput()
        let computerNumber = generateRandomComputerNumber()
        switchMenu(userNumber: userNumber, computerNumber: computerNumber)
    }
    
    override func judgeWinner(with userNumber: Int, and computerNumber: Int) {
        let userHandSign = translateNumbersToHandSigns(of: userNumber)
        let computerHandSign = translateNumbersToHandSigns(of: computerNumber)
        let signsToJudge = (userHandSign, computerHandSign)
        
        switch signsToJudge {
        case (.scissors, .scissors), (.paper, .paper), (.rock, .rock) :
            print("\(offensivePlayer)의 승리!")
        case (.scissors, .rock), (.paper, .scissors), (.rock, .paper) :
            print("컴퓨터의 턴입니다.")
            offensivePlayer = "컴퓨터"
            startMukchiba()
        default:
            print("사용자의 턴입니다.")
            offensivePlayer = "사용자"
            startMukchiba()
        }
    }
    
    override func getUserInput() -> Int {
        print("[\(offensivePlayer) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), input.count == 1, let userNumber = Int(input) else { return 4 }
        return userNumber
    }
    
    override func switchMenu(userNumber: Int, computerNumber: Int) {
        switch userNumber {
        case 1, 2, 3:
            judgeWinner(with: userNumber, and: computerNumber)
        case 0:
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            if offensivePlayer == "사용자" {
                offensivePlayer = "컴퓨터"
                startMukchiba()
            } else {
                startMukchiba()
            }
        }
    }
}
