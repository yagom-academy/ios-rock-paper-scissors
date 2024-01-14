//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum GameResult {
    case win
    case draw
    case lose
}

enum Hand {
    case scissor
    case rock
    case paper
}

enum Turn {
    case user
    case computer
    
    var name: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        }
    }
}

enum InputError: Error {
    case reachEndOfFile
    case invalidInput
}

func convertRockPaperScissorNumberToHand(number: Int) -> Hand {
    switch number {
    case 1:
        return .scissor
    case 2:
        return .rock
    default:
        return .paper
    }
}

func convertMukChiPpaNumberToHand(number: Int) -> Hand {
    switch number {
    case 1:
        return .rock
    case 2:
        return .scissor
    default:
        return .paper
    }
}

func calculateGameResult(userHand: Hand, computerHand: Hand) -> GameResult {
    switch (userHand, computerHand) {
    case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
        return .win
    case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
        return .draw
    default:
        return .lose
    }
}

func readUserInput() throws -> String {
    guard let userInput = readLine() else {
        throw InputError.reachEndOfFile
    }
    
    switch userInput {
    case "0", "1", "2", "3":
        return userInput
    default:
        throw InputError.invalidInput
    }
}

func playRockPaperScissor() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    let userInput: String
    
    do {
        userInput = try readUserInput()
    } catch InputError.reachEndOfFile {
        print("유효하지 않은 입력입니다. 프로그램을 종료합니다.")
        return
    } catch InputError.invalidInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playRockPaperScissor()
    } catch {
        print("Unexpected Error: \(error).")
        return
    }
    
    guard let userNumber = Int(userInput), userNumber != 0 else {
        print("게임 종료")
        return
    }
    
    let computerNumber = Int.random(in: 1...3)
    
    let userHand = convertRockPaperScissorNumberToHand(number: userNumber)
    let computerHand = convertRockPaperScissorNumberToHand(number: computerNumber)
    
    switch calculateGameResult(userHand: userHand, computerHand: computerHand) {
    case .win:
        print("이겼습니다!")
        return playMukChiPpa(currentTurn: .user)
    case .draw:
        print("비겼습니다!")
        return playRockPaperScissor()
    case .lose:
        print("졌습니다!")
        return playMukChiPpa(currentTurn: .computer)
    }
}

func playMukChiPpa(currentTurn: Turn) {
    print("[\(currentTurn.name) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    
    let userInput: String
    
    do {
        userInput = try readUserInput()
    } catch InputError.reachEndOfFile{
        print("유효하지 않은 입력입니다. 프로그램을 종료합니다.")
        return
    }  catch InputError.invalidInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playMukChiPpa(currentTurn: .computer)
    } catch {
        print("Unexpected Error: \(error).")
        return
    }
    
    guard let userNumber = Int(userInput), userNumber != 0 else {
        print("게임 종료")
        return
    }
    let computerNumber = Int.random(in: 1...3)
    
    let userHand = convertMukChiPpaNumberToHand(number: userNumber)
    let computerHand = convertMukChiPpaNumberToHand(number: computerNumber)
    
    switch calculateGameResult(userHand: userHand, computerHand: computerHand) {
    case .win:
        print("사용자의 턴입니다.")
        return playMukChiPpa(currentTurn: .user)
    case .draw:
        print("\(currentTurn.name)의 승리!")
        return
    case .lose:
        print("컴퓨터의 턴입니다.")
        return playMukChiPpa(currentTurn: .computer)
    }
}

playRockPaperScissor()
