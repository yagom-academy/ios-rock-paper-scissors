struct MukJjiPpaGame {
    var currentTurn: String = ""
    var RPSGame = RockPaperScissorsGame()
    
    mutating func startMJPGame() {
        RPSGame.startRPSGame()
        self.currentTurn = RPSGame.RPSWinner
        
        while true {
            printMJPMenu()
            guard let userMJPNumber = RPSGame.fetchUserNumber() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                currentTurn = "컴퓨터"
                continue
            }
            
            if userMJPNumber == 0 {
                print("게임종료")
                break
            }
            
            let computerMJPNumber = Int.random(in: 1...3)
            
            guard let userMJP = RPS.convertRPS(from: userMJPNumber),
                  let computerMJP = RPS.convertRPS(from: computerMJPNumber) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
        }
    }
    
    func printMJPMenu() {
        print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
}
