//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Player {
    case computer
    case user
}

enum Hand {
    case 찌
    case 묵
    case 빠
    case 그만
    case none
    
    init(userInput: String) {
        switch userInput {
        case "0":
            self = .그만
        case "1":
            self = .찌
        case "2":
            self = .묵
        case "3":
            self = .빠
        default:
            self = .none
        }
    }
}

func runRockPaperScissors() {
    printGameNotice()
    
    let computersHand: Hand = determinedComputersHand()
    var (usersHand, validationResult) = receiveUsersHand()
    
    while validationResult == false {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        printGameNotice()
        (usersHand, validationResult) = receiveUsersHand()
    }
    
    if usersHand == .그만 {
        print("게임 종료")
        return
    } else {
        let winner: Player? = winnerDeterminedBetween(computersHand, and: usersHand)
        printOrRestart(winner: winner)
    }
}

func printGameNotice() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
}

func determinedComputersHand() -> Hand {
    let randomNumber: Int = Int.random(in: 1...3)
    
    switch randomNumber {
    case 1:
        return .찌
    case 2:
        return .묵
    case 3:
        return .빠
    default:
        return .그만
    }
}

func receiveUsersHand() -> (Hand, Bool) {
    guard let userInput = readLine() else {
        return (.none, false)
    }
    
    let validationResult = verify(userInput: userInput)
    let usersHand = Hand(userInput: userInput)
    
    return (usersHand, validationResult)
}

func convertToInteger(from userInput: String) -> Int? {
    return Int(userInput)
}

func verify(userInput: String) -> Bool {
    guard let integerUserInput = convertToInteger(from: userInput) else {
        return false
    }
    
    if integerUserInput >= 0 && integerUserInput <= 3 {
        return true
    } else {
        return false
    }
}

func winnerDeterminedBetween(_ computersHand: Hand, and usersHand: Hand) -> Player? {
    if computersHand == usersHand {
        return nil
    }
    
    switch (computersHand, usersHand) {
    case (.묵, .찌):
        return Player.computer
    case (.묵, .빠):
        return Player.user
    case (.찌, .묵):
        return Player.user
    case (.찌, .빠):
        return Player.computer
    case (.빠, .묵):
        return Player.computer
    case (.빠, .찌):
        return Player.user
    default:
        return nil
    }
}

func printOrRestart(winner: Player?) {
    if winner == Player.computer {
        print("""
            졌습니다!
            게임 종료
            """)
    } else if winner == Player.user {
        print("""
            이겼습니다!
            게임 종료
            """)
    } else {
        print("비겼습니다!")
        runRockPaperScissors()
    }
}

runRockPaperScissors()


