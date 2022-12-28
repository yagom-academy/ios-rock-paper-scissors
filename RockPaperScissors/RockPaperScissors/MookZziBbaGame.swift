//  RockPaperScissors - MookZziBba.swift
//  Created by vetto, songjun on 2022.12.28.

import Foundation

func printTurnAndMenu(turn: Winner) {
    print("[\(turn.rawValue)턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
}

func inputUserNumber2() -> Int {
    guard let userInput = readLine() else {
        return inputUserNumber2()
    }
    guard let userNumber = Int(userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return inputUserNumber2()
    }
    return userNumber
}

func convertNumberToMookZziBba(number: Int) -> MookZziBba {
    guard let hand = MookZziBba(rawValue: number) else {
        return MookZziBba.wrongHand
    }
    return hand
}

func decideMookZziBbaWinner(turn: Winner,
                     _ userHand: MookZziBba,
                     _ computerHand: MookZziBba) -> (Winner, Winner) {
    switch (turn, userHand, computerHand) {
    case (.user, .mook, .mook), (.user, .zzi, .zzi), (.user, .bba, .bba):
        return (.user, .user)
    case (.computer, .mook, .mook), (.computer, .zzi, .zzi), (.computer, .bba, .bba):
        return (.computer, .computer)
    case (.user, .mook, .zzi), (.user, .zzi, .bba), (.user, .bba, .mook):
        return (.draw, .user)
    case (.computer, .mook, .zzi), (.computer, .zzi, .bba), (.computer, .bba, .mook):
        return (.draw, .computer)
    case (.user, .zzi, .mook), (.user, .bba, .zzi), (.user, .mook, .bba):
        return (.draw, .computer)
    default:
        return (.draw, .user)
    }
}

func startMookZziBbaGame(turn: Winner) {
    printTurnAndMenu(turn: turn)
    
    let inputtedNumber = inputUserNumber2()
    
    switch inputtedNumber {
    case 0:
        print("게임종료")
    case 1, 2, 3:
        let userHand = convertNumberToMookZziBba(number: inputtedNumber)
        let computerHand = convertNumberToMookZziBba(number: makeRandomComputerNumber())
        let result = decideMookZziBbaWinner(turn: turn, userHand, computerHand).0
        let turn = decideMookZziBbaWinner(turn: turn, userHand, computerHand).1
        
        switch (result, turn) {
            
        case (.user, .user):
            print("사용자 승리")
        case (.computer, .computer):
            print("컴퓨터 승리")
        case (.draw, .user):
            print("\(turn.rawValue)의 턴입니다.")
            startMookZziBbaGame(turn: .user)
        default:
            print("\(turn.rawValue)의 턴입니다.")
            startMookZziBbaGame(turn: .computer)
        }
    
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startMookZziBbaGame(turn: .computer)
    }
}
