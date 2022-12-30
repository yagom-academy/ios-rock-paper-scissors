//
//  RockPaperScissors - Game.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class Game {
    func createComputerNumber() -> Int {
        let computerNumber = Int.random(in: 1...3)
        return computerNumber
    }
    
    func choiceUserNumber() -> Int? {
        guard let userInput = readLine() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return choiceUserNumber()
        }
        return Int(userInput)
    }
    
    private func checkUserNumber(number: Int?) -> Int {
        guard let userNumber = number, userNumber >= 0, userNumber <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return checkUserNumber(number: choiceUserNumber())
        }
        return userNumber
    }
    
    func createUserNumber() -> Int {
        let userNumber = choiceUserNumber()
        let userNumberCheck = checkUserNumber(number: userNumber)
        return userNumberCheck
    }
}
