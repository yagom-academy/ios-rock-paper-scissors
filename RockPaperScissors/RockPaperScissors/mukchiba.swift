class Mukchiba: Game {
    var currentWinner: Winner
    init(currentWinner: Winner) {
        self.currentWinner = currentWinner
    }
    
    override func showStartMessage() {
        print("[\(currentWinner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
    }
}
