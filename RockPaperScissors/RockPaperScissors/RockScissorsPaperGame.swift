//
//  step1.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

import Foundation

enum RockScissorsPaper: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum MukChiBba: Int {
    case muk = 1
    case chi = 2
    case bba = 3
}

func filterUserInput() -> Int? {
    if let input = readLine(),
       let userNumber = Int(input.replacingOccurrences(of: " ", with: "")),
       0...3 ~= userNumber {
        return userNumber
    }
    print("잘못된 입력입니다. 다시 시도해주세요.")
    return nil
}

func readyRockScissorsPaperGame() {
    var exitGame: Bool = false

    while exitGame == false {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")

        guard let userNumber = filterUserInput() else { continue }
        exitGame = startRockScissorsPaperGame(and : userNumber)
    }
}

func startRockScissorsPaperGame(and userChoice: Int) -> Bool {
    let selectMenu = userChoice
    let computerPick = RockScissorsPaper.allCases.randomElement()
    let userPick = RockScissorsPaper(rawValue: userChoice)
    let compareTwoThings = (computerPick, userPick)
    
    if selectMenu == 0 {
        print("게임 종료")
        return true
    } else if computerPick == userPick {
        print("비겼습니다!")
        return false
    }
    
    switch compareTwoThings {
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        print("이겼습니다!")
        readyMukChiBbaGame(takeUserWin: true)
        return true
    default:
        print("졌습니다!")
        readyMukChiBbaGame(takeUserWin: false)
        return true
    }
}
