//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

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
        return .Scissor
    } else if number == 2 {
        return .Rock
    }
    
    return .Paper
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
    
    guard let userInput = readLine() else {
        print("잘못된 입력입니다. 프로그램을 종료합니다.")
        return
    }
    
    switch userInput {
    case "0":
        print("게임 종료")
        return
    case "1", "2", "3":
        break
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playRockPaperScissor()
    }
    
    guard let userNumber = Int(userInput) else {
        return
    }
    let computerNumber = Int.random(in: 1...3)
    
    let userHand = convertNumberToHand(number: userNumber)
    let computerHand = convertNumberToHand(number: computerNumber)
    
    switch calculateGameResult(userHand: userHand, computerHand: computerHand) {
    case .Win:
        print("이겼습니다!")
    case .Draw:
        print("비겼습니다!")
        return playRockPaperScissor()
    case .Lose:
        print("졌습니다!")
    }
}

playRockPaperScissor()
