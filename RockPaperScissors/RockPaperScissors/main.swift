//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
class RockPaperScissors {
    var userValue: Int = 0
    var computerValue: Int = 0
    
    func makeRandomNumber() {
        let newRandomNumber: Int = Int.random(in: 1...3)
        computerValue = newRandomNumber
    }

}
