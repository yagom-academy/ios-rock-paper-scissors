
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
var attacker: String = ""
let userTurn = "사용자", computerTurn = "컴퓨터"

func inputScissorsRockPaper()->Int{
    print("가위(1),바위(2),보(3)!<종료 : 0>", terminator: " : ")
    guard let someInput = userInput(),let num = Int(someInput), num>=0 && num<=3 else {
        print("잘못된 입력입니다. 다시 시도해주세요")
        return inputScissorsRockPaper()
    }
    return num
}

func makeRandomComputerOutput() -> Int {
    return scissorsRockPaper[Int.random(in: 1...3)]
}

func judgeGame(user: Int, computer: Int) -> String {
    switch (user, computer) {
    case (scissors, rock), (rock, paper), (paper, scissors):
        print(youLose)
        attacker = computerTurn
        return attacker
    case (scissors,paper), (rock,scissors), (paper,rock):
        print(youWin)
        attacker = userTurn
        return attacker
    default :
        print(draw)
        return draw

    }
}

func judgeMukChiPa(user: Int, computer: Int, attack: String) -> String {
    var attacker: String = attack
    switch (user, computer) {
    case (chi,muk), (muk,pa), (pa,chi):
        attacker = computerTurn
        return attacker
    case (chi,pa), (muk,chi), (pa,muk):
        attacker = userTurn
        return attacker
    default:
        return draw
    }
}

func userInput() -> String?{
    return readLine()
}

func inputMukChiPa()->Int{
    print("[\(attacker) 턴] 묵(1),찌(2),빠(3)!<종료 : 0>", terminator: " : ")
    guard let someInput = userInput(),let num = Int(someInput), num>=0 && num<=3 else {
        print("잘못된 입력입니다. 다시 시도해주세요")
        attacker = computerTurn
        return inputMukChiPa()
    }
    return num
}

func makeRandomMukChiPa() -> Int {
    return mukChiPa[Int.random(in: 1...3)]
}

func gameStart() {
    while true {
        var user = inputScissorsRockPaper()
        if user == 0 {
            print("게임종료")
            user = 0
            break
        }
        let computer = makeRandomComputerOutput()
        let result = judgeGame(user: user, computer: computer)
        if result != draw {
            break
        }
    }

    while true {
        let user = inputMukChiPa()
        let computer = makeRandomMukChiPa()
        if user == 0 {
            print("게임종료")
            break
        }
        let result = judgeMukChiPa(user: user, computer: computer, attack: attacker)
        if result == draw {
            print("\(attacker)의 승리!")
            break
        }
    }
}

gameStart()
