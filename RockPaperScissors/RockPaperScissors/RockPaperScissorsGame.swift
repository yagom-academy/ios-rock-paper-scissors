//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Daehoon Lee on 2023/05/01.
//

import Foundation

struct RockPaperScissorsGame {
    func selectMenu() {
        var isRunning: Bool = true
        
        while isRunning {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>:", terminator: " ")

            guard let pick = readLine(), let menu = Menu(rawValue: pick) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            switch menu {
            case .paper, .rock, .scissors:
                let computerPick: String = generateComputerRandomNumber()
                print(computerPick)
            case .termination:
                isRunning = false
            }
        }
    }
    
    private func generateComputerRandomNumber() -> String {
        return String(Int.random(in: 1...3))
    }
}
