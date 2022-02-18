//
//  GameOption.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

enum GameOption {
    static let userNumberRange: ClosedRange<Int> = 0...3
    static let computerNumberRange: ClosedRange<Int> = 1...3
    static let wrongInput: Int = -1
}
