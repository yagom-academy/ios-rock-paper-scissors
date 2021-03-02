//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RockPaperScissors {
    
    var keepRunning: Bool = true
    var userInputValue: ScissorsRockPaper?
    var computerInputValue: ScissorsRockPaper?
    var result: Result?
    
    // 컴퓨터 입력 값 랜덤 생성
    func computerRandomNumber() -> ScissorsRockPaper {
        let randomNumber = Int.random(in: 1...3)
        guard let computerResult: ScissorsRockPaper = ScissorsRockPaper(rawValue: randomNumber) else {
            return .rock
        }
        
        return computerResult
    }
    
    // 사용자 vs 컴퓨터 결과
    func userVsComputer(user: ScissorsRockPaper, computer: ScissorsRockPaper) {
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
    
    func startGamte() -> Bool {
        while true {
            print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator: "")
            computerInputValue = computerRandomNumber()
            
            guard let input = readLine() else {
                errorMessageAndRestart()
                continue
            }
            
            if input == "0" {
                print("게임 종료")
                keepRunning = false
                return true
            } else if input == "1" {
                userInputValue = .scissors
            } else if  input == "2" {
                userInputValue = .rock
            } else if input == "3" {
                userInputValue = .paper
            } else {
                errorMessageAndRestart()
                continue
            }

            userVsComputer(user: userInputValue!, computer: computerInputValue!)
            print(result!.rawValue)
            
            if result == .draw {
                startGamte()
            }
            
            return false
            
            }
        
        }
    
    // 사용자 입력 오류 출력 후 다시 시작
    func errorMessageAndRestart() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
}

let rockPaperSissors: RockPaperScissors = RockPaperScissors()
rockPaperSissors.startGamte()
