//
//  RockPaperScissors - main.swift
//  Created by yagom. 
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


func receiveUserNumber(gameMode: gameMode) -> Int {

    while true {
        if gameMode.rawValue == 1 {
            print(Message.rockPaperScissorsMenu, terminator: "")
        } else {
            print(Message.mukChiBaMenu, terminator: "")
        }
        guard let input = readLine(), let inputNumber = Int(input), (0...3).contains(inputNumber) else {
            print(Message.wrongInput)
            continue
        }
        return inputNumber
    }
}
func playRockPaperScissors() {
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
    }
}


func playMukChiBa(isUserWin: Bool) {
    
    var isUserTurn = isUserWin
    
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
        
//        switch (userHand, computerHand) {
//        case (.muk, .chi), (.chi, .ba), (.ba, .muk):
//            isUserTurn = true
//            winnerName = "사용자"
//            print("\(winnerName)", Message.mukChiBaTurn)
//
//        case (.muk, .ba), (.chi, .muk), (.ba, .chi):
//            isUserTurn = false
//            winnerName = "컴퓨터"
//            print("\(winnerName)", Message.mukChiBaTurn)
//
//        default:
//            print("\(winnerName)", Message.mukChiBaWinner)
//            playGame()
//            return
//        }
    }


func makeComputerNumber() -> Int {
    return Int.random(in: RockPaperScissors.scissors.rawValue...RockPaperScissors.paper.rawValue)
}

playRockPaperScissors()

