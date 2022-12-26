//
//  RockPaperScissors - main.swift
//  Created by 혜모리, 무리 on 2022.12.26
//

func choiceNumber() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let userInput = readLine(), userInput != "" else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return choiceNumber()
    }

    guard let convertToInt = Int(userInput), convertToInt >= 0, convertToInt <= 3 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return choiceNumber()
    }
    
    return convertToInt
}

func createComputerNumber() -> Int {
    let computerNumber = Int.random(in: 1...3)
    
    return computerNumber
}

func playRockPaperScissors() {
    let compareNumbers: (Int, Int) = (createComputerNumber(), choiceNumber())
    
    switch compareNumbers {
    case (1, 1), (2, 2), (3, 3):
        print("비겼습니다!")
        playRockPaperScissors()
    case (1, 2), (2, 3), (3, 1):
        print("이겼습니다!")
    case (2, 1), (3, 2), (1, 3):
        print("졌습니다!")
    default:
        print("게임 종료")
    }
}

playRockPaperScissors()
