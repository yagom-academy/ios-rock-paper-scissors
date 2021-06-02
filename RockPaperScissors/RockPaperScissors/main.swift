//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func userInputNumber() -> Int {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        if let userInput = readLine(), let convertNumber = Int(userInput), (0...3).contains(convertNumber) {
            return convertNumber
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
    }
}

func makeRandomNumber() -> Int {
    return Int.random(in:1...3)
}

func rockPaperScissorsGame() -> Int {
    let userNumber = userInputNumber()
    let computerNumber = makeRandomNumber()
    
    if userNumber == 0 {
        return 0
    }
    
    // 승패판별
    // MARK: --- ver 1
    switch computerNumber - userNumber {
    case -1 , 2 :
        print(Result.win.rawValue)
    case -2 , 1 :
        print(Result.lose.rawValue)
    default :
        print(Result.draw.rawValue)
    }
    // 가위(1), 바위(2), 보(3)
    //      lose      win       draw
    // 1 -> -3 = -2 / -2 = -1 / -1 = 0
    // 2 -> -1 = 1  / -3 = -1 / -2 = 0
    // 3 -> -2 = 1  / -1 = 2  / -3 = 0
    
    // MARK: --- ver 2
    // let RockScissorsPaperGameTable: Array<Array<Result>> = [[.draw, .lose, .win],
    //                                                        [.win, .draw, .lose],
    //                                                        [.lose, .win, .draw]]
    // print(RockScissorsPaperGameTable[userNumber-1][computerNumber-1].rawValue)

    // 가위(1), 바위(2), 보(3)
    //       1 2 3
    // 1 ->  d l w  -> t[1-1][1-1] t[1-1][2-1] t[1-1][3-1]
    // 2 ->  w d l  -> t[2-1][1-1] t[2-1][2-1] t[2-1][3-1]
    // 3 ->  l w d  -> t[3-1][1-1] t[3-1][2-1] t[3-1][3-1]
    return 1
}

// Main
func console() {
    while true {
        if rockPaperScissorsGame() == 0 { break }
    }
    print("게임 종료")
}

console()
