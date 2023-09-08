//
//  RockPaperScissors - main.swift
//  Created by Hisop, 쥬봉이
//  Copyright © yagom academy. All rights reserved.
// 

enum GameProgress: String {
    case userWin = "사용자"
    case computerWin = "컴퓨터"
    case draw
    case invalidInput
    case gameStart
}

enum RockPaperScissors: String, CaseIterable {
    case rock
    case paper
    case scissors
}

func playRockPaperScissorsGame(progress: GameProgress) {
    guard progress != .userWin, progress != .computerWin else {
        var winner = progress
        
        displayResult(progress: progress)
        playMukchippaGame(progress: progress, turn: &winner)
        return
    }
    
    displayResult(progress: progress)
    
    let userInput = readLine()
    
    guard userInput != "0" else {
        print("게임 종료")
        return
    }
    
    guard let userChoice = mappingUserChoice(userInput: userInput, round: 1) else {
        playRockPaperScissorsGame(progress: .invalidInput)
        return
    }
    
    playRockPaperScissorsGame(progress: decideVictory(userChoice: userChoice))
}

func playMukchippaGame(progress: GameProgress, turn: inout GameProgress) {
    guard progress != .draw else {
        displayResult(progress: progress, turn: turn)
        return
    }
    
    if progress == .userWin || progress == .computerWin {
        turn = progress
    }
    
    displayResult(progress: progress, turn: turn)
        
    let userInput = readLine()
    
    guard userInput != "0" else {
        print("게임 종료")
        return
    }
    
    guard let userChoice = mappingUserChoice(userInput: userInput, round: 2) else {
        turn = .computerWin
        playMukchippaGame(progress: .invalidInput, turn: &turn)
        return
    }
    
    playMukchippaGame(progress: decideVictory(userChoice: userChoice), turn: &turn)
}

func mappingUserChoice(userInput: String?, round: Int) -> RockPaperScissors?  {
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

func decideVictory(userChoice: RockPaperScissors) -> GameProgress {
    guard let computerChoice = RockPaperScissors.allCases.randomElement() else {
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

func displayResult(progress: GameProgress) {
    switch progress {
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

func displayResult(progress: GameProgress, turn: GameProgress) {
    switch progress {
    case .userWin, .computerWin:
        print("\(progress.rawValue)의 턴입니다.")
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

playRockPaperScissorsGame(progress: .gameStart)
