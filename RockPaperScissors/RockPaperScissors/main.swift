//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func run() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    let userInput = readLine()
    let computerChoice = Int.random(in: 1...3)
    
    if let safeUserInput = userInput {
        switch safeUserInput {
        case "1", "2", "3":
            print("컴퓨터 : \(computerChoice)")
            
            if safeUserInput == String(computerChoice) {
                print("비겼습니다!")
            } else if (safeUserInput == "1" && String(computerChoice) == "3") ||
                        (safeUserInput == "2" && String(computerChoice) == "1") ||
                        (safeUserInput == "3" && String(computerChoice) == "2") {
                print("이겼습니다!")
            } else {
                print("졌습니다.")
            }
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
