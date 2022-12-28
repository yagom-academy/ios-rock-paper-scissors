//
//  mukjjibba.swift
//  RockPaperScissors
//
//  Created by Riji, Rilla on 2022/12/28.
//

enum MukjjibbaGameError : Error {
    case invalidInput
}

var isUserWin = false

func printMukjjibbaMenu() {
    let turn = checkTurn()
    print("[\(turn)]턴 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    
}

func checkTurn() -> String {
    if isUserWin {
        return "사용자"
    } else {
        return "컴퓨터"
    }
}
