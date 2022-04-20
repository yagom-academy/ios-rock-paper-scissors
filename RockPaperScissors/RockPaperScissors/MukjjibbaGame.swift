class MukjjibbaGame: RockPaperScissorsGame {
    var currentTurn: String = ""
    
    func checkTurn() {
        if gameResult == "이겼습니다." {
            self.currentTurn = "사용자"
        } else {
            self.currentTurn = "컴퓨터"
        }
    }
    
    func toggleTurn() {
        if currentTurn == "사용자" {
            currentTurn = "컴퓨터"
        } else {
            currentTurn = "사용자"
        }
    }
    
    func setMukjjibbaRule(userInput: String, randomNumber: String) {
        print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>")
        print(userInput, randomNumber)
        if userInput == randomNumber {
           print("\(currentTurn)의 승리!")
        } else {
            toggleTurn()
        }
    }
}
