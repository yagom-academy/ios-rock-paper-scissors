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
            isPlaying = makeResult(userChoice: userChoice)
        case "0":
            print("게임을 종료합니다.")
            return
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func makeResult(userChoice: String) -> Bool {
    let computerChoice: String = String(Int.random(in: 1...3))
    
    print(computerChoice)
    
    guard computerChoice != userChoice else {
        print("비겼습니다.")
        return true
    }
    
    if (computerChoice == "1" && userChoice == "3") ||
        (computerChoice == "2" && userChoice == "1") ||
        (computerChoice == "3" && userChoice == "2") {
        print("패배")
        return false
    }
    
    if (computerChoice == "3" && userChoice == "1") ||
        (computerChoice == "1" && userChoice == "2") ||
        (computerChoice == "2" && userChoice == "3") {
        print("승리")
        return false
    }
    
    return true
}

startGame()
