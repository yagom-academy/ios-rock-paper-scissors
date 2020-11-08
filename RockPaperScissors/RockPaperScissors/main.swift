
import Foundation

enum GameTurn {
    case user
    case computer
}

enum GameResult {
    case win
    case draw
    case lose
}

enum Hand {
    case scissors
    case rock
    case paper
    
    /// 가위바위보
    static func scissorsRockPaper(number: Int) -> Hand? {
        switch number {
        case 1:
            return .scissors
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            return nil
        }
    }
    
    /// 묵찌빠
    static func rockScissorsPaper(number: Int) -> Hand? {
        switch number {
        case 1:
            return .rock
        case 2:
            return .scissors
        case 3:
            return .paper
        default:
            return nil
        }
    }
    
    func decideScissorsRockPaperResult(otherHand: Hand) -> GameResult {
        switch self {
        case .scissors:
            return (otherHand == .paper) ? .win : .lose
        case .rock:
            return (otherHand == .scissors) ? .win : .lose
        case .paper:
            return (otherHand == .rock) ? .win : .lose
        }
    }
}

let scissorsRockPaper = ScissorsRockPaper()



while true {
    scissorsRockPaper.progress()
    
    if scissorsRockPaper.gameStatus == .endGame{
        break
    }
}
