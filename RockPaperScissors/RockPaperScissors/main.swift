//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum RockPaperScissors: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

func startGame() {
    let computerNumber = Int.random(in: 1...3)
    let userNumber = inputUserNumber()

    if userNumber == 0 {
        print("게임 종료")
        
        return
    }
    
    let userHand = convertEnum(of: userNumber)
    let computerHand = convertEnum(of: computerNumber)
    
    compare(userHand, and: computerHand)
}

func inputUserNumber() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input = readLine(), let userNumber = Int(input), 0...3 ~= userNumber else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        
        startGame()
        
        return -1
    }
    
    return userNumber
}

func convertEnum(of number: Int) -> RockPaperScissors {
    switch number {
    case 1:
        return .scissors
    case 2:
        return .rock
    case 3:
        return .paper
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    return .paper
}

func compare(_ userHand: RockPaperScissors, and computerHand: RockPaperScissors) {
    if userHand == computerHand {
        print("비겼습니다!!")
        startGame()
    } else if isUserWin(userHand, computerHand) {
        print("이겼습니다!!")
    } else {
        print("졌습니다!!")
    }
}

func isUserWin(_ user: RockPaperScissors, _ computer: RockPaperScissors) -> Bool {
    return user == .scissors && computer == .paper
    || user == .rock && computer == .scissors
    || user == .paper && computer == .rock
}

startGame()
