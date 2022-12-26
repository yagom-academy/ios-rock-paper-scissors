//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func choiceRockPaperScissors() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let rockPaperScissors = readLine(), rockPaperScissors != "" else {
        return
    }
}
