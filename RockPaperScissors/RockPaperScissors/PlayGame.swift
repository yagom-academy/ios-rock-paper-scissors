//
//  MukZiBa.swift
//  RockPaperScissors
//
//  Created by Kyo,Aaron on 2022/08/24.
//

import Foundation

final class PlayGame: HandlingInput {
    func playRPS() -> Turn {
        let gameName = "RPS"
        var currentTurn: Turn
        
        while (true) {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            
            let userInput: String? = bringUserInput()
            var userHands: RockScissorsPaper?
            let computerHands = RockScissorsPaper(rawValue: generateComputerInput())
            
            if handlingInputError(input: userInput) == false {
                continue
            } else {
                userHands = RockScissorsPaper(rawValue: castingUserInput(input: userInput))
            }
            
            if userHands == RockScissorsPaper.none {
                print("게임 종료")
                currentTurn = .undecidedTurn
                return currentTurn
            }
            
            if decideDraw(userHands?.rawValue, computerHands?.rawValue) {
                print("비겼습니다!")
                continue
            }
            
            if decideWinLose(gameName, userHands?.rawValue, computerHands?.rawValue) {
                print("이겼습니다!")
                currentTurn = .userTurn
                return currentTurn
            } else {
                print("졌습니다!")
                currentTurn = .computerTurn
                return currentTurn
            }
        }
    }
    
    func playMZB() {
        var currentTurn = playRPS()
        let gameName = "MZB"
        if currentTurn == .undecidedTurn {
            return
        }
        
        while (true) {
            print("[\(currentTurn.rawValue)턴] 묵(1), 찌(2), 빠(3)!<종료: 0>: ", terminator: "")
            let userInput: String? = bringUserInput()
            var userHands: MukZiBa?
            let computerHands = MukZiBa(rawValue: generateComputerInput())
            
            if handlingInputError(input: userInput) == false {
                continue
            } else {
                userHands = MukZiBa(rawValue: castingUserInput(input: userInput))
            }
            
            if userHands == MukZiBa.none {
                print("게임 종료")
                return
            }
            
            if decideDraw(userHands?.rawValue, computerHands?.rawValue) {
                print("\(currentTurn.rawValue)의 승리!")
                break
            }
            
            if decideWinLose(gameName, userHands?.rawValue, computerHands?.rawValue) {
                currentTurn = .userTurn
            } else {
                currentTurn = .computerTurn
            }
            print("\(currentTurn.rawValue)의 턴입니다")
        }
    }
    
    func decideDraw(_ userHands: Int?, _ computerHands: Int?) -> Bool {
        let drawNumber = 0
        guard let userHands = userHands, let computerHands = computerHands else { return false }
        let checkNumber = userHands - computerHands
        
        return checkNumber == drawNumber ? true : false
    }
    
    func decideWinLose(_ gameName: String, _ userHands: Int?, _ computerHands: Int?) -> Bool {
        
        var winNumbers: [Int]
        
        switch gameName {
        case "RPS":
            winNumbers = [1, -2]
        case "MZB":
            winNumbers = [-1, 2]
        default:
            winNumbers = []
        }
        
        guard let userHands = userHands, let computerHands = computerHands else { return false }
        let checkNumber = userHands - computerHands
        return winNumbers.contains(checkNumber) ? true : false
    }
}
