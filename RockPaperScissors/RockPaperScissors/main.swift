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
    
    func makeRandomHand() -> Hand { return .none }
    
    func getGameResult(_ usersHand: Hand, vs computersHand: Hand) -> GameResult { return .win }
        
    func getHandByUser() throws -> Hand { return .none }
}
