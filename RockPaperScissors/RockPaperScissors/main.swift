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
    
    init?(rawValue: Int) {
          switch rawValue {
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
}

enum GameMessage {
    static let rockScissorsPaper = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
}

func createComputerSelect() -> GameOptions {
    guard let computerHand = GameOptions(rawValue: Int.random(in: 1...3)) else {
        return createComputerSelect()
    }
    
    return computerHand
}

func printMenu() {
    print(GameMessage.rockScissorsPaper, terminator: "")
}

func receiveUserInput() throws -> Int {
    guard let input = readLine(), let inputNumber = Int(input) else {
        throw InputError.invalidNumber
    }
    
    return inputNumber
}

func judgeGameResult(comparing userHand: GameOptions, and computerHand: GameOptions) {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print("이겼습니다!")
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        print("졌습니다!")
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        print("비겼습니다!")
        play()
    default:
        print("에러")
    }
}

func play() {
    do {
        printMenu()
        switch GameOptions(rawValue: try receiveUserInput()) {
        case .exit:
            print("게임종료")
        case .scissors:
            judgeGameResult(comparing: .scissors, and: createComputerSelect())
        case .rock:
            judgeGameResult(comparing: .rock, and: createComputerSelect())
        case .paper:
            judgeGameResult(comparing: .paper, and: createComputerSelect())
        default:
            throw InputError.invalidNumber
        }
    } catch InputError.invalidNumber {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        play()
    } catch {
        print(error)
    }
}

play()
