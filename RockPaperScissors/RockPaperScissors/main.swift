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

enum Winner: String, CustomStringConvertible {
    case computer = "컴퓨터"
    case player = "사용자"
    case none
    
    var description: String {
        switch self {
        case .computer:
            return "졌습니다!"
        case .player:
            return "이겼습니다!"
        case .none:
            return "비겼습니다!"
        }
    }
}

enum InputError: Error, CustomStringConvertible {
    case invalidInput
    
    var description: String {
        switch self {
        case .invalidInput:
            return "잘못된 입력입니다.다시 시도해주세요."
        }
    }
}

var computerSign: RockScissorsPaperSign = .paper
var playerSign: RockScissorsPaperSign = .paper
var gameTurn: Winner = .none
var mainGameWinner:Winner = .none
var shouldContinue: Bool = true

// MARK: - 게임 메세지 출력

func printTurnGameMessage() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func printTurnGameResult() {
    print(gameTurn.description)
}

func printMainGameMessage() {
    print("[\(gameTurn.rawValue) 턴] 묵(1), 찌(2), 빠(3)!<종료: 0> : ", terminator: "")
}

func printMainGameResult() {
    if playerSign == computerSign {
        print("\(mainGameWinner.rawValue)의 승리!")
    } else {
        print("\(gameTurn.rawValue)의 턴입니다")
    }
}

// MARK: - 사용자 입력

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
        print(InputError.invalidInput.description)
    } catch {
        print(error)
    }
    return nil
}

func inputTurnGameSign() -> String {
    var isValidInput: Bool = false
    var playerInput = String()
    repeat {
        printTurnGameMessage()
        if let input = validatedInput() {
            playerInput = input
            isValidInput = true
        } else {
            isValidInput = false
        }
    } while !isValidInput
    return playerInput
}

func swapRockAndScissors(from input: String) -> String {
    switch input {
    case "1":
        return "2"
    case "2":
        return "1"
    default:
        return input
    }
}

func inputMainGameSign() -> String {
    var isValidInput: Bool = false
    var playerInput = String()
    repeat {
        printMainGameMessage()
        if let input = validatedInput() {
            playerInput = input
            isValidInput = true
        } else {
            gameTurn = .computer
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

func judgeMainGameWinner() {
    if playerSign == computerSign {
        mainGameWinner = gameTurn
    }
}

// MARK: - 게임 진행

func setShouldContinue() {
    if gameTurn == .none {
        shouldContinue = true
    } else {
        shouldContinue = false
    }
}

func playTurnGameOnce(input: String) {
    setComputerSign()
    setPlayerSign(input: input)
    if shouldContinue {
        judgeWinner()
        printTurnGameResult()
        setShouldContinue()
    }
}

func playTurnGame() {
    repeat {
        let playerInput = inputTurnGameSign()
        playTurnGameOnce(input: playerInput)
    } while shouldContinue
}

func playMainGameOnce(input: String) {
    setComputerSign()
    setPlayerSign(input: input)
    if shouldContinue {
        judgeMainGameWinner()
        judgeWinner()
        printMainGameResult()
    }
}

func playMainGame() {
    shouldContinue = true
    repeat {
        let playerInput = inputMainGameSign()
        let swapped = swapRockAndScissors(from: playerInput)
        playMainGameOnce(input: swapped)
    } while gameTurn != .none && shouldContinue
}

func runMukJjiBba() {
    playTurnGame()
    if playerSign != computerSign {
        playMainGame()
    }
    print("게임 종료")
}

runMukJjiBba()
