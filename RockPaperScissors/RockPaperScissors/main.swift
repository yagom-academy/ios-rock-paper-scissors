//
//  RockPaperScissors - main.swift
//  Created by Hisop, 쥬봉이
//  Copyright © yagom academy. All rights reserved.
// 

enum RoundResult: String {
    case userWin = "사용자"
    case computerWin = "컴퓨터"
    case draw
    case skip
    case invalidInput
}

enum Choice: String, CaseIterable {
    case rock
    case paper
    case scissors
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
    case .skip:
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
    case .skip:
        break
    }
    print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
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

@discardableResult
func startGame(isContinous: Bool) -> Bool {
    guard isContinous else {
        return false
    }

    guard let userChoice = readLine() else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startGame(isContinous: true)
    }
    
    switch userChoice {
    case "1", "2", "3":
        startGame(isContinous: true)
//        startGame(isContinous: decideVictory(userChoice: userChoice))
    case "0":
        print("게임 종료")
        break
    default:
        startGame(isContinous: true)
    }
    return false
}

startGame(isContinous: true)
