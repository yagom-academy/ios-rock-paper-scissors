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

func convertNumberToRockPaperScissors(number: Int) -> ScissorsRockPaper {
    guard let hand = ScissorsRockPaper(rawValue: number) else {
        return ScissorsRockPaper.wrongHand
    }
    return hand
}

func decideRPSWinner(_ userHand: ScissorsRockPaper, _ computerHand: ScissorsRockPaper) -> Winner {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return Winner.user
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        return Winner.computer
    default:
        return Winner.draw
    }
}

func printGameResult(winner: Winner) {
    if winner == .user {
        print("이겼습니다.")
    } else if winner == .computer {
        print("졌습니다.")
    } else {
        print("비겼습니다.")
    }
}

func startGame() {
    let inputtedNumber = inputUserNumber()
    
    switch inputtedNumber {
    case 0:
        print("게임 종료")
    case 1, 2, 3:
        let userHand = convertNumberToRockPaperScissors(number: inputtedNumber)
        let computerHand = convertNumberToRockPaperScissors(number: makeRandomComputerNumber())
        let winner = decideRPSWinner(userHand, computerHand)
        
        if winner == .draw {
            printGameResult(winner: winner)
            startGame()
        } else {
            printGameResult(winner: winner)
            
            // 이쪽 로직에서 묵찌빠 실행하기
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}
