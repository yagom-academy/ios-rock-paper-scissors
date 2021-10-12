//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum GameError: Error {
    case wrongInput
}

var computerNumber: Int = 0

func inputUserData() throws -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
        throw GameError.wrongInput
    }
    return userInputNumber
}

func generateRandomNumber() {
    var computerNumbers: [Int] = [1,2,3]
    computerNumbers.shuffle()
    computerNumber = computerNumbers[0]
}

func playGame(inputNumber: Int) {
    let matchedWinNumber: [Int:Int] = [1: 3, 2: 1, 3: 2]
    print("컴퓨터 번호 \(computerNumber) , 내 번호 \(inputNumber)")
    if matchedWinNumber[inputNumber] == computerNumber {
        print("이겼습니다!")
    } else if inputNumber != computerNumber {
        print("졌습니다!")
    }
}

func isDraw(inputNumber: Int) -> Bool {
    if inputNumber == computerNumber {
        return true
    }
    return false
}

func checkInputNumber(inputNumber: Int) throws {
    switch inputNumber {
    case 0 : print("게임 종료")
    case 1...3 : isDraw(inputNumber: inputNumber) ? print("비겼습니다!") : playGame(inputNumber: inputNumber)
    default : throw GameError.wrongInput
    }
}

func startGame() {
    var isReturn: Bool = false
    generateRandomNumber()
    do {
        let userInputNumber =  try inputUserData()
        try checkInputNumber(inputNumber: userInputNumber)
        
    } catch GameError.wrongInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        isReturn = true
    } catch {
        print(error)
        isReturn = true
    }
    
    if isReturn {
        startGame()
    }
}

startGame()
