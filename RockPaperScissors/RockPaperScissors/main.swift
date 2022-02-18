//
//  RockPaperScissors - main.swift
//  Created by papri,Taeangel
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum Hand: CaseIterable {
    case scissors, rock , paper
}

enum MatchResults {
    case win, lose, draw
}

enum MessegePrint {
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

func playGame() {
    let exitNumber = "0"
    print(MessegePrint.menuDisplay, terminator: "")
    let (userInput, userInputNumber) = makeRockScissorsPaper()
    
    if userInputNumber == exitNumber {
        print(MessegePrint.prgramExitMessege)
    } else {
        startGame(userInput)
        
    }
}

func startGame(_ userInput: Hand?) {
    guard let userInput = userInput else {
        print(MessegePrint.inputErrorMessege)
        playGame()
        return
    }
    let userResult = playRockPaperScissors(userHand: userInput)
    startMukJiPa(userResult: userResult)
}

func inputValue() -> String {
    guard let inputValue = readLine() else {
        print(MessegePrint.inputErrorMessege)
        return ""
    }
    return inputValue
}

func makeRockScissorsPaper() -> (Hand?, String) {
    let handValue: Hand
    let inputValue = inputValue()
    
    switch inputValue {
    case "1":
        handValue = .scissors
    case "2":
        handValue = .rock
    case "3":
        handValue = .paper
    default:
        return (nil, inputValue)
    }
    return (handValue, inputValue)
}

func makeComputerHand() -> Hand {
    guard let computerHand = Hand.allCases.randomElement() else {
        print(MessegePrint.gameErrorMessege)
        return .scissors
    }
    return computerHand
}

func checkUserWinCondition(_ userHand: Hand, _ computerHand: Hand) -> Bool {
    let scissorsPaper = userHand == Hand.scissors && computerHand == Hand.paper
    let rockScissors = userHand == Hand.rock && computerHand == Hand.scissors
    let paperRock =  userHand == Hand.paper && computerHand == Hand.rock
    return scissorsPaper || rockScissors || paperRock
}

func checkUserLoseCondition(_ userHand: Hand, _ computerHand: Hand) -> Bool {
    let scissorsRock = userHand == Hand.scissors && computerHand == Hand.rock
    let rockPaper = userHand == Hand.rock && computerHand == Hand.paper
    let paperScissors =  userHand == Hand.paper && computerHand == Hand.scissors
    return scissorsRock || rockPaper || paperScissors
}

func compareHand(userHand: Hand,to computerHand: Hand) -> MatchResults {
    var userResult: MatchResults
    
    if userHand == computerHand {
        userResult = .draw
        print(MessegePrint.drawMessege)
        playGame()
    } else if checkUserWinCondition(userHand, computerHand) {
        print(MessegePrint.userWinMessege)
        userResult = .win
    } else {
        print(MessegePrint.computerWinMessege)
        userResult = .lose
    }
    return userResult
}

func playRockPaperScissors(userHand: Hand) -> MatchResults {
    let computerHand = makeComputerHand()
    let userResult = compareHand(userHand: userHand, to: computerHand)
    return userResult
}

func startMukJiPa(userResult: MatchResults) {
    var userResult = userResult
    let exitNumber = "0"
    printTurn(userResult)
    
    let (userInput, userInputNumber) = makeMukJiPa()
    if userInputNumber == exitNumber {
        print(MessegePrint.prgramExitMessege)
    } else {
        guard let userInput = userInput else {
            print(MessegePrint.inputErrorMessege)
            userResult = .lose
            startMukJiPa(userResult: userResult)
            return
        }
        playMukJiPa(userInput, userResult)
    }
}

func printTurn(_ userResult: MatchResults) {
    if userResult == .lose {
        print(MessegePrint.computerTurn, terminator: "")
    }else if userResult == .win{
        print(MessegePrint.userTurn, terminator: "")
    }
}

func playMukJiPa(_ userInput: Hand, _ userResult: MatchResults) {
    var userResult = userResult
    let computerHand = makeComputerHand()
    
    if checkUserWinCondition(userInput, computerHand) {
        print("사용자턴입니다")
        userResult = .win
        startMukJiPa(userResult: userResult)
    } else if checkUserLoseCondition(userInput, computerHand) {
        print("컴퓨터턴입니다")
        userResult = .lose
        startMukJiPa(userResult: userResult)
    } else {
        printWinner(userResult)
    }
}

func printWinner(_ userResult: MatchResults) {
    if userResult == .lose {
        print(MessegePrint.computerWinMessege)
    } else if userResult == .win {
        print(MessegePrint.userWinMessege)
    }
    print(MessegePrint.prgramExitMessege)
}

func makeMukJiPa() -> (Hand?, String) {
    let handValue: Hand
    let inputValue = inputValue()
    
    switch inputValue {
    case "1":
        handValue = Hand.rock
    case "2":
        handValue = Hand.scissors
    case "3":
        handValue = Hand.paper
    default:
        return (nil, inputValue)
    }
    return (handValue, inputValue)
}

playGame()

