import Foundation

enum GameResult {
    case win
    case lose
    case draw
}

enum RockPaperScissors: Int {
    case rock = 2
    case paper = 3
    case scissors = 1
}

enum GameStatus {
    case gameOver
    case gameIsNotOver
}
