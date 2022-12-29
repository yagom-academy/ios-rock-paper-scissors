//
//  RockPaperScissors - main.swift
//  Created by Harry, Andrew. 
//  Copyright © yagom academy. All rights reserved.
// 

let rockScissorsPaperGameManager = RockScissorsPaperGameManager()
let mukJiPPaGameManager = MukJiPPaGameManager()

var gameFlow: GameFlow = .keepPlaying

while gameFlow == .keepPlaying {
    let rockScissorsPaperResult = rockScissorsPaperGameManager.startGame()
    
    gameFlow = rockScissorsPaperResult.gameFlow
        
    guard let whosTurn = rockScissorsPaperResult.whosTurn else {
        continue
    }
    
    mukJiPPaGameManager.whosTurn = whosTurn
    
    while gameFlow ==  .keepPlaying {
        let mukJiPPaResult = mukJiPPaGameManager.startGame()
        gameFlow = mukJiPPaResult.gameFlow
        
        guard let winner = mukJiPPaResult.whosTurn else {
            continue
        }
        
        print("\(winner)의 승리!")
        break
    }
}
