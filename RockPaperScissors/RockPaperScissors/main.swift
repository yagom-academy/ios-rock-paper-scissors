//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum ExceptionalInput {
    case wrongInput
    case closeInput
    
    var correspondingNumber: Int {
        switch self {
        case .wrongInput:
            return -1
        case .closeInput:
            return 0
        }
    }
}

enum RockPaperScissor: CaseIterable {
    case scissor
    case rock
    case paper
    
    var correspondingNumber: Int {
        switch self {
        case .scissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
}

enum GameResult: String {
    case draw
    case win
    case lose
    
    var result: String {
        switch self {
        case .draw:
            return "비겼습니다!"
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
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
    var selectedNumber = ExceptionalInput.wrongInput.correspondingNumber
    let rockPaperScissorCases = RockPaperScissor.allCases.map( {$0.correspondingNumber} )
    let closeInputCase = [ExceptionalInput.closeInput.correspondingNumber]
    let verifiedInputCases = rockPaperScissorCases + closeInputCase
    
    if let verifiedUserInput = Int(userInput) {
        switch verifiedUserInput {
        case _ where verifiedInputCases.contains(verifiedUserInput):
            selectedNumber = verifiedUserInput
        default:
            selectedNumber = ExceptionalInput.wrongInput.correspondingNumber
        }
    }
    return selectedNumber
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func compareTwoNumbers (userInput: Int, computerInput: Int) -> String {
    let winningNumberCases = [(RockPaperScissor.scissor.correspondingNumber, RockPaperScissor.paper.correspondingNumber),
                              (RockPaperScissor.rock.correspondingNumber, RockPaperScissor.scissor.correspondingNumber),
                              (RockPaperScissor.paper.correspondingNumber, RockPaperScissor.rock.correspondingNumber)]
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

func startGame() {
    let computerInput = makeComputerRandomNumber()
    while true {
        let userInput = inputUserNumber()
        if userInput == ExceptionalInput.wrongInput.correspondingNumber {
            printErrorMessage()
            continue
        }
        if userInput == ExceptionalInput.closeInput.correspondingNumber{
            print("게임 종료")
            break
        }
        let comparedResult = compareTwoNumbers(userInput: userInput, computerInput: computerInput)
        print(comparedResult)
        if comparedResult == GameResult.win.result || comparedResult == GameResult.lose.result {
            print("게임 종료")
            break
        }
    }
}

startGame()
