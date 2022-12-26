//  RockPaperScissors - main.swift
//  Created by vetto, songjun on 2022.12.26

func makeRandomComputerHand() -> Int {
    return Int.random(in: 1...3)
}

func inputUserHand() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    guard let userInput = readLine() else {
        print("sdf")
        return inputUserHand()
    }
    guard let userHand = Int(userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return inputUserHand()
    }
    return userHand
}

func compareHand(computerHand: Int, userHand: Int) -> String {
    let result: Int = userHand - computerHand
    let status: String
    
    if result == 0 {
        status = "비겼습니다!"
    } else if result == -2 || result == 1 {
        status = "이겼습니다!"
    } else {
        status = "졌습니다!"
    }
    
    return status
}

func startGame() {
    loop: while true {
        let userInput = inputUserHand()
        switch userInput {
        case 0:
            print("게임 종료")
            break loop
        case 1,2,3:
            print(compareHand(computerHand: makeRandomComputerHand(), userHand: userInput))
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

startGame()
