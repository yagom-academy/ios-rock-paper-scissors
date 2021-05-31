//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

print("Hello, World!")

class Dealer {
    
    var userHand = 0
    var comHand = 1
    
    func inputUserHand() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = readLine(), let value = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputUserHand()
        }
        guard value >= 0 && value <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputUserHand()
        }
        
        userHand = value
        
        if userHand == 0 {
            print("게임 종료")
            return
        } else {
            comHand = Int.random(in: 1...3)
            return judge()
        }
    }
    
    private func judge() {
        
        print("나의 패: ", terminator: "")
        whatsYourHand(userHand)
        print("컴퓨터의 패: ", terminator: "")
        whatsYourHand(comHand)
        
        switch comHand - userHand {
        case -1, 2:
            print("이겼습니다!")
        case 1, -2:
            print("졌습니다!")
        default:
            print("비겼습니다!")
        }
        
        return inputUserHand()
    }
    
    private func whatsYourHand(_ n: Int) {
        switch n {
        case 1:
            print("가위")
        case 2:
            print("바위")
        case 3:
            print("보")
        default:
            print("잘못된 입력")
        }
    }
}


let dealer = Dealer()
dealer.inputUserHand()
