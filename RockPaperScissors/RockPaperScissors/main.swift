//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startGame() {
    var isPlaying: Bool = true
    
    while isPlaying {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userChoice = readLine() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        switch userChoice {
        case "1", "2", "3":
            break
        case "0":
            print("게임을 종료합니다.")
            return
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

startGame()
