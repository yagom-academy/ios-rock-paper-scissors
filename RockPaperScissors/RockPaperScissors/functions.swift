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
        let pickResult: (Rps, Rps) = playRPS(menuChoice: menuChoice)
        print(pickResult)
        print("winner = pickOutWinner() 함수 실행 예정")
        print("printGameResult() 함수 실행 예정")
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
    var myRpsPick: Rps
    switch input {
    case "1":
        myRpsPick = Rps(rawValue: 1) ?? Rps.ready
    case "2":
        myRpsPick = Rps(rawValue: 2) ?? Rps.ready
    case "3":
        myRpsPick = Rps(rawValue: 3) ?? Rps.ready
    default:
        return Rps.ready
    }
    return myRpsPick
}

func playRPS(menuChoice: String) -> (Rps, Rps) {
    let myRpsPick = convertInputToRps(input: menuChoice)
    guard let computerRpsPick = Rps(rawValue: Int.random(in: 1...3)) else { return (.ready, .ready) }
    
    return (myRpsPick, computerRpsPick)
}
