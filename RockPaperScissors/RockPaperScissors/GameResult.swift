//
//  RockPaperScissors - GameResult.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

enum GameResult {
    case win, draw, lose
    
    static func compareHandSigns(computers: HandSign, users: HandSign) -> GameResult {
        let computerUserNumber: (HandSign, HandSign) = (computers, users)
        
        switch computerUserNumber {
        case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
            return .draw
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
            return .win
        case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
            return .lose
        }
    }

}
