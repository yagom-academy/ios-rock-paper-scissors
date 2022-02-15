//
//  Computer.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

struct Computer {
    enum ComputerOption {
        static let numberRange: ClosedRange<Int> = 1...3
    }
    
    func generatedComputerNumber(numberRange: ClosedRange<Int> = ComputerOption.numberRange) -> Int {
        Int.random(in: numberRange)
    }
}
