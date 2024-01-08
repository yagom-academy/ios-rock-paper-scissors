//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func run() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    let userInput = readLine()
    if let safeUserInput = userInput {
        switch userInput {
        case "1", "2", "3":
            print("실행결과")
        case "0":
            print("프린트 종료")
        default:
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
        }
    } else{
        print("잘못된 입력입니다. 다시 시도하여 주세요.")
    }
}

run()
