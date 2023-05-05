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
    
    var message: String {
        switch self {
            case .win:
                return "이겼습니다!"
            case .lose:
                return "졌습니다!"
            case .draw:
                return "비겼습니다!"
            case .invalid:
                return "잘못된 결과입니다."
        }
    }
}

enum Turn: String {
    case computer = "컴퓨터"
    case user = "사용자"
}

enum GameMode {
    case rockPaperScissors
    case mookJjiBba
}
