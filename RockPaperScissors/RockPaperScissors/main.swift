//
//  RockPaperScissors - main.swift
//  Created by LJ, 준호.
//  Copyright © yagom academy. All rights reserved.
// 

struct RockPaperScissors {
    func startGame() {
        var userHand: Int = getUserHand()
        let computerHand: Int = getComputerHand()
        switch userHand {
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            return
        }
    }
    
    func getUserHand() -> Int {
        printMenu()
        guard let userHand: Int = Int(readLine() ?? ""),
              isCorrectUserHand(userHand) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getUserHand()
        }
        return userHand
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }

    func isCorrectUserHand(_ userHand: Int) -> Bool {
        switch userHand {
        case 0...3:
            return true
        default:
            return false
        }
    }
    
    func getComputerHand() -> Int {
        return Int.random(in: 1...3)
    }
}

var game = RockPaperScissors()
game.startGame()
