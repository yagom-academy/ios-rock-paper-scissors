//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorsPaperSign: CaseIterable {
    case rock
    case scissors
    case paper
}

enum Option {
    static let list = ["0", "1", "2", "3"]
}

enum Winner {
    case computer
    case player
    case none
}

enum InputError: Error {
    case invalidInput
}

var computerSign: RockScissorsPaperSign = .paper
var playerSign: RockScissorsPaperSign = .paper
var gameTurn: Winner = .none
var shouldContinue: Bool = true

// MARK: - 사용자 입력

func printStartMessage() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func receivePlayerInput() throws -> String {
    guard let playerInput = readLine(), Option.list.contains(playerInput) else {
        throw InputError.invalidInput
    }
    return playerInput
}

func validatedInput() -> String? {
    do {
        let playerInput = try receivePlayerInput()
        return playerInput
    } catch InputError.invalidInput {
        print("잘못된 입력입니다.다시 시도해주세요.")
    } catch {
        print(error)
    }
    return nil
}

func inputFromPlayer() -> String {
    var isValidInput: Bool = false
    var playerInput = String()
    repeat {
        printStartMessage()
        if let input = validatedInput() {
            playerInput = input
            isValidInput = true
        } else {
            isValidInput = false
        }
    } while !isValidInput
    return playerInput
}

// MARK: - 컴퓨터, 사용자 패 생성

func setComputerSign() {
    let computer = RockScissorsPaperSign.allCases.randomElement()!
    computerSign = computer
}

func setPlayerSign(input: String) {
    switch input {
    case "1":
        playerSign = .scissors
    case "2":
        playerSign = .rock
    case "3":
        playerSign = .paper
    default:
        shouldContinue = false
    }
}

// MARK: - 게임 승패 판단

func judgeWinner() {
    switch playerSign {
    case .rock where computerSign == .scissors:
        gameTurn = .player
    case .scissors where computerSign == .paper:
        gameTurn = .player
    case .paper where computerSign == .rock:
        gameTurn = .player
    case computerSign:
        gameTurn = .none
    default:
        gameTurn = .computer
    }
}

func printGameResult() {
    switch gameTurn {
    case .computer:
        print("졌습니다!")
    case .player:
        print("이겼습니다!")
    case .none:
        print("비겼습니다!")
    }
}

func setShouldContinue() {
    if gameTurn == .none {
        shouldContinue = true
    } else {
        shouldContinue = false
    }
}

func playGameOnce(input: String) {
    setComputerSign()
    setPlayerSign(input: input)
    if shouldContinue {
        judgeWinner()
        printGameResult()
        setShouldContinue()
    }
}

func playGame() {
    repeat {
        let playerInput = inputFromPlayer()
        playGameOnce(input: playerInput)
    } while shouldContinue
    print("게임 종료")
}

playGame()
