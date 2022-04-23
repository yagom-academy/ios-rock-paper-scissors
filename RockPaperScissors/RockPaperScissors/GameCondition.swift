enum Player: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

extension Player {
    var selection: String {
        switch self {
        case .user:
            return Player.user.rawValue
        case .computer:
            return Player.computer.rawValue
        }
    }
}

enum GameCondition: String {
    case end = "0"
}

extension GameCondition {
    var functionSelection: String {
        switch self {
        case .end:
            return GameCondition.end.rawValue
        }
    }
}

enum GameResult: String {
    case draw = "비겼습니다."
    case win = "이겼습니다."
    case lose = "졌습니다."
}

extension GameResult{
    var result: String {
        switch self {
        case .draw:
            return GameResult.draw.rawValue
        case .win:
            return GameResult.win.rawValue
        case .lose:
            return GameResult.lose.rawValue
        }
    }
}

enum RockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

extension RockPaperScissors {
    var hand: String {
        switch self {
        case .scissors:
            return RockPaperScissors.scissors.rawValue
        case .rock:
            return RockPaperScissors.rock.rawValue
        case .paper:
            return RockPaperScissors.paper.rawValue
        }
    }
}

enum Mukjjibba: String {
    case muk = "1"
    case jji = "2"
    case bba = "3"
}

extension Mukjjibba {
    var hand: String {
        switch self {
        case .muk:
            return Mukjjibba.muk.rawValue
        case .jji:
            return Mukjjibba.jji.rawValue
        case .bba:
            return Mukjjibba.bba.rawValue
        }
    }
}
