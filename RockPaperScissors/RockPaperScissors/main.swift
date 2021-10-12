//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum RockPaperScissors: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

var computerNumber: Int = 0

func inputUserData() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
        return -1
    }
    return userInputNumber
}

func generateRandomNumber() {
    var computerNumbers: [RockPaperScissors] = [.scissor,.rock,.paper]
    let randomIndex = 0
    
    computerNumbers.shuffle()
    computerNumber = computerNumbers[randomIndex].rawValue
}

func playGame(inputNumber: Int) {
    let matchedWinNumber: [Int:Int] = [RockPaperScissors.scissor.rawValue: RockPaperScissors.paper.rawValue,
                                       RockPaperScissors.rock.rawValue: RockPaperScissors.scissor.rawValue,
                                       RockPaperScissors.paper.rawValue: RockPaperScissors.rock.rawValue]
    
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
        print("잘못된 입력입니다. 다시 시도해주세요.")
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
