class MukjjibbaGame: RockPaperScissorsGame {

    var winner: String = ""
    
    enum turn: String {
        case player = "사용자"
        case computer = "컴퓨터"
    }
    
    init(winner: turn) {
        self.winner = winner.rawValue
    }
    
    override func startGame() {
        print(winner)
    }
}
