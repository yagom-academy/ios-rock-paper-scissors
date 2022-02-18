//
//  Computer.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

struct Computer {
    func generatedComputerNumber(numberRange: ClosedRange<Int> = GameOption.computerNumberRange) -> Int {
        Int.random(in: numberRange)
    }
}
