//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let inputList: Array<Int> = [0, 1, 2, 3]

enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

func computerPlay() -> Int {
    let menuList = inputList[1...3]
    
    guard let computerSelect = menuList.randomElement() else {
        return -1
    }
    return computerSelect
}

func userInput() -> Int {
    guard let input = readLine(), !input.isEmpty else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return -1
    }
    guard let inputInt = Int(input), inputList.contains(inputInt) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return -1
    }
    
    return inputInt
}

func rockScissorsPaper() {
    var repeatFlag: Bool = false
    
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let computerNumber = computerPlay()
        let userInput = userInput()
        
        guard let rpsValue = RPS(rawValue: computerNumber) else {
            return
        }
        
        switch rpsValue {
        case .scissors:
            repeatFlag = gameResult(userInput: userInput, gameCase: [2, 3])
        case .rock:
            repeatFlag = gameResult(userInput: userInput, gameCase: [3, 1])
        case .paper:
            repeatFlag = gameResult(userInput: userInput, gameCase: [1, 2])
        }
    } while repeatFlag
}

func gameResult(userInput: Int, gameCase: Array<Int>) -> Bool {
    let userWin = gameCase[0] == userInput
    let userLose = gameCase[1] == userInput
    
    if userInput == 0 {
        print("게임 종료")
        return false
    }
    
    if userWin {
        print("이겼습니다!")
        return false
    } else if userLose {
        print("졌습니다!")
        return false
    } else {
        print("비겼습니다!")
        return true
    }
}

rockScissorsPaper()
