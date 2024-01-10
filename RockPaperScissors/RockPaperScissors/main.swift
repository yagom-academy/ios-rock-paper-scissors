//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
struct errorCode {
    static let wrongInput = -1
}

enum Gesture: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

func computerPlay() -> Int {
    let computerSelect = Int.random(in: 1...3)
    
    return computerSelect
}

func userInput() -> Int {
    let inputList: Array<Int> = [0, 1, 2, 3]
    
    guard let input = readLine(), !input.isEmpty else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return errorCode.wrongInput
    }
    guard let inputInt = Int(input), inputList.contains(inputInt) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return errorCode.wrongInput
    }
    
    return inputInt
}

func rockScissorsPaper() {
    var repeatFlag: Bool = false
    
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let computerNumber = computerPlay()
        let userInput = userInput()

        guard executeGame(userInput: userInput) else {
            repeatFlag = false
            return
        }
        
        if userInput == errorCode.wrongInput {
            print("공백 들어오는지 체크")
            repeatFlag = true
            continue
        }
        
        guard let gesture = Gesture(rawValue: computerNumber) else {
            return
        }
        switch gesture {
        case .scissors:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.scissors, .paper])
        case .rock:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.paper, .scissors])
        case .paper:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.scissors, .rock])
        }
    } while repeatFlag
}

func executeGame(userInput: Int) -> Bool {
    if userInput == 0 {
        print("게임 종료")
        return false
    }
    return true
}

func gameResult(userInput: Int, gameCase: [Gesture]) -> Bool {
    let userGesture = Gesture(rawValue: userInput)
    let userWin = gameCase[0] == userGesture
    let userLose = gameCase[1] == userGesture
    
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
