//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

var userNumber: Int = 0
var computerNumber: Int

func setGame(_ computerNumber: Int) -> String {
    print("가위(\(RPS.scissors.rawValue)), 바위(\(RPS.rock.rawValue)), 보(\(RPS.paper.rawValue))! <종료 : 0>: ", terminator: "")
    
    guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
        return "입력된 값이 없습니다."
    }
    
    userNumber = Int(inputUserNumber) ?? 4
    
    if userNumber == 0 {
        return "게임 종료"
    }
    
    switch userNumber - computerNumber {
    case -1, 2:
        return "졌습니다!"
    case -2, 1:
        return "이겼습니다!"
    case 0:
        return "비겼습니다!"
    default:
        return "잘못된 입력입니다. 다시 시도해주세요."
    }
    return inputUserNumber
}



print(setGame(3))
