//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
    
    let input: String? = readLine()
    guard let inputValue = input else {
        return
    }
    
    switch inputValue{
    case "1","2","3" :
        print("")
    case "0" :
        print("게임을 종료합니다.")
        return
    default :
        print("잘못입력하셨습니다.")
    }
}

startGame()
