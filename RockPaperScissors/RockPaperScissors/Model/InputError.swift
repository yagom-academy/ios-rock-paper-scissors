//
//  InputError.swift
//  RockPaperScissors
//
//  Created by Kyo,Aaron on 2022/08/24.
//

enum InputError: Error {
    case numberError(message: String)
    case rangeError(message: String)
}
