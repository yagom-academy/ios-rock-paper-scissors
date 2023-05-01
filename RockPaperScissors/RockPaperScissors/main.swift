//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct RockPaperScissors {
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    }
    
    func inputUser() -> Int {
        guard let inputValue = readLine(), let intValue = Int(inputValue) else {
            return
        }
        
        return intValue
    }
}
