struct MukJjiPpaGame {
    var currentTurn: String = ""
    var RPSGame = RockPaperScissorsGame()
    
    mutating func startMJPGame() {
        RPSGame.startRPSGame()
        self.currentTurn = RPSGame.RPSWinner
        
        printMJPMenu()
    }
    
    func printMJPMenu() {
        print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
}
