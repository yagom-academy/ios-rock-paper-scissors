//
//  Main.swift
//  RockPaperScissors
//
//  Created by 잼킹 on 2021/03/03.
//

import Foundation

enum ResultNumber: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

class RockPaperScissorsGame {
 
    var userInputNumber: ResultNumber = .paper
    
    // 게임 결과
    func gameResult(user: ResultNumber, computer: ResultNumber) {
        if user.rawValue == computer.rawValue {
            print("비겼습니다!")
            startGame()
        }
        
        switch user {
        case .scissors:
            if computer == .paper {
                print("이겼습니다!")
            } else if computer == .rock {
                print("졌습니다 ㅜㅜ")
            }
        case .rock:
            if computer == .scissors {
                print("이겼습니다!")
            } else if computer == .paper {
                print("졌습니다 ㅜㅜ")
            }
        case .paper:
            if computer == .rock {
                print("이겼습니다!")
            } else if computer == .scissors {
                print("졌습니다 ㅜㅜ")
            }
        }
        
    }
    
    // 0,1,2,3 입력이 아닐 때 오류 전달 및 다시 시작
    func errorMessage() {
        print("잘못된 입력입니다. 다시 시도해 주세요.")
        startGame()
    }
    
    func startGame() {
        print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator: "")
        let computerValue = Int.random(in: 1...3)
        
        guard let input = readLine() else { return }
           
        if input == "0" {
            print("게임 종료")
            return
        } else if input == "1" {
            userInputNumber = .scissors
        } else if input == "2" {
            userInputNumber = .rock
        } else if input == "3" {
            userInputNumber = .paper
        } else {
            errorMessage()
            return
        }
        
        gameResult(user: userInputNumber, computer: ResultNumber(rawValue: computerValue)!)
    }
        
}

let rockPaperSissorsGame = RockPaperScissorsGame()
rockPaperSissorsGame.startGame()
