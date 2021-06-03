class Mukchiba: Game {
    var currentWinner: Winner
    init(currentWinner: Winner) {
        self.currentWinner = currentWinner
    }
    
    override func showUserWinMessage() {
        print("사용자의 턴입니다")
    }
    
    override func showComputerWinMessage() {
        print("컴퓨터의 턴입니다")
    }
    
    override func showStartMessage() {
        print("[\(currentWinner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    override func judgeWinner(userChoice: Game.Choice) {
        guard let computerChoice = generateComputerChoice() else {
            return
        }
        if userChoice == computerChoice {
            print("\(currentWinner.rawValue)의 승리!")
            return
        } else {
            gameWinner = pickWinner(userChoice: userChoice, computerChoice: computerChoice)
            startGame()
        }
    }
    
    override func handleError() {
        showErrorMessage()
        
    }
}
