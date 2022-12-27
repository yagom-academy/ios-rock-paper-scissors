//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorsPaperError: Error {
    case invalidRockScissorsPaper
    case invalidMukjippa
}

enum RockScissorsPaperType: Int, CaseIterable {
    case rock = 1
    case scissors
    case paper
}

enum RockScissorsPaperScenario {
    case userWin
    case userLose
    case draw
}

var computerChoice: RockScissorsPaperType?

func createRandomRockScissorsPaper() -> RockScissorsPaperType? {
    let choice = RockScissorsPaperType(rawValue: Int.random(in: 1...3))
    guard let randomChoice = choice else {
        return nil
    }
    return randomChoice
}

func printRockScissorsPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

func choiceRockScissorsPaper() -> Result<RockScissorsPaperType?, RockScissorsPaperError> {
    let input: String? = readLine()
    guard let choice = input else {
        return .failure(RockScissorsPaperError.invalidRockScissorsPaper)
    }
    
    guard let userChoice = Int(choice), (0...3) ~= userChoice else {
        return .failure(RockScissorsPaperError.invalidRockScissorsPaper)
    }
    return .success(RockScissorsPaperType(rawValue: userChoice))
}

func compare(_ userChoice: RockScissorsPaperType?, with computerChoice: RockScissorsPaperType?) -> RockScissorsPaperScenario {
    if userChoice == computerChoice {
        return .draw
    }
    return isUserWin(userChoice, with: computerChoice) ? .userWin : .userLose
}

func isUserWin(_ userChoice: RockScissorsPaperType?, with computerChoice: RockScissorsPaperType?) -> Bool {
    if (userChoice == .rock && computerChoice == .scissors) ||
        (userChoice == .paper && computerChoice == .rock) ||
        (userChoice == .scissors && computerChoice == .paper) {
        return true
    }
    return false
}

