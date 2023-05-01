//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 


var programRunning = true

while programRunning {
    if let input: String = readLine() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>")
        switch input {
        case "1":
            print("가위")
        case "2":
            print("바위")
        case "3":
            print("보")
        case "0":
            programRunning = false
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}
