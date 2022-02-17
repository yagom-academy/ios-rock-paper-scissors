//
//  startMenu.swift
//  RockPaperScissors
//
//  Created by 김영훈 on 2022/02/16.
//

import Foundation

var isProgramExit = false

func startProgram() {
    while isProgramExit == false {
        print(RockScissorsPaperGameMessage.gameMenu.rawValue, terminator: "")
        let userInput = readLine()
        switch userInput {
        case "1","2","3":
            startRockScissorsPaperGame(userInputValues: userInput)
        case "0":
            print(RockScissorsPaperGameMessage.gameEnd.rawValue)
            isProgramExit = true
        default:
            print(RockScissorsPaperGameError.wrongInput.rawValue)
        }
    }
}

