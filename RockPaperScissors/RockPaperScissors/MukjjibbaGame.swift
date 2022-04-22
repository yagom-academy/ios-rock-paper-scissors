import Darwin
class MukjjibbaGame: RockPaperScissorsGame {
    private let user: String = Player.user.selection
    private let computer: String = Player.computer.selection
    
    private var muk: String = Mukjjibba.muk.hand
    private var jji: String = Mukjjibba.jji.hand
    private var bba: String = Mukjjibba.bba.hand
    
    var currentTurn: String {
        switch gameResult {
        case win:
            return user
        case lose:
            return computer
        default:
            return ""
        }
    }
    
    override func startGame() {
        super.startGame()

        while true {
            print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
            inputUserNumber()
            selectRockPaperScissors()
            
            if userNumber == endGame {
                break
            }

            if isRockPaperScissorsRule(from: userNumber) {
                print("잘못된 입력입니다. 다시 시도해 주세요.")
                gameResult = lose
                continue
            }
            
            let mukjjibbaResult = isMukjjibbaRule(userInput: userNumber, randomNumber: computerNumber)
            
            print(userNumber, computerNumber)
            
            if mukjjibbaResult {
                print("\(currentTurn)의 승리!")
                print("게임 종료")
                break
            } else {
                print("\(currentTurn)의 턴입니다.")
            }
        }
    }
    
    func isMukjjibbaRule(userInput: String, randomNumber: String) -> Bool {
        if userInput == randomNumber {
           return true
        } else {
            getTurn(userInput, with: randomNumber)
            return false
        }
    }
    
    func getTurn(_ userInput: String, with randomNumber: String) {
        if userInput == bba && randomNumber == muk  {
            self.gameResult = win
        } else if userInput == muk  && randomNumber == bba  {
            self.gameResult = lose
        } else {
            if userInput == randomNumber {
                self.gameResult = draw
            } else if userInput > randomNumber {
                self.gameResult = lose
            } else {
                self.gameResult = win
            }
        }
    }
}
