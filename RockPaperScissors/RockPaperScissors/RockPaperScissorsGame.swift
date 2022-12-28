//  RockPaperScissors - RockPaperScissorsGame.swift
//  Created by vetto, songjun on 2022.12.27

func makeRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func inputUserNumber() -> Int {
    printMenu()
    guard let userInput = readLine() else {
        return inputUserNumber()
    }
    guard let userNumber = Int(userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return inputUserNumber()
    }
    return userNumber
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func convertNumberToHand(number: Int) -> ScissorsRockPaper {
    guard let hand = ScissorsRockPaper(rawValue: number) else {
        return ScissorsRockPaper.wrongHand
    }
    return hand
}

func decideWinner(userHand: ScissorsRockPaper, computerHand: ScissorsRockPaper) -> String {
    let winner: String
    
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        winner = "사용자"
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        winner = "컴퓨터"
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        winner = "무승부"
    default:
        print("잘못된 결과입니다.")
        winner = ""
    }
    return winner
}

func printGameResult(winner: String) {
    if winner == "사용자" {
        print("이겼습니다.")
    } else if winner == "컴퓨터" {
        print("졌습니다.")
    } else if winner == "무승부" {
        print("비겼습니다.")
    }
}

func startGame() {
    let inputtedNumber = inputUserNumber()
    
    switch inputtedNumber {
    case 0:
        print("게임 종료")
    case 1,2,3:
        let userHand = convertNumberToHand(number: inputtedNumber)
        let computerHand = convertNumberToHand(number: makeRandomComputerNumber())
        let winner = decideWinner(userHand: userHand, computerHand: computerHand)
        
        if winner == "무승부" {
            printGameResult(winner: winner)
            startGame()
        } else {
            printGameResult(winner: winner)
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

