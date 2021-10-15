//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var shouldRunGame = true

var validInputRange: ClosedRange<Int> {
    return 0...RockPaperScissors.allCases.count
}

enum Script: String, CustomStringConvertible {
    var description: String {
        self.rawValue
    }
    
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case gameEnd = "게임 종료"
    case dismissedError = "잘못된 입력입니다. 다시 시도해주세요."
    case choiceOutOfRangeError = "가위바위보와 매칭될 수 있는 유효값이 아닙니다."
}

enum RockPaperScissorsGameError: Error {
    case invalidInput
    case choiceOutOfRange
}

enum RockPaperScissorsJudgement {
    case win
    case lose
    case draw
}

enum RockPaperScissors: CaseIterable {
    // 가위 바위 보 외의 case가 추가된다면 게임 결과를 계산해줄 matchJudgement와 matchHandPose 또한 업데이트 해야합니다.
    case rock
    case paper
    case scissors
    
    static func getRange() -> ClosedRange<Int> {
        return 1...Self.allCases.count
    }
}

func manageRockPaperScissorsGame() {
    while shouldRunGame {
        do {
            try startRockPaperScissorsGame()
        } catch RockPaperScissorsGameError.invalidInput {
            print(Script.dismissedError)
        } catch RockPaperScissorsGameError.choiceOutOfRange {
            print(Script.choiceOutOfRangeError)
        } catch {
            print(error)
        }
    }
    
    print(Script.gameEnd)
}

func startRockPaperScissorsGame() throws {
    while shouldRunGame {
        print(Script.menu, terminator: "")
        
        let userInput = try receiveUserNumber()
        if userInput == 0 {
            shouldRunGame = false
            break
        }
        
        let choices = try initUserAndComputerChoice(by: userInput)
        
        let gameResult = gameJudgement(by: choices)
        
        switch gameResult {
        case .win:
            print(Script.win)
            shouldRunGame = false
        case .lose:
            print(Script.lose)
            shouldRunGame = false
        case .draw:
            print(Script.draw)
        }
    }
}


/// 사용자 입력을 받아서 타입을 변환하고 유효성을 검증하여 사용자 숫자를 반환합니다.
/// - Throws: 잘못된 입력 오류
/// - Returns: 사용자 숫자
func receiveUserNumber() throws -> Int {
    guard let input = readLine(), !input.isEmpty else {
        throw RockPaperScissorsGameError.invalidInput
    }
    
    let filteredInput = input.compactMap { Int(String($0)) }
    guard filteredInput.count == input.count else {
        throw RockPaperScissorsGameError.invalidInput
    }
    
    guard filteredInput.count == 1, validInputRange ~= filteredInput[0] else {
        throw RockPaperScissorsGameError.invalidInput
    }
    
    return filteredInput[0]
}

func initUserAndComputerChoice(by userInput: Int) throws -> (user: RockPaperScissors, computer: RockPaperScissors) {
    let computerChoice: RockPaperScissors = try matchChoice(with: selectComputersChoice())
    let userChoice: RockPaperScissors = try matchChoice(with: userInput)
    
    return (userChoice, computerChoice)
}

func matchChoice(with number: Int) throws -> RockPaperScissors {
    switch number {
    case 1:
        return .rock
    case 2:
        return .paper
    case 3:
        return .scissors
    default:
        throw RockPaperScissorsGameError.choiceOutOfRange
    }
}

func selectComputersChoice() -> Int {
    return Int.random(in: RockPaperScissors.getRange())
}

func gameJudgement(by choice: (user: RockPaperScissors, computer: RockPaperScissors)) -> RockPaperScissorsJudgement {
    let (user, computer) = choice
    
    if (user == computer) {
        return .draw
    } else if (user == .paper && computer == .scissors ||
               user == .rock && computer == .paper ||
               user == .scissors && computer == .rock) {
        return .lose
    } else {
        return .win
    }
}

manageRockPaperScissorsGame()
