//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 가위(1), 바위(2), 보(3)
// return 값: 비긴경우 0, 사람이 이긴경우 1, 컴퓨터가 이긴경우 2
func rspWinnerChecker(_ player: Int) -> Int {
    let computer = Int.random(in: 1...3)
    
    // 비긴경우
    if player == computer { return 0 }
    // 사용자가 보 일때 판단
    if player == 3 {
        if computer == 2 { return 1 }
        else { return 2 }
    }
    // 그 외
    if (player - computer) == -1 { return 2 }
    return 1
}
