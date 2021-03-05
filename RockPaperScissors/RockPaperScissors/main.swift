//
//  RockPaperScissors - main.swift
//  Created by Steven, Ryan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 열거형으로 승패 정의

enum GameError: Error {
    case invalidInput
    case outOfRange
}

//indirect enum GameMode {
//    case rockPaperScissors, mukChiPa
//}

enum RockPaperScissors: Int, CaseIterable {
    case none, scissor, rock, paper
    
    static var allCase: [RockPaperScissors] {
        return [.scissor, .rock, .paper]
    }
    
    func index() -> Int {
        return self.rawValue
    }
    
    func getInputHandSign(_ inputValue: Int) -> RockPaperScissors {
        guard let inputHandSign = RockPaperScissors(rawValue: inputValue) else {
            return .none
        }
        return inputHandSign
    }
}

class Player {
    private(set) var handSign: RockPaperScissors = .none

    func setRandomHandSign() {
        if let handSign = RockPaperScissors.allCase.randomElement() {
            self.handSign = handSign
        }
    }
    func setInputHandSign(_ userInput: Int) {
        handSign = handSign.getInputHandSign(userInput)
    }
}

class RockPaperScissorsGame {
    private let player = Player()
    private let computer = Player()
//    private var userInput = 0
    // private var phase, mode = 1 // 1번이면 가위바위보, 2번이면 묵찌바 --> enum
    // var isMyTurn: Bool = true

    private func printMenu() {
//        if 게임 모드 == 게임모드 타입.가위바위보 {
        print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator:"")
//        } else {
//        if isMyTurn == true {
//            print("[사용자 턴]")
//        } else {
//            print("[컴퓨터 턴]")
//        }
    }
    private func exitGame() {
            print("게임 종료")
            exit(0)
    }
    func getUserInput() throws -> Int {
        guard let userInput: String = readLine(), let resultInteger: Int = Int(userInput) else {
            throw GameError.invalidInput
        }
        if !(resultInteger >= 0 && resultInteger <= 3) {
            throw GameError.outOfRange
        }
        return resultInteger
    }
//    private func checkOutOfRange(of userInput: Int) -> Bool {
//        if (userInput >= 1 && userInput <= 3) {
//            return true
//        } else {
//            return false
//        }
//    }
    private func choicePlayerHands(_ userInput: Int) {
        computer.setRandomHandSign()
        player.setInputHandSign(userInput)
    }
    private func decideWinner() { // decideOrder로 변경 고려
        let winningHandSignOfUser: Int = computer.handSign.index() % 3 + 1
        if player.handSign == computer.handSign {
            print("비겼습니다!") // 가위바위보 계속 진행
        } else if player.handSign.index() == winningHandSignOfUser {
            print("이겼습니다!") // 묵찌빠 타입으로 이동, 사용자가 선
        } else {
            print("아이고.. 지셨네.. 다시 해봐요~") // 묵찌빠 타입으로 이동,
        }
    }
    
//    func play가위바위보
//    func play묵찌빠
    
    func play() {
        var userInput: Int = 0
        repeat {
            printMenu()
            do {
                userInput = try getUserInput()
                if userInput == 0 {
                    exitGame()
                }
                choicePlayerHands(userInput)
                decideWinner()
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        } while true
    }
}

let game = RockPaperScissorsGame()
game.play()
