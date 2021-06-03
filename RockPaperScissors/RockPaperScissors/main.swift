
//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

let youWin = "이겼습니다!", youLose = "졌습니다!", draw = "비겼습니다!"
let muk = 1, chi = 2, pa = 3
let stop = 0, scissors = 1, rock = 2, paper = 3
let scissorsRockPaper: Array<Int> = [stop,scissors,rock,paper]
let mukChiPa: Array<Int> = [stop,muk,chi,pa]

func printMenu() -> String?{
    print("가위(1),바위(2),보(3)!<종료 : 0>", terminator: " : ")
    let userInput: String? = readLine()
    return userInput
}

func unWrappedUserInput(_ userInput: String?) -> Int {
    if let unWrappedUserInput: String = userInput, let userInputNum: Int = Int(unWrappedUserInput) {
        return userInputNum
    }
    return -1
}

func checkUserInput(_ checkUserInput: Int) -> Bool{
    if 1 <= checkUserInput && checkUserInput <= 3 {
        judgeGame(user: checkUserInput, computer: makeRandomComputerOutput())
    } else if checkUserInput == 0 {
        print("게임종료")
        return false
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    return true
}

func gameStart() {
    var check = true
    repeat {
        let menu = printMenu()
        let user = unWrappedUserInput(menu)
        check = checkUserInput(user)
    } while check
}

func makeRandomComputerOutput() -> Int {
    return scissorsRockPaper[Int.random(in: 1...3)]
}
 
func judgeGame(user: Int, computer: Int) {
    switch (user, computer) {
    case (scissors, scissors), (rock, rock), (paper, paper):
        print(draw)
    case (scissors, rock), (rock, paper), (paper, scissors):
        attacker = computerTurn
    case (scissors, paper), (rock, scissors), (paper, rock):
        attacker = userTurn
    case (muk, muk), (chi, chi), (pa, pa):
        print("\(attacker)의 승리!")
    default :
        attacker = userTurn
    }
}

gameStart()

// ------------------------------------------
var attacker: String = ""
let userTurn = "사용자", computerTurn = "컴퓨터"

func convertMukChiPa(_ someInt: Int) -> Int {
    var convertMukChiPa = someInt
    switch convertMukChiPa {
    case scissors:
        convertMukChiPa = chi
    case rock:
        convertMukChiPa = muk
    default:
        convertMukChiPa = pa
    }
    return convertMukChiPa
}

func mukChiPaOutput() -> String? {
    print("[\(attacker) 턴] 묵(1),찌(2),빠(3)!<종료 : 0>", terminator: " : ")
    let userInput: String? = readLine()
    return userInput
} //unWrappedUserInput 재사용가능?

func makeRandomMukChiPa() -> Int {
    return mukChiPa[Int.random(in: 1...3)]
}

func judgeMukChiPa(user: Int, computer: Int) {
    if user == computer {
        return print("\(attacker)승리!")
    }
}

func startMukChiPa() {
    
}
