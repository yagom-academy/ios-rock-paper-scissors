//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum GameRestart: Error {
    case inputValue
    case beginAgain
}
enum UserSideGameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}
enum HandShape: Int {
    case initStatus = -1
    case end = 0, rock = 1, scissors = 2, paper = 3
}

struct Hand {
    static let rock = HandShape.rock.rawValue
    static let scissors = HandShape.scissors.rawValue
    static let paper = HandShape.paper.rawValue
    static let endGame = HandShape.end.rawValue
    static let initValue = HandShape.initStatus.rawValue
}
struct GameResult {
    static let win = UserSideGameResult.win.rawValue
    static let lose = UserSideGameResult.lose.rawValue
    static let draw = UserSideGameResult.draw.rawValue
}

class RockScissorsPaperGame {
    var userInput = HandShape.initStatus.rawValue
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
        var validedInputNumber = Hand.initValue
        let optionalInput = readLine()
        do {
            validedInputNumber = try isValidInput(userInput: optionalInput)
        } catch {
            throw GameRestart.inputValue
        }
        return validedInputNumber
    }
    func isValidInput(userInput validInput: String?) throws -> Int {
        var valiedNumber = HandShape.initStatus.rawValue
        do {
            valiedNumber = try checkedInput(inputOptionalString: validInput)
        } catch {
            throw GameRestart.inputValue
        }
        return valiedNumber
    }
    func checkedInput(inputOptionalString OptionalString: String?) throws -> Int {
        let validedNumbers = [Hand.endGame, Hand.rock, Hand.scissors, Hand.paper]
        guard let validString = OptionalString, let validNumber = Int(validString), validedNumbers.contains(validNumber) else {
            throw GameRestart.inputValue
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
}

// MARK: - RockScissorsPaperGame instance && Start point

RockScissorsPaperGame().startGame()
