//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printGameNotice() {
    print("가위(1), 바위(2), 보(3)!<종료 : 0>", terminator: " : ")
}

func determineComputersHand() -> Int {
    let computersHand = Int.random(in: 1...3)
    
    return computersHand
}

func receiveUsersHand() -> Int? {
    guard let usersHand = readLine() else {
        return nil
    }
        
    return Int(usersHand)
}

func verify(usersHand: Int?) -> Int {
    if let usersHand = usersHand, usersHand >= 0, usersHand <= 3 {
        return usersHand
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        printGameNotice()
        let newUsersHand = receiveUsersHand()
        return verify(usersHand: newUsersHand)
    }
}

func runRockPaperScissors() {
    printGameNotice()
    let computersHand = determineComputersHand()
    let userInput =  receiveUsersHand()
    let usersHand = verify(usersHand: userInput)
}
