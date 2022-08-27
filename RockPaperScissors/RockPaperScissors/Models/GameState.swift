//
//  GameState.swift
//  Created by Wonbi, 미니
//

enum GameState {
    case userWin
    case computerWin
    case draw
    case error
    case exit
    
    var description: String {
        switch self {
        case .userWin:
            return GameMessage.win
            
        case .computerWin:
            return GameMessage.lose
            
        case .draw:
            return GameMessage.draw
            
        case .exit:
            return GameMessage.exit
            
        case .error:
            return GameMessage.error
        }
    }
}
