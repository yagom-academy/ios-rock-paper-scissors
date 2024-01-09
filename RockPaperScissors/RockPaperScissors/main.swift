//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameResult {
    case Win
    case Draw
    case Lose
}

enum Hand {
    case Scissor
    case Rock
    case Paper
}

func convertNumberToHand(number: Int) -> Hand {
    if number == 1 {
        return Hand.Scissor
    } else if number == 2 {
        return Hand.Rock
    }
    
    return Hand.Paper
}

func calculateGameResult(userHand: Hand, computerHand: Hand) -> GameResult {
    switch (userHand, computerHand) {
    case (.Scissor, .Paper), (.Rock, .Scissor), (.Paper, .Rock):
        return .Win
    case (.Scissor, .Scissor), (.Rock, .Rock), (.Paper, .Paper):
        return .Draw
    default:
        return .Lose
    }
}

func playRockPaperScissor() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let userHand = readLine() else {
        print("잘못된 입력입니다. 프로그램을 종료합니다.")
        return
    }
    
    switch userHand {
    case "0":
        print("프로그램을 종료합니다.")
        return
    case "1"..."3":
        break
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playRockPaperScissor()
    }
    
    let computerNumber = String(Int.random(in: 1...3))
    
    if userHand == "1" && computerNumber == "3" || userHand == "2" && computerNumber == "1" || userHand == "3" && computerNumber == "2" {
        print("이겼습니다!")
    } else if userHand == "1" && computerNumber == "2" || userHand == "2" && computerNumber == "3" || userHand == "3" && computerNumber == "1" {
        print("졌습니다!")
    } else {
        print("비겼습니다!")
    }
}

playRockPaperScissor()
