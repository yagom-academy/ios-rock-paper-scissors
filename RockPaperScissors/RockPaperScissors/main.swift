//
//  RockPaperScissors - main.swift
//  Created by Steven, Ryan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameError: Int, Error {
    case nilInput = -1
    case typeCastingFailed = -2
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

protocol GetUserInput {
    func getUserInput() -> Int
    func castStringtoInt(inputString: String) -> Int
}

extension GetUserInput {
    func getUserInput() -> Int {
        guard let userInput: String = readLine() else {
            return GameError.nilInput.rawValue
        }
        return castStringtoInt(inputString: userInput)
    }
    func castStringtoInt(inputString: String) -> Int {
        guard let resultInteger: Int = Int(inputString) else {
            return GameError.typeCastingFailed.rawValue
        }
        return resultInteger
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

class RockPaperScissorsGame: GetUserInput {
    private let player = Player()
    private let computer = Player()
    private var userInput = 0

    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator:"")
    }
    private func exitGame() {
        print("게임 종료")
        exit(0)
    }
    private func checkInvaildInput(of userInput: Int) -> Bool {
        if (userInput >= 1 && userInput <= 3) {
            return true
        } else {
            return false
        }
    }
    private func choicePlayerHands(_ userInput: Int) {
        computer.setRandomHandSign()
        player.setInputHandSign(userInput)
    }
    private func decideWinner() {
        let winningHandSignOfUser: Int = computer.handSign.index() % 3 + 1
        if player.handSign == computer.handSign {
            print("비겼습니다!")
        } else if player.handSign.index() == winningHandSignOfUser {
            print("이겼습니다!")
        } else {
            print("아이고.. 지셨네.. 다시 해봐요~")
        }
    }
    func play() {
        repeat {
            printMenu()
            userInput = getUserInput()
            if userInput == 0 {
                exitGame()
            }
            if checkInvaildInput(of: userInput) {
                choicePlayerHands(userInput)
                decideWinner()
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        } while true
    }
}

let game = RockPaperScissorsGame()
game.play()
