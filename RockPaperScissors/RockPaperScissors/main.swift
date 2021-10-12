//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
var computerNumber: Int = 0

func printGameStart() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return
    }
    if userInputNumber == 0 {
        return
    }
}

func generateRandomNumber() {
    var computerNumbers: [Int] = [1,2,3]
    computerNumbers.shuffle()
    
    computerNumber = computerNumbers[0]
}

generateRandomNumber()
