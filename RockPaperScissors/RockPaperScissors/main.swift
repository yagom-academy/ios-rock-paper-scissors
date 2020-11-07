//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK:- 묵찌빠 함수
func mukChiBa(preemptiveAttacker: String, _ preemptiveAttackerInfo: String) {
    print("[\(preemptiveAttacker)의 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else { return }
    
    if let cardOfUser = Int(input), cardOfUser == 1 || cardOfUser == 2 || cardOfUser == 3 {
        let cardOfComputer: Int = Int.random(in: 1...3)
        if cardOfUser == cardOfComputer {
            print("\(preemptiveAttacker)의 승리!")
            return
        } else {
            if preemptiveAttackerInfo == "user" {
                print("컴퓨터의 턴입니다.")
                determineTheWinner(winner: "computer")
            } else {
                print("사용자의 턴입니다.")
                determineTheWinner(winner: "user")
            }
        }
    } else if let cardOfUser = Int(input), cardOfUser == 0 {
        return
    }  else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        determineTheWinner(winner: "computer")
    }
}

//MARK:- 승자 정보를 받는 함수
func determineTheWinner(winner: String) {
    if winner == "user" {
        mukChiBa(preemptiveAttacker: "사용자", winner)
    } else {
        mukChiBa(preemptiveAttacker: "컴퓨터", winner)
    }
}

//MARK:- 가위바위보 실행 함수
func rockPaperScissors() {
    let numberOfCasesToWin: [(Int, Int)] = [(1, 3), (2, 1), (3, 2)]
    let winnerIs: (user: String, computer: String) = ("user", "computer")
    
    while(true) {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine() else { continue }
        
        if let correctInput = Int(input), correctInput == 1 || correctInput == 2 || correctInput == 3 {
            let randomNumber: Int = Int.random(in: 1...3)
            if numberOfCasesToWin.contains(where: { $0 == (correctInput, randomNumber) }) {
                print("이겼습니다!")
                determineTheWinner(winner: winnerIs.user)
                break
            } else if correctInput == randomNumber {
                print("비겼습니다!")
            } else {
                print("졌습니다!")
                determineTheWinner(winner: winnerIs.computer)
                break
            }
        } else if let correctInput = Int(input), correctInput == 0 {
            break
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

// MARK:- 코드 최초 실행
rockPaperScissors()

