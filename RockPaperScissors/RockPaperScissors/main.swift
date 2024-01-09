//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printRockPaperScissor() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func playRockPaperScissor() {
    printRockPaperScissor()
    
    guard let userHand = readLine() else {
        print("잘못된 입력입니다. 프로그램을 종료합니다.")
        return
    }
    
    switch userHand {
    case "0":
        print("프로그램을 종료합니다.")
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playRockPaperScissor()
    }
}

playRockPaperScissor()
