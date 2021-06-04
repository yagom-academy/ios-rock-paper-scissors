//
//  RockPaperScissors - main.swift
//  Created by Jiss, Soll.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Message: String, CustomStringConvertible {
    case rockPaperScissorsMenu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case gameOver = "게임 종료"
    case userWin = "이겼습니다!"
    case userLose = "졌습니다."
    case draw = "비겼습니다."
    case mukChiBaMenu = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    case mukChiBaTurn = "의 턴입니다"
    case mukChiBaWinner = "의 승리!"
    
    var description: String {
        return self.rawValue
    }
}

enum RockPaperScissors: Int {
    case scissors = 1
    case rock
    case paper
}

enum MukChiBa: Int {
    case muk = 1
    case chi
    case ba
}

enum gameMode: Int {
    case rockPaperScissors = 1
    case mukChiBa
}

func isGameEnd(userNumber: Int) -> Bool {
    if userNumber == 0 {
        return true
    }
    return false
}

func printGameMenu(gameMode: gameMode, winnerName: String = "사용자") {
    switch gameMode {
    case .rockPaperScissors:
        print(Message.rockPaperScissorsMenu, terminator: "")
    case .mukChiBa:
        print("[\(winnerName)턴]", Message.mukChiBaMenu, terminator: "")
    }
}

func receiveUserNumber(gameMode: gameMode) -> Int {
    while true {
        switch gameMode {
        case .rockPaperScissors:
            guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
                print(Message.wrongInput)
                continue
            }
        case .mukChiBa:
            guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
                playMukChiBa(isUserWin: false)
                break
            }
        }
        return 0
    }
    
    
    
    //    while true {
    //        if gameMode.rawValue == 1 {
    //            print(Message.rockPaperScissorsMenu, terminator: "")
    //        } else {
    //            print("[\(winnerName) 턴]", Message.mukChiBaMenu, terminator: "")
    //        }
    //
    //        guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
    //            print(Message.wrongInput)
    //            if gameMode.rawValue == 2 {
    //                playMukChiBa(isUserWin: false)
    //            }
    //            continue
    //        }
    //        return inputNumber
    //    }
}


func makeComputerNumber() -> Int {
    return Int.random(in: RockPaperScissors.scissors.rawValue...RockPaperScissors.paper.rawValue)
}

func playRockPaperScissors() {
    printGameMenu(gameMode: .rockPaperScissors)
    let userNumber = receiveUserNumber(gameMode: .rockPaperScissors)
    if isGameEnd(userNumber: userNumber) {
        print(Message.gameOver)
        return
    }
    let computerNumber = makeComputerNumber()
    
    switch (RockPaperScissors(rawValue: userNumber), RockPaperScissors(rawValue: computerNumber)) {
    case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
        print(Message.userWin)
        playMukChiBa(isUserWin: true)
        return
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        print(Message.userLose)
        playMukChiBa(isUserWin: false)
        return
    default:
        print(Message.draw)
        playRockPaperScissors()
    }
}


func playMukChiBa(isUserWin: Bool) {
    var isUserTurn = isUserWin
    printGameMenu(gameMode: .mukChiBa, winnerName: isUserTurn ? "사용자" : "컴퓨터")
    let userNumber = receiveUserNumber(gameMode: .mukChiBa) // 유저가 잘못 입력했을 때, 턴이 컴퓨터로 안돌아감
    
    if isGameEnd(userNumber: userNumber) {
        print(Message.gameOver)
        return
    }
    let computerNumber = makeComputerNumber()
    var winnerName = isUserTurn ? "사용자" : "컴퓨터"
    //    print("[\(winnerName) 턴]", Message.mukChiBaMenu, terminator: "")
    //    while true {
    //        var winnerName = isUserTurn ? "사용자" : "컴퓨터"
    //        print("[\(winnerName) 턴]", Message.mukChiBaMenu, terminator: "")
    
    //        guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
    //            print(Message.wrongInput)
    //            isUserTurn = false
    //            continue
    //        }
    //
    //        guard let computerHand: MukChiBa = MukChiBa(rawValue: makeComputerNumber()) else {
    //            return
    //        }
    //
    //        guard let userHand: MukChiBa = MukChiBa(rawValue: inputNumber) else {
    //            print(Message.gameOver)
    //            return
    //        }
    
    switch (MukChiBa(rawValue: userNumber), MukChiBa(rawValue: computerNumber)) {
    case (.muk, .chi), (.chi, .ba), (.ba, .muk):
        //        isUserTurn = true
        winnerName = "사용자"
        print("\(winnerName)", Message.mukChiBaTurn)
        playMukChiBa(isUserWin: true)
    case (.muk, .ba), (.chi, .muk), (.ba, .chi):
        //        isUserTurn = false
        winnerName = "컴퓨터"
        print("\(winnerName)", Message.mukChiBaTurn)
        playMukChiBa(isUserWin: false)
    default:
        print("\(winnerName)", Message.mukChiBaWinner)
        playRockPaperScissors()
        return
    }
}

playRockPaperScissors()


