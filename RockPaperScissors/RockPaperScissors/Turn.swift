struct Turn {
    var winner: String = ""
    
    mutating func inputWinner(winner: String) {
        self.winner = winner
    }
}

var turn = Turn()
