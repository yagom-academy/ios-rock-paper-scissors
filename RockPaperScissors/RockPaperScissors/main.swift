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
        
        discrimination(user: userNumber, computer: computerNumber)
    }
    
    func inputUser() -> Int {
        guard let inputValue = readLine(), let intValue = Int(inputValue) else {
            return -1
        }
        
        return intValue
    }
    
    func discrimination(user: Int, computer: Int) {
        switch user {
        case 0:
            print("게임 종료")
        case 1:
            if user == computer {
                print("비겼습니다!")
            } else if computer == 3 {
                print("이겼습니다!")
            } else {
                print("졌습니다!")
            }
        case 2:
            if user == computer {
                print("비겼습니다!")
            } else if computer == 1 {
                print("이겼습니다!")
            } else {
                print("졌습니다!")
            }
        case 3:
            if user == computer {
                print("비겼습니다!")
            } else if computer == 2 {
                print("이겼습니다!")
            } else {
                print("졌습니다!")
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

let rps = RockPaperScissors()
rps.startGame()
