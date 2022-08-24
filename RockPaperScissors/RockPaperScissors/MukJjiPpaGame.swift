class MukJjiPpaGame: RockPaperScissorsGame {
    func startMJPGame() {
        super.startRPSGame()
        
        printMJPMenu()

    }
    
    func printMJPMenu() {
        print("[\(super.RPSWinner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
}
