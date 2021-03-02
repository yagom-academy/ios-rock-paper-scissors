class RockPaperScissorsGame {
    enum Hand {
        case scissors
        case rock
        case paper
        case none
    }
    
    enum GameError: Error {
        case invalidInput
    }
    
    enum GameResult {
        case win
        case draw
        case lose
    }

    func gameStart() {}
    
    func makeRandomHand() -> Hand {
        let random = Int.random(in: 1...3)
        
        switch random {
        case 1:
            return Hand.scissors
        case 2:
            return Hand.rock
        case 3:
            return Hand.paper
        default:
            return Hand.none
        }
    }
    
    func getGameResult(_ usersHand: Hand, vs computersHand: Hand) -> GameResult { return .win }
        
    func getHandByUser() throws -> Hand { return .none }
}
