//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum GameRestart: Error {
    case inputValue
    case beginAgain
    case unknown
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
    static let userTurn = "User"
    static let computerTurn = "Computer"
    static let endGamePresent = "게임 종료"
}
struct WinLoseDrawOfUserAtRockScissorsPaper {
    static let userSelectWinRockScissors = 1
    static let userSelectWinScissors = -2
    static let userSelectLoseScissorsRock = -1
    static let userSelectLosePaper = 2
    static let userSelectDraw = 0
}

// MARK: - RockScissorsPaperGame Class

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
                let judgedGame = try judgeGames(userNumber: userInput, computerNumber: computerNumber)
                MukChiPaGame(mukChiPaTurn: judgedGame).startGame()
            } catch {
                print(GameResult.draw)
                continue
            }
            break
        }
    }
    
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
    
    func judgeGames(userNumber userState: Int, computerNumber computerState: Int) throws -> String {
        let decisionStatus = userState - computerState
        let userWinStatus = [WinLoseDrawOfUserAtRockScissorsPaper.userSelectWinRockScissors, WinLoseDrawOfUserAtRockScissorsPaper.userSelectWinScissors]
        let computerWinStatus = [WinLoseDrawOfUserAtRockScissorsPaper.userSelectLoseScissorsRock, WinLoseDrawOfUserAtRockScissorsPaper.userSelectLosePaper]
        let userComputerDraw = WinLoseDrawOfUserAtRockScissorsPaper.userSelectDraw
        if userState == GameConditions.endGame {
            return finishGame()
        } else if decisionStatus == userComputerDraw {
            throw GameRestart.beginAgain
        } else {
            if userWinStatus.contains(decisionStatus) {
                print(GameResult.win)
                return GameConditions.userTurn
            } else if computerWinStatus.contains(decisionStatus) {
                print(GameResult.lose)
                return GameConditions.computerTurn
            }
        }
        throw GameRestart.unknown
    }
    
    // MARK: - Error
    
    func printError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    func finishGame() -> String{
        return GameConditions.endGamePresent
    }
    
    // MARK: - RockScissorsPaper Print
    func gameMenuPresent() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
}

// MARK: - MukChiPaGame Class

class MukChiPaGame: RockScissorsPaperGame {
    var mukChiPaTurn: String = ""
    init(mukChiPaTurn: String) {
        self.mukChiPaTurn = mukChiPaTurn
    }
    
    override func startGame() {
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
                let judgeString = try judgeGames(userNumber: userInput, computerNumber: computerNumber)
                guard judgeString != GameConditions.endGamePresent else {
                    print(judgeString)
                    break
                }
                print("\(mukChiPaTurn)의 승리!")
            } catch {
                turnCheckPresent()
                continue
            }
            break
        }
    }
    
    // MARK: - Game judge
    
    override func judgeGames(userNumber userState: Int, computerNumber computerState: Int) throws -> String {
        let decisionStatus = userState - computerState
        let userWinStatus = [WinLoseDrawOfUserAtRockScissorsPaper.userSelectWinRockScissors, WinLoseDrawOfUserAtRockScissorsPaper.userSelectWinScissors]
        let computerWinStatus = [WinLoseDrawOfUserAtRockScissorsPaper.userSelectLoseScissorsRock, WinLoseDrawOfUserAtRockScissorsPaper.userSelectLosePaper]
        let userComputerDraw = WinLoseDrawOfUserAtRockScissorsPaper.userSelectDraw
        if userState == GameConditions.endGame {
            return finishGame()
        } else if decisionStatus == userComputerDraw {
            return GameResult.win
        } else {
            if userWinStatus.contains(decisionStatus) {
                mukChiPaTurn = GameConditions.userTurn
                throw GameRestart.beginAgain
            } else if computerWinStatus.contains(decisionStatus) {
                mukChiPaTurn = GameConditions.computerTurn
                throw GameRestart.beginAgain
            }
        }
        throw GameRestart.unknown
    }
    
    // MARK: - MukChiPa Print
    
    override func gameMenuPresent() {
        print("[\(mukChiPaTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0>", terminator: " : ")
    }
    override func finishGame() -> String {
        return super.finishGame()
    }
    func turnCheckPresent() {
        print("\(mukChiPaTurn)의 턴입니다")
    }
    
}

// MARK: - RockScissorsPaperGame instance && Start point

RockScissorsPaperGame().startGame()
