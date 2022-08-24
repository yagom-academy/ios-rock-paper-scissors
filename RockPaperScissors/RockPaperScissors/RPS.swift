enum RPS {
    case scissors, rock, paper
    
    static func convertRPS(from number: Int) -> RPS? {
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
    
    static func convertMJP(from number: Int) -> RPS? {
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
}
