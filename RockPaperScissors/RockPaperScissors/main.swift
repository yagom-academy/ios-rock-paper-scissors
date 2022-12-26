//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum InputError: Error {
    case invalidNumber
}

enum RPS: Int {
    case exit
    case scissors
    case rock
    case paper
}

enum GameResult: String {
    case draw = "비겼습니다!"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func receiveUserInput() throws -> Int {
    guard let input = readLine() else {
        throw InputError.invalidNumber
    }
    
    guard let inputNumber = Int(input) else {
        throw InputError.invalidNumber
    }
    
    return inputNumber
}

func printGameResult(gameResult: GameResult) {
    print(gameResult.rawValue)
}

func play() {
    do {
        printMenu()
        switch RPS(rawValue: try receiveUserInput()) {
        case .exit:
            print("종료")
        case .scissors:
            print("종료")
        case .rock:
            print("종료")
        case .paper:
            print("종료")
        default:
            throw InputError.invalidNumber
        }
    } catch InputError.invalidNumber {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        play()
    } catch {
        print(error)
    }
}
