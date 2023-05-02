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
    while true {
        let computerNumber = Int.random(in: 1...3)
        
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = readLine(), let userNumber = Int(input), 0...3 ~= userNumber else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            
            continue
        }
        
        if userNumber == 0 {
            print("게임 종료")
            
            return
        }
        
        var userHand: RockPaperScissors
        var computerhand: RockPaperScissors
        
        switch userNumber {
        case 1:
            userHand = .scissors
        case 2:
            userHand = .rock
        case 3:
            userHand = .paper
        default:
            return
        }
        
        switch computerNumber {
        case 1:
            computerhand = .scissors
        case 2:
            computerhand = .rock
        case 3:
            computerhand = .paper
        default:
            return
        }
        
        guard compare(to: userHand, and: computerhand) else {
            return
        }
    }
}

func compare(to user: RockPaperScissors, and computer: RockPaperScissors) -> Bool {
    if user == computer {
        print("비겼습니다!!")
        return true
    } else if isUserWin(user, computer) {
        print("이겼습니다!!")
    } else {
        print("졌습니다!!")
    }
    
    return false
}

func isUserWin(_ user: RockPaperScissors, _ computer: RockPaperScissors) -> Bool {
    return user == .scissors && computer == .paper
    || user == .rock && computer == .scissors
    || user == .paper && computer == .rock
}

startGame()
