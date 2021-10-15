//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var possibleInputRange: ClosedRange<Int> {
    return 0...RockPaperScissors.allCases.count
}

var isGameRunning = true

enum Script: String, CustomStringConvertible {
    var description: String {
        self.rawValue
    }
    
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case win = "이겼습니다!"
    case loose = "졌습니다!"
    case draw = "비겼습니다!"
    case gameEnd = "게임 종료"
    case dismissedError = "잘못된 입력입니다. 다시 시도해주세요."
    case handPoseOutOfRangeError = "가위바위보와 매칭될 수 있는 유효값이 아닙니다."
}

enum RockPaperScissorsError: Error {
    case dismissedError
    case handPoseOutOfRangeError
}

func receiveUserNumber() throws -> Int {
    guard let input = readLine(), !input.isEmpty else {
        throw RockPaperScissorsError.dismissedError
    }
    
    let filteredInput = input.compactMap { Int(String($0)) }
    guard filteredInput.count == input.count else {
        throw RockPaperScissorsError.dismissedError
    }
    
    guard filteredInput.count == 1, possibleInputRange ~= filteredInput[0] else {
        throw RockPaperScissorsError.dismissedError
    }
    
    return filteredInput[0]
}

func pullComputersHandPose() -> Int {
    return Int.random(in: RockPaperScissors.getRange())
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

func matchHandPose(with number: Int) throws -> RockPaperScissors {
    switch number {
    case 1:
        return .rock
    case 2:
        return .paper
    case 3:
        return .scissors
    default:
        throw RockPaperScissorsError.handPoseOutOfRangeError
    }
}

enum RockPaperScissorsJudgement {
    case win
    case loose
    case draw
}

func matchJudgement(by handPoses: (user: RockPaperScissors, computer: RockPaperScissors)) -> RockPaperScissorsJudgement {
    let (user, computer) = handPoses
    
    if (user == computer) {
        return .draw
    } else if (user == .paper && computer == .scissors ||
               user == .rock && computer == .paper ||
               user == .scissors && computer == .rock) {
        return .loose
    } else {
        return .win
    }
}

func manageRockPaperScissorsGame() {
    while isGameRunning == true {
        do {
            try startRockPaperScissorsGame()
        } catch RockPaperScissorsError.dismissedError {
            print(Script.dismissedError)
        } catch RockPaperScissorsError.handPoseOutOfRangeError {
            print(Script.handPoseOutOfRangeError)
        } catch {
            print(error)
        }
    }
    
    print(Script.gameEnd)
}

func initUserAndComputerHandPose(by userInput: Int) throws -> (user: RockPaperScissors, computer: RockPaperScissors) {
    let computerHandPose: RockPaperScissors = try matchHandPose(with: pullComputersHandPose())
    let userHandPose: RockPaperScissors = try matchHandPose(with: userInput)
    
    return (userHandPose, computerHandPose)
}

func startRockPaperScissorsGame() throws {
    while isGameRunning {
        print(Script.menu, terminator: "")
        
        let userInput = try receiveUserNumber()
        if userInput == 0 {
            isGameRunning = false
            break
        }
    
        let handPoses = try initUserAndComputerHandPose(by: userInput)
        
        let gameResult = matchJudgement(by: handPoses)
        
        switch gameResult {
        case .win:
            print(Script.win)
            isGameRunning = false
        case .loose:
            print(Script.loose)
            isGameRunning = false
        case .draw:
            print(Script.draw)
        }
    }
}

manageRockPaperScissorsGame()
