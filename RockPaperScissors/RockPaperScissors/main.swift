//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum GameRestart: Error {
    case inputValue
    case beginAgain
}

struct Hand {
    static let rock = 1
    static let scissors = 2
    static let paper = 3
}
struct GameResult {
    static let win = "이겼습니다!"
    static let lose = "졌습니다!"
    static let draw = "비겼습니다!"
}
struct GameConditions {
    static let endGame = 0
    static let initValue = -1
    static let userSelectWinRockScissors = 1
    static let userSelectWinScissors = -2
    static let userSelectLoseScissorsRock = -1
    static let userSelectLosePaper = 2
    static let userSelectDraw = 0
}

class RockScissorsPaperGame {
    var userInput = GameConditions.initValue
    func startGame() {
        for _ in 0...Int.max {
            gameMenuPresent()
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
                print(GameResult.draw)
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
        var validedInputNumber = GameConditions.initValue
        let optionalInput = readLine()
        do {
            validedInputNumber = try isValidInput(needValidInput: optionalInput)
        } catch {
            throw GameRestart.inputValue
        }
        return validedInputNumber
    }
    func isValidInput(needValidInput userInput: String?) throws -> Int {
        var valiedNumber = GameConditions.initValue
        do {
            valiedNumber = try isCheckedInput(needCheckInput: userInput)
        } catch {
            throw GameRestart.inputValue
        }
        return valiedNumber
    }
    func isCheckedInput(needCheckInput userInput: String?) throws -> Int {
        let validNumbers = [GameConditions.endGame, Hand.rock, Hand.scissors, Hand.paper]
        guard let validString = userInput, let validedNumber = Int(validString), validNumbers.contains(validedNumber) else {
            throw GameRestart.inputValue
        }
        return validedNumber
    }
    
    // MARK: - Game judge
    
    func judgeRockScissorsPaper(userNumber userState: Int, computerNumber computerState: Int) throws {
        let decisionStatus = userState - computerState
        let userWinStatus = [GameConditions.userSelectWinRockScissors, GameConditions.userSelectWinScissors]
        let computerWinStatus = [GameConditions.userSelectLoseScissorsRock, GameConditions.userSelectLosePaper]
        let userComputerDraw = GameConditions.userSelectDraw
        if userState == userComputerDraw {
            finishGame()
        } else if decisionStatus == userComputerDraw {
            throw GameRestart.beginAgain
        } else {
            if userWinStatus.contains(decisionStatus) {
                print(GameResult.win)
            } else if computerWinStatus.contains(decisionStatus) {
                print(GameResult.lose)
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
    
    // MARK: - Present
    func gameMenuPresent() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
}

// MARK: - RockScissorsPaperGame instance && Start point

RockScissorsPaperGame().startGame()
