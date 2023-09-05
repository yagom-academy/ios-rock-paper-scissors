//
//  RPSManger.swift
//  RockPaperScissors
//
//  Created by 김형철 on 2023/09/05.
//

import Foundation

struct RPSManager {
    private var computerCard = RockPaperScissors(rawValue: Int.random(in: 1...3))
    
    func inputUserNumber(number: String?) -> Int {
        guard let number = number, let number = Int(number) else { return 4 }
        return number
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>:", terminator: " ")
    }
}
