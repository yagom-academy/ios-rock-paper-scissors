//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func displayMenu() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    print(menuMessage, terminator: "")
}

func generateRockScissorsPaper() -> Int {
    return Int.random(in: 1...3)
}

func decideWinner() -> String {
    
}
