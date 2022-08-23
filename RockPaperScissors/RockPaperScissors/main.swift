//
//  RockPaperScissors - main.swift
//  Created by Baem, Dragon
//  Copyright © yagom academy. All rights reserved.
// 

func userInput() -> Int { // 함수명 변경
    while true {
        let userInput = readLine()
        
        if let userNum = isCorrectUserInput(userInput) {
            return userNum
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func isCorrectUserInput(_ userInput: String?) -> Int? { // 컨벤션
    guard let userInput = userInput else { return nil }
    guard let userInput = Int(userInput) else { return nil }
    if userInput < 0 || userInput >= 4 { // 범위 설정 수정
        return nil
    }
    return userInput
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
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    if let userInput = userInput() {
        if isCorrectUserInput(userInput) {
            let computerInput = createComputerInput()
            print(computerInput)
            compareUserWithComputer(userInput, computerInput)
        }
    }
}
