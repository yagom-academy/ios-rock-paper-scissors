//
//  startMenu.swift
//  RockPaperScissors
//
//  Created by 김영훈 on 2022/02/16.
//

import Foundation

var computerRockScissorsPaper: ClosedRange<Int> = 1...3
var isProgramExit = false

enum RockScissorsPaperGameView: String {
    case gameMenu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
}

enum RockScissorsPaper: CaseIterable {
    case scissors
    case rock
    case paper
    
    func judgeWinAndLose() -> RockScissorsPaper {
        switch self {
        case .scissors:
            return .rock
        case .rock:
            return .paper
        case .paper:
            return .scissors
        }
    }
    
    static func convertUserCard(userInput: String?) -> RockScissorsPaper? {
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
    }
    
    static func createRandomCard() -> RockScissorsPaper? {
        guard let randomCard = RockScissorsPaper.allCases.randomElement() else {
            print("생성에 실패했습니다.")
            return nil
        }
        return randomCard
    }
}

func startRockScissorsPaperGame(userInputValues: String?) {
    guard let computerCard = creatComputerCard() else {
        print("생성에 실패했습니다.")
        return
    }
    guard let userCard: RockScissorsPaper = .convertUserCard(userInput: userInputValues) else {
        print("변환에 실패했습니다.")
        return
    }
    compare(userCard: userCard, computerCard: computerCard)
}

func compare(userCard: RockScissorsPaper, computerCard: RockScissorsPaper) {
    if userCard == computerCard{
        print("비겼습니다.")
    } else if userCard == computerCard.judgeWinAndLose() {
        print("이겼습니다!")
        print("종료되었습니다.")
        isProgramExit = true
    } else{
        print("졌습니다!")
        print("종료되었습니다.")
        isProgramExit = true
    }
}
    
func creatComputerCard() -> RockScissorsPaper? {
    guard let computerCard: RockScissorsPaper = .createRandomCard() else {
        return nil
    }
    return computerCard
}

func printMenu() {
    while isProgramExit == false {
        print(RockScissorsPaperGameView.gameMenu.rawValue, terminator: "")
        let userInput = readLine()
        switch userInput {
        case "1","2","3":
            startRockScissorsPaperGame(userInputValues: userInput)
        case "0":
            print("종료되었습니다.")
            isProgramExit = true
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

