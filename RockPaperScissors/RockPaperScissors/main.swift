//
//  RockPaperScissors - main.swift
//  Created by LJ, 준호.
//  Copyright © yagom academy. All rights reserved.
// 

struct RockPaperScissors {
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func getUserHand() -> String {
        printMenu()
        guard let userHand: String = readLine(),
              isCorrectUserHand(userHand) else {
            return getUserHand()
        }
        return userHand
    }
    
    func isCorrectUserHand(_ userHand: String) -> Bool {
        switch userHand {
        case "0","1","2","3":
            return true
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return false
        }
    }
    
    func startGame() {
        //var userHand: String = getUserHand()
    }
}

var game = RockPaperScissors()
game.startGame()
