//
//  RockPaperScissors - main.swift
//  Created by yy-ss99, Hemg.
//  Copyright © yagom academy. All rights reserved.
// 

func showGameMune() {
    var isGameOn: Bool = true
    let gameEnd: String = "0"
    
    while isGameOn {
        print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
        
        let menuChoice: String = readLine() ?? ""
        
        if menuChoice == gameEnd {
            isGameOn = false
            print("게임종료")
        } else if menuChoice == "1" || menuChoice == "2" || menuChoice == "3" {
            //checkRockPaperScissors
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}
