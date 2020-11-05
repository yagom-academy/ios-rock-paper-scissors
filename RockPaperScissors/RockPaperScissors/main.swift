//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var numberOfCasesToWin: [(Int, Int)] = [(1, 3), (2, 1), (3, 2)]

while(true) {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else { continue }
    
    if input == "1" || input == "2" || input == "3" {
        let randomNumber: Int = Int.random(in: 1...3)
        if numberOfCasesToWin.contains(where: { $0 == (Int(input)!, randomNumber) }) {
            print("이겼습니다!")
            break
        } else if Int(input)! == randomNumber {
            print("비겼습니다!")
        } else {
            print("졌습니다!")
            break
        }
    } else if input == "0" {
        break
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}
