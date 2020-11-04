//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  2020.11.04 Green written

import Foundation

func rockPaperScissors () {
    print("가위(1), 바위(2), 보(3)!<종료 : 0> : ", terminator: " ")
    
    guard let hand: String = read.Line() else {return}
    
    switch hand {
    case "0":
        print("게임 종료")
        break
    case "1":
    
    case "2":
        
    case "3":
        
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        rockPaperScissors()
    }

}

