//
//  RockPaperScissors - main.swift
//  Created by papri,Taeangel
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum Hand: CaseIterable {
    case scissors, rock , paper
    
    static func makeMukJiPa(inputValue: String) -> Hand {
        let handValue: Hand
        
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
    
    static func makeRockScissorsPaper(_ inputValue: String) -> Hand {
        let handValue: Hand
        
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

enum MatchResult {
    case win, lose, draw
}

enum MessagePrint {
    static let userWinMessege = "사용자가 승리했습니다"
    static let computerWinMessege = "컴퓨터가 승리했습니다"
    static let drawMessege = "비겼습니다"
    static let prgramExitMessege = "프로그램 종료"
    static let inputErrorMessege = "입력이 잘못되었습니다"
    static let rockPaperScissorsDisplay = "가위(1),바위(2),보(3)!<종료 :0>: "
    static let gameErrorMessege = "게임을 실행할 수 없습니다"
    static let mukJiPaDisplay = " 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    static let userTurn = "[사용자 턴]"
    static let computerTurn = "[컴퓨터 턴]"
}

func startProgram() {
    print(MessagePrint.rockPaperScissorsDisplay, terminator: "")
    let inputValue = inputValue()
    
    switch inputValue {
    case "0":
        print(MessagePrint.prgramExitMessege)
        break
    case "1", "2", "3":
        let userHand = Hand.makeRockScissorsPaper(inputValue)
        playMukJiPaGame(userHand)
    default:
        print(MessagePrint.inputErrorMessege)
        startProgram()
    }
}

func playMukJiPaGame(_ userInput: Hand) {
    let userResult = makeMatchResult(userHand: userInput)
    if userResult != MatchResult.draw {
        chooseMukJiPaOption(userResult: userResult)
    }
}

func makeMatchResult(userHand: Hand) -> MatchResult {
    let computerHand = makeComputerHand()
    let userResult = compare(userHand, to: computerHand)
    return userResult
}

func compare(_ userHand: Hand,to computerHand: Hand) -> MatchResult {
    var userResult: MatchResult
    
    if userHand == computerHand {
        userResult = .draw
        print(MessagePrint.drawMessege)
        startProgram()
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

func makeComputerHand() -> Hand {
    guard let computerHand = Hand.allCases.randomElement() else {
        print(MessagePrint.gameErrorMessege)
        return .scissors
    }
    return computerHand
}

func checkUserMatchResult(_ userHand: Hand, _ computerHand: Hand) -> MatchResult {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return .win
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        return .lose
    default:
        return .draw
    }
}

func chooseMukJiPaOption(userResult: MatchResult) {
    printTurn(with: userResult)
    var userResult = userResult
    let inputValue = inputValue()
    
    switch inputValue {
       case "0":
           print(MessagePrint.prgramExitMessege)
           break
       case "1", "2", "3":
        let userHand = Hand.makeMukJiPa(inputValue: inputValue)
           playMukJiPa(userHand, userResult)
       default:
           userResult = .lose
           print(MessagePrint.inputErrorMessege)
           chooseMukJiPaOption(userResult: userResult)
       }
}

func printTurn(with userResult: MatchResult) {
    if userResult == .lose {
        print(MessagePrint.computerTurn + MessagePrint.mukJiPaDisplay, terminator: "")
    } else if userResult == .win {
        print(MessagePrint.computerTurn + MessagePrint.mukJiPaDisplay, terminator: "")
    }
}

func playMukJiPa(_ userInput: Hand, _ userResult: MatchResult) {
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
        printWinner(with: userResult)
    }
}

func printWinner(with userResult: MatchResult) {
    if userResult == .lose {
        print(MessagePrint.computerWinMessege)
    } else if userResult == .win {
        print(MessagePrint.userWinMessege)
    }
    print(MessagePrint.prgramExitMessege)
}

startProgram()

