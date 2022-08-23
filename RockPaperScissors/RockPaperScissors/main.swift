//
//  RockPaperScissors - main.swift
//  Created by Baem, Dragon
//  Copyright © yagom academy. All rights reserved.
// 

func userInput() -> Int {
    while true {
        let userInput = readLine()
        
        if let userNumber = isCorrectUserInput(userInput) {
            return userNumber
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func isCorrectUserInput(_ userInput: String?) -> Int? {
    guard let userInput = userInput else { return nil }
    guard let userInput = Int(userInput) else { return nil }
    if userInput < 0 || userInput >= 4 {
        return nil
    }
    return userInput
}

func createComputerInput() -> Int {
    let computerInput = Int.random(in: 1...3)
    
    return computerInput
}

func compareUserWithComputer(_ user: Int, _ computer: Int) {
    switch (user, computer) {
    case (1, 2), (2, 3), (3, 1) :
        print("졌습니다!")
    case (1, 1), (2, 2), (3, 3) :
        print("비겼습니다!")
    default :
        print("이겼습니다!")
    }
}

func main() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    let userNumber = userInput()
    
    if userNumber == 0 {
        print("종료")
        return
    }
    
    let computerNumber = createComputerInput()
    compareUserWithComputer(userNumber, computerNumber)
}

main()
