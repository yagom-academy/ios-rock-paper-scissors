//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by 김호준 on 2020/11/04.
//

import Foundation

enum state {
    case win
    case lose
    case draw
}

func rockScissorsPaper() -> state {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 0> : ", separator: "", terminator: "")
        // 입력 받기
        if let readLine = readLine() {
            var readNumber: Int?

            // 입력 받은 값이 적절한지 판별.
            switch readLine {
            case "0":
                print("게임 종료")
                exit(0)
            case "1"..."3":
                readNumber = Int(readLine) ?? 0
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }

            // 게임 진행
            let randNumber = Int.random(in: 1...3)   // 컴퓨터가 생성한 Random Number
            switch randNumber {
            case 1: //컴퓨터가 가위를 냈을 때
                if readNumber == 1 { print("비겼습니다!") }
                else if readNumber == 2 { print("이겼습니다!"); return state.win }
                else if readNumber == 3 { print("졌습니다!"); return state.lose }
            case 2: //컴퓨터가 바위를 냈을 때
                if readNumber == 1 { print("졌습니다!"); return state.lose }
                else if readNumber == 2 { print("비겼습니다!") }
                else if readNumber == 3 { print("이겼습니다!"); return state.win }
            case 3: //컴퓨터가 보를 냈을 때
                if readNumber == 1 { print("이겼습니다!"); return state.win }
                else if readNumber == 2 { print("졌습니다!"); return state.lose }
                else if readNumber == 3 { print("비겼습니다!") }
            default:
                print("Error!")
            }
        }
    }
}

