//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
class RockScissorsPaperGame {
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let userInput = isValidInput()
        let computerNumber = createComputerRandomNumber()
        judgeRockScissorsPaper(userNumber: userInput, computerNumber: computerNumber)
    }
}
extension RockScissorsPaperGame {

    // MARK: - Computer Number
    
    func createComputerRandomNumber() -> Int {
        let computerRandomNumber = Int.random(in: 1...3)
        return computerRandomNumber
    }
    
    // MARK: - User input valid check
    
    func isValidInput() -> Int {
        var inputNumbers: [Int] = []
        if let optionalInputNumber = readLine() {
            inputNumbers = optionalInputNumber.split(separator: " ").map { Int(String($0)) ?? -1 }
            if checkedInput(inputArrays: inputNumbers) == false {
                printError()
                startGame()
            }
        } else {
            printError()
            startGame()
        }
        return inputNumbers.first!
    }
    func checkedInput(inputArrays validArrays: [Int]) -> Bool {
        let validedNumbers = [0, 1, 2, 3]
        if validArrays.count != 1 {
            return false
        } else if validArrays.contains(-1) {
            return false
        } else if validedNumbers.contains(validArrays.first!) == false {
            return false
        } else {
            return true
        }
    }
    
    // MARK: - Game judge
    
    func judgeRockScissorsPaper(userNumber userState: Int, computerNumber computerState: Int) {
        let decisionStatus = userState - computerState
        if userState == 0 {
            finishGame()
        } else if decisionStatus == 0 {
            print("비겼습니다!")
            startGame()
        } else {
            if decisionStatus == 1 || decisionStatus == -2 {
                print("이겼습니다!")
            } else if decisionStatus == -1 || decisionStatus == 2 {
                print("졌습니다!")
            }
        }
    }
    
    // MARK: - Error
    
    func printError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    func finishGame() {
        print("게임 종료")
        return
    }
}

// MARK: - RockScissorsPaperGame instance && Start point

RockScissorsPaperGame().startGame()
