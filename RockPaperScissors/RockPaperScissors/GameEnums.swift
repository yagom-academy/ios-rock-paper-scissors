enum Choice: Int {
    case end = 0
    case rock = 1
    case paper = 2
    case scissors = 3
}

enum Result {
    case win
    case lose
    case draw
    case invalid
}

enum Turn: String {
    case computer = "컴퓨터"
    case user = "사용자"
}

enum GameMode {
    case rockPaperScissors
    case mookJjiBba
}
