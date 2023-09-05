//
//  RPSManger.swift
//  RockPaperScissors
//
//  Created by 김형철 on 2023/09/05.
//

import Foundation

struct RPSManager {
    var computerCard = RockPaperScissors(rawValue: Int.random(in: 1...3))
    var userCard : RockPaperScissors?
    
    func inputUserNumber(number: String?) -> Int {
        guard let number = number, let number = Int(number) else { return 4 }
        
        guard number < 4, number >= 0 else {
            return 4 }
        
        return number
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    mutating func playGame() {
        printMenu()
        
        let userChoice = inputUserNumber(number: readLine())
        
        userCard = RockPaperScissors(rawValue: userChoice)
        computerCard = RockPaperScissors(rawValue: Int.random(in: 1...3))
        
        if computerCard == userCard {
            print("비겼습니다!")
            playGame()
        } else if computerCard == .paper && userCard == .rock {
            print("졌습니다!")
            return
        } else if computerCard == .rock && userCard == .scissors {
            print("졌습니다!")
            return
        } else if computerCard == .scissors && userCard == .paper {
            print("졌습니다!")
            return
        } else if userChoice == 0 {
            print("게임 종료")
            return
        } else {
            print("이겼습니다!")
            return
        }
    }
}
