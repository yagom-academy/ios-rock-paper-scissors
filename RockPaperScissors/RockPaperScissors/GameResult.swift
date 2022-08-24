enum GameResult {
    case win
    case lose
    case draw
    
    static func judgeUserGameResultIn(_ userRPS: RPS, _ computerRPS: RPS ) -> GameResult {
        switch (userRPS, computerRPS) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            return .lose
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            return .draw
        }
    }
}
