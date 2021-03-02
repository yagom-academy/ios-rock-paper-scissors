//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum ErrorStatus:Error {
    case inputError
}
class RockScissorsPaperGame {
    let initValue = -1
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let userInput = userTyping()
        let computerNumber = createRandomNumber()
        judgeRockScissorsPaper(userNumber: userInput, computerNumber: computerNumber)
    }
}

/// 메인 동작과 서브 동작을 구분하기 위해서 extension으로 확장
extension RockScissorsPaperGame {

    // MARK: - Computer Number
    
    func createRandomNumber() -> Int {
        let computerRandomNumber = Int.random(in: 1...3)
        return computerRandomNumber
    }
    
    // MARK: - User input valid check
    func userTyping() -> Int {
        let optionalInput = readLine()
        let validedInputNumber = isValidInput(userInput: optionalInput)
        return validedInputNumber
    }
    func isValidInput(userInput validInput: String?) -> Int {
        var valiedNumber = initValue
        do {
            valiedNumber = try checkedInput(inputOptionalString: validInput)
        } catch {
            printError()
            startGame()
        }
        return valiedNumber
    }
    func checkedInput(inputOptionalString OptionalString: String?) throws -> Int {
        let validedNumbers = [0, 1, 2, 3]
        guard let validString = OptionalString, let validNumber = Int(validString), validedNumbers.contains(validNumber) else {
            throw ErrorStatus.inputError
        }
        return validNumber
    }
    
    // MARK: - Game judge
    
    func judgeRockScissorsPaper(userNumber userState: Int, computerNumber computerState: Int) {
        let decisionStatus = userState - computerState
        let userWinStatus = [1, -2]
        let computerWinStatus = [-1, 2]
        dump(userState)
        if userState == 0 {
            finishGame()
        } else if decisionStatus == 0 {
            print("비겼습니다!")
            startGame()
        } else {
            if userWinStatus.contains(decisionStatus) {
                print("이겼습니다!")
            } else if computerWinStatus.contains(decisionStatus) {
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
