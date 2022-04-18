//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 변재은 on 2022/04/18.
//

import Foundation

final class Game {
    var randomNumber: Int?
    
    func run() {
        let selectionList: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        
        let result = selectionList.inputValue()
        if result == "1" || result == "2" || result == "3" {
            create()
            print("computer = \(randomNumber)")
        } else {
            print("게임 종료")
        }
        print(result)
    }
    func create() {
        randomNumber = Int.random(in: 1...3)
    }
}

