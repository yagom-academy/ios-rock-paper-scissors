//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

while(true) {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else { continue }
    
    if input == "1" || input == "2" || input == "3" {
        print("가위바위보 프로세스")
    } else if input == "0" {
        break
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}
