//
//  RockScissorPaperStep.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

enum ErrorCase: Error {
    case valueIsWorngFormat
}

enum ResultMassage: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

struct StoreGameData {
    var computerHand: Int = 0
    let optionRange = 1...3
    
    mutating func generateComputerHand() -> Int {
        computerHand = Int.random(in: optionRange)
        return computerHand
    }
    
    mutating func inputPlayerOption() throws -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
        guard let inputPlayerOption: String = readLine() else { throw ErrorCase.valueIsWorngFormat }
        let convertedPlayerOption: Int = try convertStringToInt(to: inputPlayerOption)
        return convertedPlayerOption
    }
    
    mutating func convertStringToInt(to playerOption: String) throws -> Int {
        guard let inputPlayerOption: Int = Int(playerOption) else { throw ErrorCase.valueIsWorngFormat }
        return inputPlayerOption
    }
}

struct PlayRockScissorPaper {
    var gameData = StoreGameData()
    var playerHand: Int = 0
    let outcomesForRock: Array<String> = [ResultMassage.win.rawValue, ResultMassage.draw.rawValue, ResultMassage.lose.rawValue]
    let outcomesForScissor: Array<String> = [ResultMassage.draw.rawValue, ResultMassage.lose.rawValue, ResultMassage.win.rawValue]
    let outcomesForPaper: Array<String> = [ResultMassage.lose.rawValue, ResultMassage.win.rawValue, ResultMassage.draw.rawValue]
    
    mutating func playGame() {
        controlGame()
        let computerHand = gameData.generateComputerHand()
        print(vertifyWinner(playerHand, computerHand))
    }
    
    mutating func controlGame() {
        do {
            try allocatePlayerOption(playerOption: gameData.inputPlayerOption())
        } catch ErrorCase.valueIsWorngFormat {
            print("잘못된 입력 입니다. 다시 시도해 주세요.")
        } catch { }
    }
    
    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> String {
        var result: String = ""
        print("test \(computerHand)")
        switch playerHand {
        case 1:
            result = outcomesForScissor[computerHand-1]
        case 2:
            result = outcomesForRock[computerHand-1]
        case 3:
            result = outcomesForPaper[computerHand-1]
        default:
            break
        }
        return result
    }
    
    mutating func allocatePlayerOption(playerOption: Int) throws {
        switch playerOption {
        case 1:
            playerHand = 1
        case 2:
            playerHand = 2
        case 3:
            playerHand = 3
        case 0:
            return
        default:
            throw ErrorCase.valueIsWorngFormat
        }
    }
}
