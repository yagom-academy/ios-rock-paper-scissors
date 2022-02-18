//
//  RockPaperScissors - main.swift
//  Created by papri,Taeangel
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum HandType: CaseIterable {
    case scissors, rock , paper
    
    static func makeMukJiPa(inputValue: String) -> HandType {
        let handValue: HandType
        
        switch inputValue {
        case "1":
            handValue = .rock
        case "2":
            handValue = .scissors
        case "3":
            handValue = .paper
        default:
            handValue = .rock
        }
        return handValue
    }
    
    static func makeRockScissorsPaper(_ inputValue: String) -> HandType {
        let handValue: HandType
        
        switch inputValue {
        case "1":
            handValue = .scissors
        case "2":
            handValue = .rock
        case "3":
            handValue = .paper
        default:
            handValue = .rock
        }
        return handValue
    }
}

enum MatchType {
    case win, lose, draw
}

enum MessagePrint {
    static let userWinMessege = "사용자가 승리했습니다"
    static let computerWinMessege = "컴퓨터가 승리했습니다"
    static let drawMessege = "비겼습니다"
    static let prgramExitMessege = "프로그램 종료"
    static let inputErrorMessege = "입력이 잘못되었습니다"
    static let menuDisplay = "가위(1),바위(2),보(3)!<종료 :0>: "
    static let gameErrorMessege = "게임을 실행할 수 없습니다"
    static let userTurn = "[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    static let computerTurn = "[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
}

func chooseGameOption() {
    print(MessagePrint.menuDisplay, terminator: "")
    let inputValue = inputValue()
    
    switch inputValue {
    case "0":
        print(MessagePrint.prgramExitMessege)
        break
    case "1", "2", "3":
        let userHand = HandType.makeRockScissorsPaper(inputValue)
        playMukJiPaGame(userHand)
    default:
        print(MessagePrint.inputErrorMessege)
        chooseGameOption()
    }
}

func playMukJiPaGame(_ userInput: HandType) {
    let userResult = makeMatchResult(userHand: userInput)
    if userResult != MatchType.draw {
        chooseMukJiPaOption(userResult: userResult)
    }
}

func makeMatchResult(userHand: HandType) -> MatchType {
    let computerHand = makeComputerHand()
    let userResult = compareHand(userHand: userHand, to: computerHand)
    return userResult
}

func compareHand(userHand: HandType,to computerHand: HandType) -> MatchType {
    var userResult: MatchType
    
    if userHand == computerHand {
        userResult = .draw
        print(MessagePrint.drawMessege)
        chooseGameOption()
    } else if checkUserMatchResult(userHand, computerHand) == .win {
        print(MessagePrint.userWinMessege)
        userResult = .win
    } else {
        print(MessagePrint.computerWinMessege)
        userResult = .lose
    }
    return userResult
}

func inputValue() -> String {
    guard let inputValue = readLine() else {
        print(MessagePrint.inputErrorMessege)
        return ""
    }
    return inputValue
}

func makeComputerHand() -> HandType {
    guard let computerHand = HandType.allCases.randomElement() else {
        print(MessagePrint.gameErrorMessege)
        return .scissors
    }
    return computerHand
}

func checkUserMatchResult(_ userHand: HandType, _ computerHand: HandType) -> MatchType {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return .win
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        return .lose
    default:
        return .draw
    }
}

func chooseMukJiPaOption(userResult: MatchType) {
    printTurn(userResult)
    let inputValue = inputValue()
    
    switch inputValue {
       case "0":
           print(MessagePrint.prgramExitMessege)
           break
       case "1", "2", "3":
        let userHand = HandType.makeMukJiPa(inputValue: inputValue)
           playMukJiPa(userHand, userResult)
       default:
           print(MessagePrint.inputErrorMessege)
           chooseMukJiPaOption(userResult: userResult)
       }
}

func printTurn(_ userResult: MatchType) {
    if userResult == .lose {
        print(MessagePrint.computerTurn, terminator: "")
    } else if userResult == .win {
        print(MessagePrint.userTurn, terminator: "")
    }
}

func playMukJiPa(_ userInput: HandType, _ userResult: MatchType) {
    var userResult = userResult
    let computerHand = makeComputerHand()
    
    if checkUserMatchResult(userInput, computerHand) == .win {
        print("사용자턴입니다")
        userResult = .win
        chooseMukJiPaOption(userResult: userResult)
    } else if checkUserMatchResult(userInput, computerHand) == .lose {
        print("컴퓨터턴입니다")
        userResult = .lose
        chooseMukJiPaOption(userResult: userResult)
    } else {
        printWinner(userResult)
    }
}

func printWinner(_ userResult: MatchType) {
    if userResult == .lose {
        print(MessagePrint.computerWinMessege)
    } else if userResult == .win {
        print(MessagePrint.userWinMessege)
    }
    print(MessagePrint.prgramExitMessege)
}

chooseGameOption()

