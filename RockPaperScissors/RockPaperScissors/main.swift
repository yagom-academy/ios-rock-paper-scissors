//
//  RockPaperScissors - main.swift
//  Created by Baem, Dragon
//  Copyright © yagom academy. All rights reserved.
// 

func gameStart() -> Int? {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    let userInput = readLine()
    guard let userInput = userInput else { return nil }
    
    return Int(userInput)
}

func isCorrectUserInput(_ userInput:Int) -> Bool {
    if userInput < 0, userInput >= 4 {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return false
    }
    return true
}

func createComputerInput() -> Int {
    let computerInput = Int.random(in: 1...3)
    
    return computerInput
}

func compareUserWithComputer(_ user: Int, _ computer: Int) {
    if user == computer {
        print("비겼습니다!")
    } else if user == 1, computer == 2 {
        print("컴퓨터 승리")
    } else if user == 2, computer == 3 {
        print("컴퓨터 승리")
    } else if user == 3, computer == 1 {
        print("컴퓨터 승리")
    } else {
        print("유저 승리")
    }
}

func main() {
    if let userInput = gameStart() {
        if isCorrectUserInput(userInput) {
            let computerInput = createComputerInput()
            print(computerInput)
            compareUserWithComputer(userInput, computerInput)
        }
    }
}

main()
