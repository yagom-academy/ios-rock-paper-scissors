//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

// 변수, 함수명을 후속 게임이 있다는 것을 고려하지 않고 명명해서 일반적일 수 있습니다.
// 가위바위보와 묵찌빠에서 변수, 함수명을 어떻게 정의할지 같이 생각해봐요.
// 설명이 필요한 구문이 있으면 디스코드로 메시지 보내주세요~

import Foundation

protocol RockPaperScissorsable {
    func generateRandomNumber() -> Int
    func printUserChoiceGuide()
    func getUserChoice() throws -> Int
    func decideWinner(userChoice: Int, computerChoice: Int)
}

extension RockPaperScissors: RockPaperScissorsable {
    func generateRandomNumber() -> Int {
        let randomNumber: Int = Int.random(in: 1...3)
        return randomNumber
    }
    
    func printUserChoiceGuide() {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    }
    
    func getUserChoice() throws -> Int {
        guard let userChoice: String = readLine() else {
            throw GameError.invalidSelection
        }
        guard let intUserChoice: Int = Int(userChoice) else {
            throw GameError.invalidSelection
        }
        return intUserChoice
    }
    
    func decideWinner(userChoice: Int, computerChoice: Int) {
        let winningCase: Int = computerChoice % 3 + 1
        if userChoice == computerChoice {
            print("비겼습니다!")
        } else if userChoice == winningCase {
            print("아이고.. 지셨네..")
        } else {
            print("이겼습니다!")
        }
    }
}

struct RockPaperScissors {
    enum GameError: Error {
        case invalidSelection
        case unknownError
    }
    
    // 아래 열거형 활용처 같이 고민해봅시다~!
    enum Choices: Int {
        case exitGame
        case scissor
        case rock
        case paper
    }
    
    func startGame() {
        startGameLoop: while true {
            let computerChoice: Int = generateRandomNumber()
            do {
                printUserChoiceGuide()
                let userChoice: Int = try getUserChoice()
                if userChoice == Choices.exitGame.rawValue {
                    break startGameLoop
                }
                decideWinner(userChoice: userChoice, computerChoice: computerChoice)
                // 묵찌빠 게임 이어 작성
            } catch {
                switch error {
                case GameError.invalidSelection:
                    print("잘못된 입력입니다. 다시 시도해주세요.")
                default:
                    print("알 수 없는 에러.")
                }
            }
        }
    }
}

let rockPaperScissors = RockPaperScissors()
rockPaperScissors.startGame()

