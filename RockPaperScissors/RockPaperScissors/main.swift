//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Game {
    var isPlaying = true
    func inputFromUser() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), let number = Int(input), (0...3).contains(number) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
        return number
    }
    
}

let game = Game()
print(game.inputFromUser())

