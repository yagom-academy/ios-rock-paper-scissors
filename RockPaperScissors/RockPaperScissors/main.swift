//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Player = (displayName: String, isComputer: Bool)

var isGameEnd = false
let exitNumber = 0
let validMenuNumbers = [0, 1, 2, 3]

enum MukJJiPPa: Int, CaseIterable {
    case muk = 1
    case jji
    case ppa
    
    static func generateRandomHand() -> MukJJiPPa {
        return MukJJiPPa.allCases.randomElement() ?? .muk
    }
    
    var menuNumber: Int {
        return self.rawValue
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
        return self.rawValue
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

func showMukJJiPPaMenu(displayName: String) {
    print("[\(displayName)의 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
}

func showMukJJiPPaTurn(of displayName: String) {
    print("\(displayName)의 턴 입니다.")
}

func showMukJJiPPaVictoryMessage(of displayName: String) {
    print("\(displayName)의 승리!")
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

    guard let userInput = readLine(),
          let convertedUserInput = Int(userInput),
          validMenuNumbers.contains(convertedUserInput) else {
        showWrongInputMessage()
        return receiveUserInputNumber()
    }
    return convertedUserInput
}

func playMukJJiPPaGame(turnUser: Player, opponent: Player) {
    showMukJJiPPaMenu(displayName: turnUser.displayName)
    
    guard let userInput = readLine(),
          let convertedUserInput = Int(userInput),
          validMenuNumbers.contains(convertedUserInput) else {
        showWrongInputMessage()
        if turnUser.isComputer == true {
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
    let (turnUserHand, opponentHand) = turnUser.isComputer == true ? (computerHand, userHand) : (userHand, computerHand)
    let gameResult: GameResult = turnUserHand.playMukJJiPPa(against: opponentHand)
    
    switch gameResult {
    case .tie:
        showMukJJiPPaVictoryMessage(of: turnUser.displayName)
    case .lose:
        showMukJJiPPaTurn(of: opponent.displayName)
        playMukJJiPPaGame(turnUser: opponent, opponent: turnUser)
    case .win:
        showMukJJiPPaTurn(of: turnUser.displayName)
        playMukJJiPPaGame(turnUser: turnUser, opponent: opponent)
    }
}

func rockPaperScissorsGame() {
    while true {
        let userInputNumber = receiveUserInputNumber()
        if userInputNumber == exitNumber {
            showGameEndMessage()
            return
        }
        if let userHand = RockPaperScissors(rawValue: userInputNumber) {
            let computerHand = RockPaperScissors.generateRandomHand()
            let gameResult = userHand.playRockScissorsPaper(against: computerHand)

            gameResult.showGameResultMessage()
            
            if gameResult == .win {
                playMukJJiPPaGame(turnUser: (displayName: "사용자", isComputer: false) , opponent: (displayName: "컴퓨터", isComputer: true))
            } else if gameResult == .lose {
                playMukJJiPPaGame(turnUser: (displayName: "컴퓨터", isComputer: true), opponent: (displayName: "사용자", isComputer: false))
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
