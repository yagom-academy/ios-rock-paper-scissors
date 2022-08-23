//
//  RockPaperScissors - main.swift
//  Created by LJ, 준호.
//  Copyright © yagom academy. All rights reserved.
// 

struct RockPaperScissors {
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func getUserHand() -> String? {
        guard let userHand: String = readLine() else {
            return nil
        }
        return userHand
    }
    
    func startGame() {
        var userHand: String?
        repeat {
            printMenu()
            userHand = getUserHand()
        } while userHand != "0"
    }
}

var game = RockPaperScissors()
game.startGame()
