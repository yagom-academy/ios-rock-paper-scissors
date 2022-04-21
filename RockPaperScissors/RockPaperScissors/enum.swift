enum ExceptionalInput {
    case wrongInput
    case closeInput
    
    var correspondingNumber: Int {
        switch self {
        case .wrongInput:
            return -1
        case .closeInput:
            return 0
        }
    }
}

enum RockPaperScissor: CaseIterable {
    case scissor
    case rock
    case paper
    
    var correspondingNumber: Int {
        switch self {
        case .scissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
    
    var correspodingMuckJjiPpaNumber: Int {
        switch self {
        case .rock:
            return 1
        case .scissor:
            return 2
        case .paper:
            return 3
        }
    }
}

enum winnigCases {
    case RockPaperScissorCase
    case MuckJjiPpaCase
    
    var numberCases: Array<(Int,Int)> {
        switch self {
        case .RockPaperScissorCase:
            return [(RockPaperScissor.scissor.correspondingNumber, RockPaperScissor.paper.correspondingNumber),
                    (RockPaperScissor.rock.correspondingNumber, RockPaperScissor.scissor.correspondingNumber),
                    (RockPaperScissor.paper.correspondingNumber, RockPaperScissor.rock.correspondingNumber)]
        case .MuckJjiPpaCase:
            return [(RockPaperScissor.rock.correspodingMuckJjiPpaNumber, RockPaperScissor.scissor.correspodingMuckJjiPpaNumber),
                    (RockPaperScissor.scissor.correspodingMuckJjiPpaNumber, RockPaperScissor.paper.correspodingMuckJjiPpaNumber),
                    (RockPaperScissor.paper.correspodingMuckJjiPpaNumber, RockPaperScissor.rock.correspodingMuckJjiPpaNumber)]
        }
    }
}

enum GameResult: String {
    case draw
    case win
    case lose
    
    var result: String {
        switch self {
        case .draw:
            return "비겼습니다!"
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        }
    }
}

