//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
class RockScissorsPaperGame {
    func presentGameMemu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        startGame()
    }
    func startGame() {
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
                presentGameMemu()
            }
        } else {
            printError()
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
    
    func judgeRockScissorsPaper(userNumber userStatus: Int, computerNumber computerStatus: Int) {
        switch userStatus {
        case 0:
            print("게임 종료")
        case 1:
            switch computerStatus {
            case 1:
                print("비겼습니다!")
                presentGameMemu()
            case 2:
                print("졌습니다!")
            case 3:
                print("이겼습니다!")
            default:
                return
            }
        case 2:
            switch computerStatus {
            case 1:
                print("이겼습니다!")
            case 2:
                print("비겼습니다!")
                presentGameMemu()
            case 3:
                print("졌습니다!")
            default:
                return
            }
        case 3:
            switch computerStatus {
            case 1:
                print("졌습니다!")
            case 2:
                print("이겼습니다!")
            case 3:
                print("비겼습니다!")
                presentGameMemu()
            default:
                return
            }
        default:
            return
        }
    }
    
    // MARK: - Error
    
    func printError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

// MARK: - RockScissorsPaperGame instance && Start point

RockScissorsPaperGame().presentGameMemu()
