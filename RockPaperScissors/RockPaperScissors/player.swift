struct Player {
    private(set) var playerName: String
    private(set) var MuckJjiPpaTurn = false
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    mutating func MuckJjiPpaTurnChange() {
        if self.MuckJjiPpaTurn {
            self.MuckJjiPpaTurn = false
        } else {
            self.MuckJjiPpaTurn = true
        }
    }
}

func doTurnChange() {
    computer.MuckJjiPpaTurnChange()
    user.MuckJjiPpaTurnChange()
}
