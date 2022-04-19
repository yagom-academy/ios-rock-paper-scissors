//
//  functions.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/18.
//

import Foundation

func selectMenuByInput() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func decideProcessBy(_ menuChoice: String) {
    switch menuChoice {
    case "0":
        print("게임 종료")
    case "1", "2", "3":
        let eachPick: (Rps, Rps) = playRPS(by: menuChoice)
        let gameResult = pickOutWinner(from: eachPick)
        printResult(basedOn: gameResult)
        
        restartIfTie(judgingBy: gameResult)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startRPS()
    }
}

func startRPS() {
    let userMenuChoice = selectMenuByInput()
    decideProcessBy(userMenuChoice)
}

func convertInputToRps(input: String) -> Rps {
    guard let pickNumber = Int(input) else { return Rps.ready }
    let myRpsPick:Rps = Rps(rawValue: pickNumber) ?? Rps.ready

    return myRpsPick
}

func playRPS(by menuChoice: String) -> (Rps, Rps) {
    let myRpsPick = convertInputToRps(input: menuChoice)
    guard let computerRpsPick = Rps(rawValue: Int.random(in: 1...3)) else { return (.ready, .ready) }
    
    return (myRpsPick, computerRpsPick)
}

func pickOutWinner(from pickOf: (user: Rps, computer: Rps)) -> GameWinner {
    if pickOf.computer == pickOf.user {
        return .tie
    }
    
    switch (pickOf.user, pickOf.computer) {
    case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
        return .usersVictory
    default:
        return .computersVictory
    }
}

func printResult(basedOn gameResult: GameWinner) {
    switch gameResult {
    case .usersVictory:
        print("이겼습니다!")
        print("게임 종료")
    case .computersVictory:
        print("졌습니다!")
        print("게임 종료")
    default:
        print("비겼습니다")
    }
}

func restartIfTie(judgingBy gameResult: GameWinner) {
    if gameResult == .tie {
        startRPS()
    }
}
