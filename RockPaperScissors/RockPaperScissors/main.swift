//
//  RockPaperScissors - main.swift
//  Created by Hisop, 쥬봉이
//  Copyright © yagom academy. All rights reserved.
// 

enum PrintOptions {
    case roundStart
    case roundWin
    case draw
    case gameWin
    case gameEnd
    case invalidInput
}

enum Winner: String {
    case user = "사용자"
    case computer = "컴퓨터"
    case none
}

enum RockPaperScissors: CaseIterable {
    case rock
    case paper
    case scissors
}

func playRockPaperScissorsGame() {
    displayRockPaperScissorsGame(printOption: .roundStart, winner: .none)
    
    let userInput = readLine()
    
    guard userInput != "0" else {
        displayRockPaperScissorsGame(printOption: .gameEnd, winner: .none)
        return
    }
    
    guard let userChoice = mappingUserChoice(userInput: userInput, round: 1) else {
        displayRockPaperScissorsGame(printOption: .invalidInput, winner: .none)
        playRockPaperScissorsGame()
        return
    }
    
    let winner = decideVictory(userChoice: userChoice)
    
    guard winner != .none else {
        displayRockPaperScissorsGame(printOption: .draw, winner: .none)
        playRockPaperScissorsGame()
        return
    }
    
    displayRockPaperScissorsGame(printOption: .roundWin, winner: winner)
    playMukchippaGame(winner: winner)
}

func displayRockPaperScissorsGame(printOption: PrintOptions, winner: Winner) {
    switch printOption {
    case .roundStart:
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        return
    case .roundWin:
        if winner == .user {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
    case .draw:
        print("비겼습니다!")
    case .invalidInput:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    case .gameEnd:
        print("게임 종료")
    default:
        break
    }
}

func playMukchippaGame(winner: Winner) {
    displayMukchippaGame(printOption: .roundStart, winner: winner)
    
    let userInput = readLine()
    
    guard userInput != "0" else {
        displayMukchippaGame(printOption: .gameEnd, winner: .none)
        return
    }
    
    guard let userChoice = mappingUserChoice(userInput: userInput, round: 2) else {
        displayMukchippaGame(printOption: .invalidInput, winner: .none)
        playMukchippaGame(winner: .computer)
        return
    }
    
    let roundWinner = decideVictory(userChoice: userChoice)
    
    guard roundWinner != .none else {
        displayMukchippaGame(printOption: .gameWin, winner: winner)
        return
    }
    
    displayMukchippaGame(printOption: .roundWin, winner: roundWinner)
    playMukchippaGame(winner: roundWinner)
}

func displayMukchippaGame(printOption: PrintOptions, winner: Winner) {
    switch printOption {
    case .roundStart:
        print("[\(winner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    case .roundWin:
        print("\(winner.rawValue)의 턴입니다.")
    case .gameWin:
        print("\(winner.rawValue)의 승리!")
    case .invalidInput:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    case .gameEnd:
        print("게임 종료")
    default:
        break
    }
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

func decideVictory(userChoice: RockPaperScissors) -> Winner {
    let computerChoice = RockPaperScissors.allCases.randomElement()
    
    guard computerChoice != userChoice else {
        return .none
    }
    
    guard (computerChoice == .scissors && userChoice == .paper) ||
            (computerChoice == .rock && userChoice == .scissors) ||
            (computerChoice == .paper && userChoice == .rock) else {
        return .user
    }
    
    return .computer
}

playRockPaperScissorsGame()
