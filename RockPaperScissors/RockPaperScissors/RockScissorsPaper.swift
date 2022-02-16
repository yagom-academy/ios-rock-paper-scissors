//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by 김영훈 on 2022/02/16.
//

import Foundation

var isProgramExit = false

enum GameResult: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
}

enum RockScissorsPaperGameError: String {
    case wrongInput = "입력이 잘못되었습니다."
    case failCreateRandomCard = "생성에 실패했습니다."
    case failConvert = "변환에 실패했습니다."
}

enum RockScissorsPaperGameView: String {
    case gameMenu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case gameEnd = "종료되었습니다."
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
            print(RockScissorsPaperGameError.failCreateRandomCard.rawValue)
            return nil
        }
        return randomCard
    }
}

func startRockScissorsPaperGame(userInputValues: String?) {
    guard let computerCard = createComputerCard() else {
        print(RockScissorsPaperGameError.failCreateRandomCard.rawValue)
        return
    }
    guard let userCard: RockScissorsPaper = .convertUserCard(userInput: userInputValues) else {
        print(RockScissorsPaperGameError.failConvert.rawValue)
        return
    }
    compare(userCard: userCard, computerCard: computerCard)
}

func compare(userCard: RockScissorsPaper, computerCard: RockScissorsPaper) {
    if userCard == computerCard{
        print(GameResult.draw.rawValue)
    } else if userCard == computerCard.judgeWinAndLose() {
        print(GameResult.win.rawValue)
        print(RockScissorsPaperGameView.gameEnd.rawValue)
        isProgramExit = true
    } else{
        print(GameResult.lose.rawValue)
        print(RockScissorsPaperGameView.gameEnd.rawValue)
        isProgramExit = true
    }
}
    
func createComputerCard() -> RockScissorsPaper? {
    guard let computerCard: RockScissorsPaper = .createRandomCard() else {
        return nil
    }
    return computerCard
}
