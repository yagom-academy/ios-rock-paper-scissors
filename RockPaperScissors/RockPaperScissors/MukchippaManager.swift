//
//   MukchippaManager.swift
//  RockPaperScissors
//
//  Created by Charles, Toy on 2023/09/07.
//

struct MukchippaManager {
    private var isUserTurn = true
    var isWinOrLose = true
    
    private func printMenu(turn: String) {
        print("[\(turn)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }

    private mutating func inputUserNumber() -> Int {
        while true {
            let stringNumber = readLine()
            
            if let stringNumber = stringNumber, let number = Int(stringNumber) {
                return number
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                isWinOrLose = false
            }
        }
    }
}
