//
//  RockPaperScissors - main.swift
//  Created by sehong, kaki.
//  Copyright © yagom academy. All rights reserved.
//
enum InputError: Error {
    case invalidNumber
}

enum GameOptions {
    case exit
    case scissors
    case rock
    case paper
    
    init?(rockScissorsPaper: Int) {
          switch rockScissorsPaper {
          case 0:
              self = .exit
          case 1:
              self = .scissors
          case 2:
              self = .rock
          case 3:
              self = .paper
          default:
              return nil
          }
    }
    
    init?(mukJjiBba: Int) {
        switch mukJjiBba {
        case 0:
            self = .exit
        case 1:
            self = .rock
        case 2:
            self = .scissors
        case 3:
            self = .paper
        default:
            return nil
        }
    }
}

enum GameMessage {
    static let rockScissorsPaper = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    static let mukJjiBba = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
}

var turn = ""

func createComputerSelect() -> Int {
    return Int.random(in: 1...3)
}

func printRockScissorsPaperMenu() {
    print(GameMessage.rockScissorsPaper, terminator: "")
}

func printMukJjiBbaMenu() {
    print("[\(turn) 턴]", GameMessage.mukJjiBba, terminator: "")
}

func receiveUserInput() throws -> Int {
    guard let input = readLine(), let inputNumber = Int(input) else {
        throw InputError.invalidNumber
    }
    
    return inputNumber
}

func judgeRockScissorsPaperGameResult(comparing userHand: GameOptions, and computerHand: GameOptions?) {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print("이겼습니다!")
        turn = "사용자"
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        print("졌습니다!")
        turn = "컴퓨터"
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        print("비겼습니다!")
        startGame()
    default:
        print("에러")
    }
}

func judgeMukJjiBbaGameResult(comparing userHand: GameOptions, and computerHand: GameOptions?) {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        turn = "사용자"
        print("\(turn)의 턴입니다.")
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        turn = "컴퓨터"
        print("\(turn)의 턴입니다.")
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        print("\(turn)의 승리!")
    default:
        print("에러")
    }
}

func startGame() {
    do {
        printRockScissorsPaperMenu()
        switch GameOptions(rockScissorsPaper: try receiveUserInput()) {
        case .exit:
            print("게임종료")
        case .scissors:
            judgeRockScissorsPaperGameResult(comparing: .scissors, and: GameOptions(rockScissorsPaper: createComputerSelect()))
        case .rock:
            judgeRockScissorsPaperGameResult(comparing: .rock, and: GameOptions(rockScissorsPaper: createComputerSelect()))
        case .paper:
            judgeRockScissorsPaperGameResult(comparing: .paper, and: GameOptions(rockScissorsPaper: createComputerSelect()))
        default:
            throw InputError.invalidNumber
        }
    } catch InputError.invalidNumber {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    } catch {
        print(error)
    }
}

startGame()
