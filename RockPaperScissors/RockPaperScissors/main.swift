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

func runRockPaperScissors() {
    printGameNotice()
    let computersHand = determineComputersHand()
    let userInput =  receiveUserInput()
    let usersHand = verify(userInput: userInput)
    
    if usersHand == 0 {
        print("게임 종료")
        return
    }
    
    let winner: Player? = determineWinner(computersHand: computersHand, usersHand: usersHand)
    
    print(winner: winner)
}

func printGameNotice() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
}

func determineComputersHand() -> Int {
    let computersHand = Int.random(in: 1...3)
    
    return computersHand
}

func receiveUserInput() -> Int? {
    guard let userInput = readLine() else {
        return nil
    }
        
    return Int(userInput)
}

func verify(userInput: Int?) -> Int {
    if let usersHand = userInput,
       usersHand >= 0,
       usersHand <= 3 {
        return usersHand
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        printGameNotice()
        let newUserInput = receiveUserInput()
        return verify(userInput: newUserInput)
    }
}

func determineWinner(computersHand: Int, usersHand: Int) -> Player? {
    if computersHand == usersHand {
        return nil
    }
    
    switch (computersHand, usersHand) {
    case (1, 2):
        return Player.user
    case (1, 3):
        return Player.computer
    case (2, 1):
        return Player.computer
    case (2, 3):
        return Player.user
    case (3, 1):
        return Player.user
    case (3, 2):
        return Player.computer
    default:
        return nil
    }
}

func print(winner: Player?){
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


