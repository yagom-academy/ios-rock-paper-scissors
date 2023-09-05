//
//  RockPaperScissors - main.swift
//  Created by Kiseok, Morgan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors {
    case rock, paper, scissors
}

var userHand: RockPaperScissors = .rock

enum Result {
    case win, draw, lose, exit
    
    var result: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .exit:
            return "게임종료"
        }
    }
}

enum InputError: LocalizedError {
    case wrongInput
    
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}

func readUserInput() throws {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    
    guard let userInput = readLine() else {
        throw InputError.wrongInput
    }
    guard let user = Int(userInput) else {
        throw InputError.wrongInput
    }
    
    guard 0...3 ~= user else {
        throw InputError.wrongInput
    }
    
    switch user {
    case 0:
        print("게임종료")
        break
    case 1:
        userHand = .scissors
        playRockPaperScissors(userHand: userHand)
        break
    case 2:
        userHand = .rock
        playRockPaperScissors(userHand: userHand)
        break
    case 3:
        userHand = .paper
        playRockPaperScissors(userHand: userHand)
        break
    default:
        print("잘못된 입력입니다.")
        break
    }
}

func playRockPaperScissors(userHand: RockPaperScissors) {
    let selectComputerHand = Int.random(in: 1...3)
    var computerHand: RockPaperScissors = .rock
    
    switch selectComputerHand {
    case 1:
        computerHand = .scissors
    case 2:
        computerHand = .rock
    case 3:
        computerHand = .paper
    default:
        break
    }
    
    if computerHand == userHand {
        print("비겼습니다!")
    } else if computerHand == .rock && userHand == .paper || computerHand == .scissors && userHand == .rock || computerHand == .paper && userHand == .scissors {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

try readUserInput()
