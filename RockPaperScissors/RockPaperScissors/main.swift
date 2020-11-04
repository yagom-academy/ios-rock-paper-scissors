//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func rockPaperScissors() {
    print("가위(1),바위(2),보(3)! <종료 : 0> : ", terminator : "")
    guard let usersPick = readLine() else { return }
//    유저에게 입력받은 usersPick이 String타입임을 확인
//    print(type(of: usersPick))
    switch usersPick {
    case "0" :
        print("가위바위보 프로그램이 종료됩니다.")
        break
    case "1" :
        print("사용자 : 가위")
    case "2" :
        print("사용자 : 바위")
    case "3" :
        print("사용자 : 보")
    default:
        print("잘못된 입력입니다. 다시 시도해 주세요.")
        rockPaperScissors()
    }
}

rockPaperScissors()
