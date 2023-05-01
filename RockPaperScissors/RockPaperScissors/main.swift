//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct RockPaperScissors {
    func startGame() {
        while true {
            let computerNumber = Int.random(in: 1...3)
            
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            
            guard let input = readLine(), let userNumber = Int(input), 0...3 ~= userNumber else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                
                continue
            }
            
            if userNumber == 0 {
                print("게임 종료")
                
                return
            }
            
            guard compare(to: userNumber, and: computerNumber) else {
                return
            }
        }
    }
    
    func compare(to user: Int, and computer: Int) -> Bool {
        if user == computer {
            print("비겼습니다!!")
            return true
        } else if isUserWin(user, computer) {
            print("이겼습니다!!")
        } else {
            print("졌습니다!!")
        }
        
        return false
    }
    
    func isUserWin(_ user: Int, _ computer: Int) -> Bool {
        return user == 1 && computer == 3
            || user == 2 && computer == 1
            || user == 3 && computer == 2
    }
}

let rps = RockPaperScissors()
rps.startGame()
