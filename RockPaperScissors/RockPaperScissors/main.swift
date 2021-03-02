//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RockPaperScissors {
    enum Result: String {
        case win = "이겼습니다."
        case draw = "비겼습니다."
        case lose = "졌습니다."
    }
    
    enum ScissorsRockPaper: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
        case exception
    }
    
    var result: Result = .draw
    
    func userVsComputer(user: ScissorsRockPaper, computer: ScissorsRockPaper) {
        result = .win
        if user == computer {
            result = .draw
        }
        
        switch user {
        case .scissors:
            if computer == .rock {
                result = .lose
            }
        case .rock:
            if computer == .scissors {
                result = .win
            }
        case .paper:
            if computer == .paper {
                result = .draw
            }
        default:
            errorMessage()
        }
    }
    
    func startGamte() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        var user: ScissorsRockPaper = .exception
        
        guard let computer: ScissorsRockPaper = ScissorsRockPaper(rawValue: Int.random(in: 1...3)) else {
            startGamte()
            return
        }
        
        guard let input = readLine() else {
            startGamte()
            return
        }
        
        if input == "0" {
            print("게임 종료")
        }
        
        if let inputValue = Int(input) {
            if inputValue < 4 && inputValue > 0 {
                user = ScissorsRockPaper(rawValue: inputValue)!
            }
        } else {
            startGamte()
        }

        if result == .draw {
            startGamte()
        }
        
        userVsComputer(user: user, computer: computer)
        
    }
    
    func errorMessage() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGamte()
    }
    
}

let rockPaperSissors: RockPaperScissors = RockPaperScissors()
rockPaperSissors.startGamte()
