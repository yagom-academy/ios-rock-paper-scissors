//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func gawibawibo(user: String, computer: String) {
    guard let userNum = Int(user), let computerNum = Int(computer) else { return }
    
    if userNum > computerNum {
        print("이겼습니다!")
    } else if userNum < computerNum {
        print("졌습니다!")
    } else {
        print("비겼습니다!")
    }
}

var flag = true
while(flag) {
    guard let computerPick = ["1", "2", "3"].randomElement() else { break }
    
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    guard let userPick = readLine() else { break }
    
    switch userPick {
    case "0":
        flag = false
    case "1", "2", "3":
        gawibawibo(user: userPick, computer: computerPick)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}






