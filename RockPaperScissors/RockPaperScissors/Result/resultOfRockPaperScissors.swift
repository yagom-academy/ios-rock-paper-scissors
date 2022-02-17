//
//  resultOfRockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박세웅 on 2022/02/17.
//

import Foundation

enum Result: String {
    case win = "이겼습니다."
    case draw = "비겼습니다."
    case lose = "졌습니다."
    
    func printMessage() {
        print(self.rawValue)
    }
}
