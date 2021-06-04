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
    case rockPaperScissorsUserWin = "이겼습니다!"
    case rockPaperScissorsUserLose = "졌습니다."
    case rockPaperScissorsDraw = "비겼습니다."
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

func receiveUserNumber(gameMode: gameMode) -> Int? {
    switch gameMode {
    case .rockPaperScissors:
        guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
            print(Message.wrongInput)
            playRockPaperScissors()
            return nil
        }
        return inputNumber
    case .mukChiBa:
        guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
            print(Message.wrongInput)
            playMukChiBa(isUserWin: false)
            return nil
        }
        return inputNumber
    }
}


func makeComputerNumber() -> Int {
    return Int.random(in: RockPaperScissors.scissors.rawValue...RockPaperScissors.paper.rawValue)
}

func playRockPaperScissors() {
    printGameMenu(gameMode: .rockPaperScissors)
    guard let userNumber = receiveUserNumber(gameMode: .rockPaperScissors) else {
        return
    }
    if isGameEnd(userNumber: userNumber) {
        print(Message.gameOver)
        return
    }
    let computerNumber = makeComputerNumber()
    
    switch (RockPaperScissors(rawValue: userNumber), RockPaperScissors(rawValue: computerNumber)) {
    case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
        print(Message.rockPaperScissorsUserWin)
        playMukChiBa(isUserWin: true)
        return
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        print(Message.rockPaperScissorsUserLose)
        playMukChiBa(isUserWin: false)
        return
    default:
        print(Message.rockPaperScissorsDraw)
        playRockPaperScissors()
    }
}


func playMukChiBa(isUserWin: Bool) {
    printGameMenu(gameMode: .mukChiBa, winnerName: isUserWin ? "사용자" : "컴퓨터")
    guard let userNumber = receiveUserNumber(gameMode: .mukChiBa) else {
        return
    }
    if isGameEnd(userNumber: userNumber) {
        print(Message.gameOver)
        return
    }
    let computerNumber = makeComputerNumber()
    var winnerName = isUserWin ? "사용자" : "컴퓨터"
    
    switch (MukChiBa(rawValue: userNumber), MukChiBa(rawValue: computerNumber)) {
    case (.muk, .chi), (.chi, .ba), (.ba, .muk):
        winnerName = "사용자"
        print("\(winnerName)", Message.mukChiBaTurn)
        playMukChiBa(isUserWin: true)
    case (.muk, .ba), (.chi, .muk), (.ba, .chi):
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


