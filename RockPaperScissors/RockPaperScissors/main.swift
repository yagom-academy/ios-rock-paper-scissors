//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RPS {
    
    enum Hand : Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    var usersHand = Hand.rock
    
    func userInput() -> Hand {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = Int(readLine() ?? "") , input >= 0 && input <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return userInput()
        }
        
        switch input {
        case 0 : return
        
        }
    }
}
