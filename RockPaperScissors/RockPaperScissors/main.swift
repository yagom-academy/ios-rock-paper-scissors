//
//  RockPaperScissors - main.swift
//  Created by Harry, Andrew. 
//  Copyright © yagom academy. All rights reserved.
// 

let rockScissorsPaperGameManager = RockScissorsPaperGameManager()
let mukJiPPaGameManager = MukJiPPaGameManager()

var gameFlow: GameFlow = .keepPlaying

while gameFlow == .keepPlaying {
    let result = rockScissorsPaperGameManager.startGame()
    
    gameFlow = result.gameFlow
        
    guard let whosTurn = result.whosTurn else {
        continue
    }
    
    // TODO: 묵지빠게임 시작
    print(whosTurn)
}
