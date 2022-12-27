//
//  RockPaperScissors - ChoiceOfRockPaperScissors.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

func createComputerRockPaperScissors() -> Int {
    let computerNumber = Int.random(in: 1...3)
    
    return computerNumber
}

func choiceRockPaperScissors() -> Int? {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let userInput = readLine() else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return choiceRockPaperScissors()
    }

    return Int(userInput)
}

func checkRockPaperScissors(number: Int?) -> Int {
    guard let rockPaperScissorsNumber = number,
            rockPaperScissorsNumber >= 0,
            rockPaperScissorsNumber <= 3
    else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return checkRockPaperScissors(number: choiceRockPaperScissors())
    }

    return rockPaperScissorsNumber
}

func createUserRockPaperScissors() -> Int {
    let userRockPaperScissors = choiceRockPaperScissors()
    let userRockPaperScissorsNumber = checkRockPaperScissors(number: userRockPaperScissors)
    
    return userRockPaperScissorsNumber
}

func convertEnumType(_ rockPaperScissorsNumber: Int) -> RockPaperScissors? {
    return RockPaperScissors(rawValue: rockPaperScissorsNumber)
}
