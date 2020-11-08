//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by 김호준 on 2020/11/04.
//

import Foundation


func rockScissorsPaper() -> GameResult {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 0> : ", separator: "", terminator: "")
        // 입력 받기
        if let userInput = readLine() {
            var userRockPaperScissors: RockPaperScissors?

            // 입력 받은 값이 적절한지 판별.
            switch userInput {
            case "0":
                print("게임 종료")
                exit(0)
            case "1", "2", "3":
                userRockPaperScissors = RockPaperScissors(rawValue: Int(userInput) ?? 0)
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }

            // 게임 진행
            let randNumber = Int.random(in: 1...3) // 컴퓨터가 생성한 Random Number
            
            guard let comRockPaperScissors = RockPaperScissors(rawValue: randNumber) else {
                fatalError("컴퓨터가 가위, 바위, 보 중 하나를 내지 않았습니다! 반칙!")
            }
            
            switch comRockPaperScissors {
            case .scissors: //컴퓨터가 가위를 냈을 때
                if userRockPaperScissors == RockPaperScissors.scissors { print("비겼습니다!") }
                else if userRockPaperScissors == RockPaperScissors.rock { print("이겼습니다!"); return GameResult.win }
                else if userRockPaperScissors == RockPaperScissors.paper { print("졌습니다!"); return GameResult.lose }
            case .rock: //컴퓨터가 바위를 냈을 때
                if userRockPaperScissors == RockPaperScissors.scissors { print("졌습니다!"); return GameResult.lose }
                else if userRockPaperScissors == RockPaperScissors.rock { print("비겼습니다!") }
                else if userRockPaperScissors == RockPaperScissors.paper { print("이겼습니다!"); return GameResult.win }
            case .paper: //컴퓨터가 보를 냈을 때
                if userRockPaperScissors == RockPaperScissors.scissors { print("이겼습니다!"); return GameResult.win }
                else if userRockPaperScissors == RockPaperScissors.rock { print("졌습니다!"); return GameResult.lose }
                else if userRockPaperScissors == RockPaperScissors.paper { print("비겼습니다!") }
            }
        }
    }
}

