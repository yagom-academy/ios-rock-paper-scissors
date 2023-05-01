//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.

enum Choice: Int {
    case Rock = 0
    case Paper = 1
    case Scissors = 2
}


struct RockPaperScissorsGame {
    
    private
    func getUserChoice(_ inputMenu: String?) -> Choice? {
        var userChoice: Choice? = nil
        
        switch inputMenu {
            case "1":
                userChoice = Choice.Scissors
            case "2":
                userChoice = Choice.Rock
            case "3":
                userChoice = Choice.Paper
            case "0":
                break
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
        }
        
        return userChoice
    }
    
    func start() {
        while true {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
            
            let inputMenu = readLine()
            let computerChoice = Choice(rawValue: Int.random(in: 0...2))
            
            guard let userChoice = getUserChoice(inputMenu) else { continue }
        }
    }
    
}
