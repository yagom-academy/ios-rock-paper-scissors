//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var rockPaperScissors: RockPaperScissors = RockPaperScissors(isFirstGameStart: true, userNumber: 0, turnDictionary: [true: "사용자", false: "컴퓨터"], whoesTurn: "사용자")

try rockPaperScissors.startFirst()
