class MukjjibbaGame: RockPaperScissorsGame {
    var currentTurn: String = ""
    private var jji: String = Mukjjibba.jji.name2
    private var bba: String = Mukjjibba.bba.name2
    private var muk: String = Mukjjibba.muk.name2
    private var endGame: String = Mukjjibba.end.name2
    
    func checkTurn() {
        if gameResult == "이겼습니다." {
            self.currentTurn = "사용자"
        } else {
            self.currentTurn = "컴퓨터"
        }
    }
    
    func setMukjjibbaRule(userInput: String, randomNumber: String) -> Bool {
        if userInput == randomNumber {
           return true
        } else {
            compare2(userInput, with: randomNumber)
            checkTurn()
            return false
        }
    }
    
    func compare2(_ userInput: String, with randomNumber: String) {
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
    
    override func startGame() {
        super.startGame()
        checkTurn()
        
        while true {
            print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
            inputUserNumber()
            choiceRockPaperScissors()
            checkInput(from: userNumber)
            
            if userNumber == endGame {
                break
            }

            if resultOfCheck {
                print("잘못된 입력입니다. 다시 시도해 주세요.")
                self.currentTurn = "컴퓨터"
                continue
            }
            
            let endGame = setMukjjibbaRule(userInput: userNumber, randomNumber: randomNumber)
            
            if endGame {
                print("\(currentTurn)의 승리...!")
                break
            }
        }
    }
}
