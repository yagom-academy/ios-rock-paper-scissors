//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Message: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case gameOver = "게임 종료"
    case userWin = "이겼습니다!"
    case userLose = "졌습니다."
    case draw = "비겼습니다."
}

enum RockPaperScissors: Int {
    case scissors = 1
    case rock
    case paper
}

func playGame() {
    var isGameOn: Bool = true
    
    while isGameOn {
        print(Message.menu.rawValue, terminator: "")
        guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
            print(Message.wrongInput.rawValue)
            continue
        }
        
        guard let computerHand: RockPaperScissors = RockPaperScissors(rawValue: Int.random(in: 1...3)) else {
            return
        }
        
        guard let userHand: RockPaperScissors = RockPaperScissors(rawValue: inputNumber) else {
            print(Message.gameOver.rawValue)
            return
        }
        
        switch (userHand, computerHand) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            print(Message.userWin.rawValue)
            isGameOn = false
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            print(Message.userLose.rawValue)
            isGameOn = false
        default:
            print(Message.draw.rawValue)
            continue
        }
    }
}

playGame()
