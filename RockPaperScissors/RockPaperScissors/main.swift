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

 enum GameMode {
    case rockPaperScissors, mukChiPa
}

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
    private var mode = GameMode.rockPaperScissors // 1번이면 가위바위보, 2번이면 묵찌바 --> enum
    private var isUserTurn: Bool = true
    
    private func printMenu() {
        if mode == GameMode.rockPaperScissors {
            print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator:"")
        } else {
            if isUserTurn == true {
                print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator:"")
            } else {
                print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator:"")
            }
        }
    }
    private func exitGame() {
        print("게임 종료")
        exit(0)
    }
    private func getUserInput() throws -> Int {
        guard let userInput: String = readLine(), let resultInteger: Int = Int(userInput) else {
            throw GameError.invalidInput
        }
        if !(resultInteger >= 0 && resultInteger <= 3) {
            throw GameError.outOfRange
        }
        return resultInteger
    }
    private func choicePlayerHands(_ userInput: Int) {
        computer.setRandomHandSign()
        player.setInputHandSign(userInput)
    }
    private func decideOrder() {
        let winningHandSignOfUser: Int = computer.handSign.index() % 3 + 1
        if player.handSign == computer.handSign {
            print("비겼습니다!")
        } else if player.handSign.index() == winningHandSignOfUser {
            print("이겼습니다!")
            mode = GameMode.mukChiPa
            isUserTurn = true
        } else {
            print("아이고.. 지셨네..")
            mode = GameMode.mukChiPa
            isUserTurn = false
        }
    }
    private func decideWinner() {
        let winningHandSignOfUser: Int = computer.handSign.index() % 3 + 1
        if player.handSign == computer.handSign {
            if isUserTurn {
                print("사용자의 승리!")
            } else {
                print("컴퓨터의 승리..")
            }
            exitGame()
        } else if player.handSign.index() == winningHandSignOfUser {
            print("사용자의 턴입니다.")
            isUserTurn = true
        } else {
            print("컴퓨터의 턴입니다.")
            isUserTurn = false
        }
    }
    func handleError() {
        if mode == GameMode.rockPaperScissors {
            print("잘못된 입력입니다. 컴퓨터 턴입니다.")
            mode = GameMode.mukChiPa
            isUserTurn = false
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    func decideWinnerByMode() {
        if mode == GameMode.rockPaperScissors {
            decideOrder()
        } else {
            decideWinner()
        }
    }
    func play() {
        repeat {
            var userInput: Int = 0
            printMenu()
            do {
                userInput = try getUserInput()
                if userInput == 0 {
                    exitGame()
                }
                choicePlayerHands(userInput)
                decideWinnerByMode()
            } catch {
                handleError()
            }
        } while true
    }
}

let game = RockPaperScissorsGame()
game.play()
