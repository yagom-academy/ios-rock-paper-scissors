//
//   MukchippaManager.swift
//  RockPaperScissors
//
//  Created by Charles, Toy on 2023/09/07.
//

struct MukchippaManager {
    var isUserTurn = true
    
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
                isUserTurn = false
                checkPlayerTurn()
            }
        }
    }
    
    private mutating func checkPlayerTurn() {
        if isUserTurn {
            printMenu(turn: "사용자")
        } else {
            printMenu(turn: "컴퓨터")
        }
    }
}
