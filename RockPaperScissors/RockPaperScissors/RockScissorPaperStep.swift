//
//  RockScissorPaperStep.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

enum ErrorCase: Error {
    case valueIsWorngFormat
    case valueIsOverRange
}

enum ResultMassage: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

struct StoreGameData {
    var computerHand: Int = 0
    let optionRange: ClosedRange = 1...3
    
    mutating func generateComputerHand() -> Int {
        computerHand = Int.random(in: optionRange)
        return computerHand
    }
    
    mutating func inputPlayerOption() throws -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
        guard let inputPlayerOption: String = readLine() else { throw ErrorCase.valueIsWorngFormat }
        let convertedPlayerOption: Int = try convertStringToInt(from: inputPlayerOption)
        let validPlayerOption = try checkValidOption(with: convertedPlayerOption)
        return validPlayerOption
    }
    
    mutating func convertStringToInt(from playerOption: String) throws -> Int {
        guard let inputPlayerOption: Int = Int(playerOption) else { throw ErrorCase.valueIsWorngFormat }
        return inputPlayerOption
    }
    
    mutating func checkValidOption(with playerOption: Int) throws -> Int {
        guard optionRange.contains(playerOption) else { throw ErrorCase.valueIsOverRange }
        return playerOption
    }
}

struct PlayRockScissorPaper {
    var gameData = StoreGameData()
    var playerHand: Int = 0
    let resultListWithRock: Array<ResultMassage> = [ResultMassage.win, ResultMassage.draw, ResultMassage.lose]
    let resultListWithScissor: Array<ResultMassage> = [ResultMassage.draw, ResultMassage.lose, ResultMassage.win]
    let resultListWithPaper: Array<ResultMassage> = [ResultMassage.lose, ResultMassage.win, ResultMassage.draw]
    
    mutating func playGame() throws {
        controlGame()
        let computerHand = gameData.generateComputerHand()
        let result = try vertifyWinner(playerHand, computerHand)
        
        if result == ResultMassage.draw {
            print(result.rawValue)
            try playGame()
        } else {
            print(result.rawValue)
        }
    }
    
    mutating func controlGame() {
        do {
            try playerHand = gameData.inputPlayerOption()
        } catch ErrorCase.valueIsWorngFormat {
            print("잘못된 입력 입니다. 다시 시도해 주세요.")
            controlGame()
        } catch ErrorCase.valueIsOverRange {
            print("잘못된 입력 입니다. 다시 시도해 주세요.")
            controlGame()
        } catch {}
    }
    
    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) throws -> ResultMassage {
        var result: ResultMassage
        
        switch playerHand {
        case 1:
            result = resultListWithScissor[computerHand-1]
        case 2:
            result = resultListWithRock[computerHand-1]
        case 3:
            result = resultListWithPaper[computerHand-1]
        default:
            throw ErrorCase.valueIsWorngFormat
        }
        return result
    }
}
