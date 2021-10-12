//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
var computerNumber: Int = 0

func inputUserData() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
        return -1
    }
    return userInputNumber
}

func generateRandomNumber() {
    var computerNumbers: [Int] = [1,2,3]
    let randomIndex = 0
    
    computerNumbers.shuffle()
    computerNumber = computerNumbers[randomIndex]
}

func playGame(inputNumber: Int) {
    let matchedWinNumber: [Int:Int] = [1: 3, 2: 1, 3: 2]
    
    if matchedWinNumber[inputNumber] == computerNumber {
        print("이겼습니다!")
    } else if inputNumber != computerNumber {
        print("졌습니다!")
    }
}

func isDraw(inputNumber: Int) -> Bool {
    if inputNumber == computerNumber {
        print("비겼습니다!")
        return true
    }
    return false
}

func isRestartGame(inputNumber: Int) -> Bool {
    var isRestart: Bool = false
    
    switch inputNumber {
    case 0 :
        print("게임 종료")
        isRestart = false
    case 1...3 : isDraw(inputNumber: inputNumber) ? isRestart = true : playGame(inputNumber: inputNumber)
    default :
        isRestart = true
    }
    return isRestart
}

func startGame() {
    var isRestart: Bool = false
    let userInputNumber =  inputUserData()

    generateRandomNumber()
    isRestart = isRestartGame(inputNumber: userInputNumber)
    
    if isRestart {
        startGame()
    }
}

startGame()
