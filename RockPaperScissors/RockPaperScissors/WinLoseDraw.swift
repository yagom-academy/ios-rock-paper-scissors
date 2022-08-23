//
//  WinLoseDraw.swift
//  RockPaperScissors
//
//  Created by LJ, 준호 on 2022/08/23.
//

enum WinLoseDraw {
    case win
    case lose
    case draw
    
    func printResult() {
        switch self {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
}
