//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct RockPaperScissors {
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let userNumber = inputUser()
        let computerNumber = Int.random(in: 1...3)
        print("computerNumber : \(computerNumber)")

        discrimination(user: userNumber, computer: computerNumber)
    }
    
    func inputUser() -> Int {
        guard let inputValue = readLine(), let intValue = Int(inputValue), 1...3 ~= intValue else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            
            return -1
        }
        
        return intValue
    }
    
    func discrimination(user: Int, computer: Int) {
        var userDefeat: Int
        var userWin: Int
        
        if user == computer {
            print("비겼습니다!")
        }
        
        if user == 3 {
            userDefeat = 1
        } else {
            userDefeat = user + 1
        }
        
        if user == 1 {
            userWin = 3
        } else {
            userWin = user - 1
        }
        
        if userDefeat == computer {
            print("졌습니다!")
        }
        
        if userWin == computer {
            print("이겼습니다!")
        }
    }
}

let rps = RockPaperScissors()
rps.startGame()
