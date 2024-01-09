//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let menuList: Array<Int> = [0, 1, 2, 3]

enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

func computerPlay() -> Int {
    guard let computerSelect = menuList[1...3].randomElement() else {
        return -1
    }
    return computerSelect
}

func userPlay() -> Int {
    guard let input = readLine(), !input.isEmpty else {
        return -1
    }
    guard let inputInt = Int(input), menuList.contains(inputInt) else {
        
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return -1
    }
    return inputInt
}

func rockScissorsPaper() {
    var ticket: Bool = false
    
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
        let computerNumber = computerPlay()
        let userNumber = userPlay()
        guard let rpsValue = RPS(rawValue: computerNumber) else {
            return
        }
        
        switch rpsValue {
        case .scissors:
            ticket = winOrLose(userInput: userNumber, gameCase: [2, 3, 1])
        case .rock:
            ticket = winOrLose(userInput: userNumber, gameCase: [3, 1, 2])
        case .paper:
            ticket = winOrLose(userInput: userNumber, gameCase: [1, 2, 3])
        }
    } while ticket
    
}

func winOrLose(userInput: Int, gameCase: Array<Int>) -> Bool {
    if gameCase[0] == userInput {
        print("이겼습니다!")
        return false
    } else if gameCase[1] == userInput {
        print("졌습니다!")
        return false
    } else {
        print("비겼습니다!")
        return true
    }
}

rockScissorsPaper()
