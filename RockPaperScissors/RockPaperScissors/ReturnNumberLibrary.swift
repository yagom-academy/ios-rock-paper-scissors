//  RockPaperScissors - gameLibrary.swift
//  Created by vetto, songjun on 2022.12.28.

func makeRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func inputUserNumber() throws -> Int {
    guard let userInput = readLine(), let userNumber = Int(userInput) else {
        throw InputError.invalidInput
    }
    return userNumber
}
