class MukjjibbaGame: RockPaperScissorsGame {
    private var muk: String = Mukjjibba.muk.theNumberOfCase
    private var jji: String = Mukjjibba.jji.theNumberOfCase
    private var bba: String = Mukjjibba.bba.theNumberOfCase
    private var endGame: String = Mukjjibba.end.theNumberOfCase
    
    var currentTurn: String {
        switch gameResult {
        case "이겼습니다.":
            return "사용자"
        case "졌습니다.":
            return "컴퓨터"
        default:
            return ""
        }
    }
    
    override func startGame() {
        super.startGame()

        while true {
            print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
            inputUserNumber()
            choiceRockPaperScissors()
            checkRockPaperScissorsRule(from: userNumber)
            
            if userNumber == endGame {
                break
            }

            if resultOfCheck {
                print("잘못된 입력입니다. 다시 시도해 주세요.")
                gameResult = "졌습니다."
                continue
            }
            
            let endGame = setMukjjibbaRule(userInput: userNumber, randomNumber: computerNumber)
            
            if endGame {
                print("\(currentTurn)의 승리!")
                print("게임 종료")
                break
            } else {
                print("\(currentTurn)의 턴입니다.")
            }
        }
    }
    
    func setMukjjibbaRule(userInput: String, randomNumber: String) -> Bool {
        if userInput == randomNumber {
           return true
        } else {
            getTurn(userInput, with: randomNumber)
            return false
        }
    }
    
    func getTurn(_ userInput: String, with randomNumber: String) {
        if userInput == bba && randomNumber == muk  {
            self.gameResult = "이겼습니다."
        } else if userInput == muk  && randomNumber == bba  {
            self.gameResult = "졌습니다."
        } else {
            if userInput == randomNumber {
                self.gameResult = "비겼습니다."
            } else if userInput > randomNumber {
                self.gameResult = "졌습니다."
            } else {
                self.gameResult = "이겼습니다."
            }
        }
    }
}
