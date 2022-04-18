//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum RockPaperScissorsGame: Int {
    case inputError
    case terminate
    case scissor
    case rock
    case paper
    
    var number: Int {
        switch self {
        case .inputError:
            return -1
        case .terminate:
            return 0
        case .scissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
}

enum GameResult: Int {
    case draw
    case win
    case lose
    
    var result: Int {
        switch self {
        case .draw:
            return 1
        case .win:
            return 2
        case .lose:
            return 3
        }
    }
}

func printUserOption() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeComputerRandomNumber() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

func inputUserNumber() -> Int {
    printUserOption()
    var userInput: Int
    let inputNumber = readLine() ?? ""
    userInput = checkUserInputNumber(userInput: inputNumber)
    return userInput
}

func checkUserInputNumber(userInput: String) -> Int {
    var selectedNumber = RockPaperScissorsGame.inputError.number
    if let verifiedUserInput = Int(userInput) {
        switch verifiedUserInput {
        case RockPaperScissorsGame.terminate.number,
             RockPaperScissorsGame.scissor.number,
             RockPaperScissorsGame.rock.number,
             RockPaperScissorsGame.paper.number:
            selectedNumber = verifiedUserInput
        default:
            selectedNumber = RockPaperScissorsGame.inputError.number
        }
    }
    return selectedNumber
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func compareTwoNumbers (userInput: Int, computerInput: Int) -> Int {
    let winningNumberCases = [(RockPaperScissorsGame.scissor.number, RockPaperScissorsGame.paper.number),
                              (RockPaperScissorsGame.rock.number, RockPaperScissorsGame.scissor.number),
                              (RockPaperScissorsGame.paper.number, RockPaperScissorsGame.rock.number)]
    var matchResult = GameResult.draw.result
    let comparisonGroup = (userInput, computerInput)
    if userInput == computerInput {
        matchResult = GameResult.draw.result
    } else if winningNumberCases.contains(where: { $0 == comparisonGroup }) {
        matchResult = GameResult.win.result
    } else {
        matchResult = GameResult.lose.result
    }
    return matchResult
}

func printResult(matchResult: Int) {
    switch matchResult {
    case GameResult.win.result :
        print("이겼습니다!")
    case GameResult.lose.result :
        print("졌습니다!")
    default:
        print("비겼습니다!")
    }
}

func startGame() {
    let computerInput = makeComputerRandomNumber()
    while true {
        let userInput = inputUserNumber()
        if userInput == RockPaperScissorsGame.inputError.number {
            printErrorMessage()
            continue
        }
        if userInput == RockPaperScissorsGame.terminate.number {
            print("게임 종료")
            break
        }
        let extractedNumber = compareTwoNumbers(userInput: userInput, computerInput: computerInput)
        printResult(matchResult: extractedNumber)
        if extractedNumber == GameResult.win.result || extractedNumber == GameResult.lose.result {
            print("게임 종료")
            break
        }
    }
}

startGame()
