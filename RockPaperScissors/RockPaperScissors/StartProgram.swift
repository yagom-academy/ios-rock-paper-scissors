//
//  startMenu.swift
//  RockPaperScissors
//
//  Created by 김영훈 on 2022/02/16.
//

import Foundation

func startProgram() {
    while isProgramExit == false {
        print(RockScissorsPaperGameView.gameMenu.rawValue, terminator: "")
        let userInput = readLine()
        switch userInput {
        case "1","2","3":
            startRockScissorsPaperGame(userInputValues: userInput)
        case "0":
            print(RockScissorsPaperGameView.gameEnd.rawValue)
            isProgramExit = true
        default:
            print(RockScissorsPaperGameError.wrongInput.rawValue)
        }
    }
}

