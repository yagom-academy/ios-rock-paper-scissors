//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum ErrorStatus: Error {
    case inputError
    case beginAgain
}
enum Result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}
enum RockScissorsPaper: Int {
    case initStatus = -1
    case end, rock, scissors, paper
}

struct GameStatus {
    let rock = RockScissorsPaper.rock.rawValue
    let scissors = RockScissorsPaper.scissors.rawValue
    let paper = RockScissorsPaper.paper.rawValue
    let end = RockScissorsPaper.end.rawValue
    let initValue = RockScissorsPaper.initStatus.rawValue
}
struct GameResult {
    let win = Result.win.rawValue
    let lose = Result.lose.rawValue
    let draw = Result.draw.rawValue
}

class RockScissorsPaperGame {
    var gameStatus = GameStatus()
    var gameResult = GameResult()
    var userInput = RockScissorsPaper.initStatus.rawValue
    func startGame() {
        for _ in 0...Int.max {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            let computerNumber = createRandomNumber()
            do {
                userInput = try userTyping()
            } catch {
                printError()
                continue
            }
            do {
                try judgeRockScissorsPaper(userNumber: userInput, computerNumber: computerNumber)
            } catch {
                print(gameResult.draw)
                continue
            }
            break
        }
    }
}

/// 메인 동작과 서브 동작을 구분하기 위해서 extension으로 확장
extension RockScissorsPaperGame {

    // MARK: - Computer Number
    
    func createRandomNumber() -> Int {
        let rock1Scissors2Paper3 = 1...3
        let computerRandomNumber = Int.random(in: rock1Scissors2Paper3)
        return computerRandomNumber
    }
    
    // MARK: - User input valid check
    func userTyping() throws -> Int {
        var validedInputNumber = gameStatus.initValue
        let optionalInput = readLine()
        do {
            validedInputNumber = try isValidInput(userInput: optionalInput)
        } catch {
            throw ErrorStatus.inputError
        }
        return validedInputNumber
    }
    func isValidInput(userInput validInput: String?) throws -> Int {
        var valiedNumber = RockScissorsPaper.initStatus.rawValue
        do {
            valiedNumber = try checkedInput(inputOptionalString: validInput)
        } catch {
            throw ErrorStatus.inputError
        }
        return valiedNumber
    }
    func checkedInput(inputOptionalString OptionalString: String?) throws -> Int {
        let validedNumbers = [gameStatus.end, gameStatus.rock, gameStatus.scissors, gameStatus.paper]
        guard let validString = OptionalString, let validNumber = Int(validString), validedNumbers.contains(validNumber) else {
            throw ErrorStatus.inputError
        }
        return validNumber
    }
    
    // MARK: - Game judge
    
    func judgeRockScissorsPaper(userNumber userState: Int, computerNumber computerState: Int) throws {
        let decisionStatus = userState - computerState
        let userWinStatus = [1, -2]
        let computerWinStatus = [-1, 2]
        let userComputerDraw = 0
        if userState == userComputerDraw {
            finishGame()
        } else if decisionStatus == userComputerDraw {
            throw ErrorStatus.beginAgain
        } else {
            if userWinStatus.contains(decisionStatus) {
                print(gameResult.win)
            } else if computerWinStatus.contains(decisionStatus) {
                print(gameResult.lose)
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
