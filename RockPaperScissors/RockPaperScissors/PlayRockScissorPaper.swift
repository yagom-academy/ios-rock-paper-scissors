//
//  PlayRockScissorPaper.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

enum MatchResult {
    case win
    case lose
    case draw
}

extension MatchResult {
    var printMessage: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다"
        case .draw:
            return "비겼습니다"
        }
    }
}

enum CaseOfOptions {
    case exit
    case scissor
    case rock
    case paper
    case error
}

extension CaseOfOptions {
    var optionNumber: Int {
        switch self {
        case .exit:
            return 0
        case .scissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        case .error:
            return 4
        }
    }
    var printMassage: String {
        switch self {
        case .exit:
            return "게임종료"
        case .error:
            return "잘못된 입력입니다. 다시 시도해 주세요."
        default:
            return ""
        }
    }
}

struct PlayRockScissorPaper {
    var gameData = StoreGameData()

    mutating func playGame() {
        gameData.generateComputerHand()
        gameData.inputPlayerOption()
        controlGame()
    }
    
    mutating func controlGame() {
        if gameData.optionRange.contains(gameData.playerHand.optionNumber) {
            afterAction()
        } else if gameData.playerHand == CaseOfOptions.exit {
            print(CaseOfOptions.exit.printMassage)
            return
        } else {
            print(CaseOfOptions.error.printMassage)
            playGame()
        }
    }
    
    mutating func afterAction() {
        let matchResult = vertifyWinner(gameData.playerHand.optionNumber, gameData.computerHand)
        print(matchResult.printMessage)
        
        switch matchResult {
        case .draw:
            playGame()
        case .win:
            return
        case .lose:
            return
        }
    }
    
    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> MatchResult {
        var result: MatchResult = .draw
        
        if playerHand == computerHand {
            result = .draw
        } else if playerHand - computerHand == 1 || playerHand - computerHand < 0 {
            result = .win
        } else {
            result = .lose
        }
        return result
    }
}
