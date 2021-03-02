//
//  Main.swift
//  RockPaperScissors
//
//  Created by 잼킹 on 2021/03/03.
//

import Foundation

class RockPaperScissorsGame {
    
    var userInputValue: ScissorsRockPaper?
    var result: Result?
    
    // 사용자 vs 컴퓨터 결과
    func gameResult(user: ScissorsRockPaper, computer: ScissorsRockPaper) {
        // 이겼을 때
        result = .win
        // 비겼을 때
        if user == computer {
            result = .draw
        }
        // 졌을 때
        switch user {
        case .paper:
            if computer == .scissors {
                result = .lose
            }
        case .scissors:
            if computer == .rock {
                result = .lose
            }
        case .rock:
            if computer == .paper {
                result = .lose
            }
            
        }
        return
        
    }
    
    func gameStart() {
        while true {
            print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator: "")
            let computerValue = Int.random(in: 1...3)
            
            guard let input = readLine() else {
                restartAfterErrorMessage()
                continue
            }
            
            if input == "0" {
                print("게임 종료")
                return
            } else if input == "1" {
                userInputValue = .scissors
            } else if  input == "2" {
                userInputValue = .rock
            } else if input == "3" {
                userInputValue = .paper
            } else {
                restartAfterErrorMessage()
                continue
            }
            gameResult(user: userInputValue!, computer: ScissorsRockPaper(rawValue: Int(computerValue))!)
            print(result!.rawValue)
            
        }
        
    }
    // 사용자 입력 오류 전달 후 다시 시작
    func restartAfterErrorMessage() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
}

let rockPaperSissors = RockPaperScissorsGame()
rockPaperSissors.gameStart()
