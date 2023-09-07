//
//  RockPaperScissors - main.swift
//  Created by Hisop, 쥬봉이
//  Copyright © yagom academy. All rights reserved.
// 

enum RoundResult: String {
    case userWin = "사용자"
    case computerWin = "컴퓨터"
    case draw
    case invalidInput
    case gameStart
}

enum Choice: String, CaseIterable {
    case rock
    case paper
    case scissors
}

func playRoundOne(result: RoundResult) {
    guard result != .userWin, result != .computerWin else {
        var winner = result
        
        displayRoundOneResult(result: result)
        playRoundTwo(result: result, turn: &winner)
        return
    }
    
    displayRoundOneResult(result: result)
    
    let userInput = readLine()
    
    guard userInput != "0" else {
        print("게임 종료")
        return
    }
    
    guard let userChoice = mappingUserChoice(userInput: userInput, round: 1) else {
        playRoundOne(result: .invalidInput)
        return
    }
    
    playRoundOne(result: decideVictory(userChoice: userChoice))
}

func playRoundTwo(result: RoundResult, turn: inout RoundResult) {
    guard result != .draw else {
        displayRoundTwoResult(result: result, turn: turn)
        return
    }
    
    if result == .userWin || result == .computerWin {
        turn = result
    }
    
    displayRoundTwoResult(result: result, turn: turn)
        
    let userInput = readLine()
    
    guard userInput != "0" else {
        print("게임 종료")
        return
    }
    
    guard let userChoice = mappingUserChoice(userInput: userInput, round: 2) else {
        turn = .computerWin
        playRoundTwo(result: .invalidInput, turn: &turn)
        return
    }
    
    playRoundTwo(result: decideVictory(userChoice: userChoice), turn: &turn)
}

func mappingUserChoice(userInput: String?, round: Int) -> Choice?  {
    if round == 1 {
        switch userInput {
        case "1":
            return .scissors
        case "2":
            return .rock
        case "3":
            return .paper
        default:
            return nil
        }
    } else {
        switch userInput {
        case "1":
            return .rock
        case "2":
            return .scissors
        case "3":
            return .paper
        default:
            return nil
        }
    }
}

func decideVictory(userChoice: Choice) -> RoundResult {
    guard let computerChoice = Choice.allCases.randomElement() else {
        return .invalidInput
    }
    
    guard computerChoice != userChoice else {
        return .draw
    }
    
    guard (computerChoice == .scissors && userChoice == .paper) ||
            (computerChoice == .rock && userChoice == .scissors) ||
            (computerChoice == .paper && userChoice == .rock) else {
        return .userWin
    }
    
    return .computerWin
}

func displayRoundOneResult(result: RoundResult) {
    switch result {
    case .userWin:
        print("이겼습니다!")
        return
    case .computerWin:
        print("졌습니다!")
        return
    case .draw:
        print("비겼습니다!")
    case .invalidInput:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    case .gameStart:
        break
    }
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func displayRoundTwoResult(result: RoundResult, turn: RoundResult) {
    switch result {
    case .userWin, .computerWin:
        print("\(result.rawValue)의 턴입니다.")
    case .draw:
        print("\(turn.rawValue)의 승리!")
        return
    case .invalidInput:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    default :
        break
    }
    print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
}

playRoundOne(result: .gameStart)
