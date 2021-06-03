//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var isGameEnd = false
let exitNumber = 0

enum MukJJiPPa: Int, CaseIterable {
    case muk = 1
    case jji
    case ppa
    
    static func generateRandomHand() -> MukJJiPPa {
        return MukJJiPPa.allCases.randomElement() ?? .muk
    }
    
    var menuNumber: Int {
        switch self {
        case .muk:
            return 1
        case .jji:
            return 2
        case .ppa:
            return 3
        }
    }
    
    func playMukJJiPPa(against opponent: MukJJiPPa) -> GameResult {
        let numberGap = self.menuNumber - opponent.menuNumber
        let winNumberGaps = [2, -1]
        let tieNumberGaps = [0]
        
        if winNumberGaps.contains(numberGap) {
            return .win
        }
        if tieNumberGaps.contains(numberGap) {
            return .tie
        }
        return .lose
    }
}

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock
    case paper
    
    static func generateRandomHand() -> RockPaperScissors {
        return RockPaperScissors.allCases.randomElement() ?? .rock
    }
    
    var menuNumber: Int {
        switch self {
        case .scissors:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
    
    func playRockScissorsPaper(against opponent: RockPaperScissors) -> GameResult {
        let numberGap = self.menuNumber - opponent.menuNumber
        let winNumberGaps = [1, -2]
        let tieNumberGaps = [0]
        
        if winNumberGaps.contains(numberGap) {
            return .win
        }
        if tieNumberGaps.contains(numberGap) {
            return .tie
        }
        return .lose
    }
}

enum GameResult {
    case win
    case lose
    case tie
    
    func showGameResultMessage() {
        switch self {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .tie:
            print("비겼습니다!")
        }
    }
}

func showRockPaperScissorsMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func showMukJJiPPaMenu(turnUser: String) {
    print("[\(turnUser)의 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
}

func showWrongInputMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func showSystemErrorMessage() {
    print("알수 없는 없는 오류가 발생하였습니다. 다시 시도해주세요.")
}

func showGameEndMessage() {
    print("게임 종료")
}

func receiveUserInputNumber() -> Int {
    showRockPaperScissorsMenu()
    let minMenuNumber = 0
    let maxMenuNumber = 3
    guard let userInput = readLine(),
          let convertedUserInput = Int(userInput),
          (minMenuNumber...maxMenuNumber).contains(convertedUserInput) else {
        showWrongInputMessage()
        return receiveUserInputNumber()
    }
    return convertedUserInput
}

func playMukJJiPPaGame(turnUser: String, opponent: String) {
    showMukJJiPPaMenu(turnUser: turnUser)
    
    let minMenuNumber = 0
    let maxMenuNumber = 3
    guard let userInput = readLine(),
          let convertedUserInput = Int(userInput),
          (minMenuNumber...maxMenuNumber).contains(convertedUserInput) else {
        showWrongInputMessage()
        if turnUser == "컴퓨터" {
            playMukJJiPPaGame(turnUser: turnUser, opponent: opponent)
        } else {
            playMukJJiPPaGame(turnUser: opponent, opponent: turnUser)
        }
        return
    }
    
    if convertedUserInput == 0 {
        isGameEnd = true
        showGameEndMessage()
        return
    }
    
    guard let userHand = MukJJiPPa(rawValue: convertedUserInput) else {
        showSystemErrorMessage()
        playMukJJiPPaGame(turnUser: turnUser, opponent: opponent)
        return
    }
    
    let computerHand = MukJJiPPa.generateRandomHand()
    
    let (turnUserHand, opponentHand) = turnUser == "사용자" ? (userHand, computerHand) : (computerHand, userHand)
    
    let gameResult: GameResult = turnUserHand.playMukJJiPPa(against: opponentHand)
    switch gameResult {
    case .tie:
        print("\(turnUser)의 승리!")
    case .lose:
        print("\(opponent)의 턴 입니다.")
        playMukJJiPPaGame(turnUser: opponent, opponent: turnUser)
    case .win:
        print("\(turnUser)의 턴 입니다.")
        playMukJJiPPaGame(turnUser: turnUser, opponent: opponent)
    }
}

func rockPaperScissorsGame() {
    while true {
        let userInputNumber: Int = receiveUserInputNumber()
        if userInputNumber == exitNumber {
            showGameEndMessage()
            return
        }
        if let userHand = RockPaperScissors(rawValue: userInputNumber) {
            let computerHand = RockPaperScissors.generateRandomHand()
            let gameResult: GameResult = userHand.playRockScissorsPaper(against: computerHand)

            gameResult.showGameResultMessage()
            
            if gameResult == .win {
                playMukJJiPPaGame(turnUser: "사용자", opponent: "컴퓨터")
            } else if gameResult == .lose {
                playMukJJiPPaGame(turnUser: "컴퓨터", opponent: "사용자")
            }
            
            if(isGameEnd == true) {
                return
            }
        } else {
            showWrongInputMessage()
        }
    }
}

rockPaperScissorsGame()
