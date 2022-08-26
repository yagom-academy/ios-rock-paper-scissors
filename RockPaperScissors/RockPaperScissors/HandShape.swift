enum HandShape {
    case scissors, rock, paper
    
    static func convertHandShape(from number: Int, type: GameType) -> HandShape? {
        if type == .mjp {
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
        } else {
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
    }
}
