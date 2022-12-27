//
//  RockPaperScissors - main.swift
//  Created by sehong, kaki.
//  Copyright © yagom academy. All rights reserved.
//
enum InputError: Error {
    case invalidNumber
}

enum GameOptions {
    case scissors
    case rock
    case paper
    
    init?(rockScissorsPaper: Int) {
          switch rockScissorsPaper {
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

enum GameResult {
    case win
    case lose
    case draw
    
    var message: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
}
enum Player {
    static let user = "사용자"
    static let computer = "컴퓨터"
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
        print(GameResult.win.message)
        turn = Player.user
        startMukJjiBbaGame()
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        print(GameResult.lose.message)
        turn = Player.computer
        startMukJjiBbaGame()
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        print(GameResult.draw.message)
        startGame()
    default:
        print("에러 발생")
    }
}

func judgeMukJjiBbaGameResult(comparing userHand: GameOptions, and computerHand: GameOptions?) {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        turn = Player.user
        print("\(turn)의 턴입니다.")
        startMukJjiBbaGame()
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        turn = Player.computer
        print("\(turn)의 턴입니다.")
        startMukJjiBbaGame()
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        print("\(turn)의 승리!")
    default:
        print("에러")
    }
}

func startMukJjiBbaGame() {
    do {
        printMukJjiBbaMenu()
        let userInput = try receiveUserInput()
        guard userInput != 0 else {
            print("게임종료")
            return
        }
        switch GameOptions(mukJjiBba: userInput) {
        case .rock:
            judgeMukJjiBbaGameResult(comparing: .rock, and: GameOptions(mukJjiBba: createComputerSelect()))
        case .scissors:
            judgeMukJjiBbaGameResult(comparing: .scissors, and: GameOptions(mukJjiBba: createComputerSelect()))
        case .paper:
            judgeMukJjiBbaGameResult(comparing: .paper, and: GameOptions(mukJjiBba: createComputerSelect()))
        default:
            throw InputError.invalidNumber
        }
    }
    catch InputError.invalidNumber {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startMukJjiBbaGame()
    }
    catch {
        print(error)
    }
}

func startGame() {
    do {
        printRockScissorsPaperMenu()
        let userInput = try receiveUserInput()
        guard userInput != 0 else {
            print("게임종료")
            return
        }
        switch GameOptions(rockScissorsPaper: userInput) {
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
