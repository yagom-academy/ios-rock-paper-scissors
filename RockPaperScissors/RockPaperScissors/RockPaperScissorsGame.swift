//  RockPaperScissors - RockPaperScissorsGame.swift
//  Created by vetto, songjun on 2022.12.27

func makeRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func inputUserNumber() throws -> Int {
    guard let userInput = readLine(), let userNumber = Int(userInput) else {
        throw InputError.invalidInput
    }
    return userNumber
}

func printRockPaperScissorsMenu() {
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

func startRockPaperScissorsGame() {
    do {
        printRockPaperScissorsMenu()
        
        let inputtedNumber = try inputUserNumber()
        
        switch inputtedNumber {
        case 0:
            print("게임 종료")
        case 1, 2, 3:
            let userHand = convertNumberToRockPaperScissors(number: inputtedNumber)
            let computerHand = convertNumberToRockPaperScissors(number: makeRandomComputerNumber())
            let winner = decideRPSWinner(userHand, computerHand)
            
            if winner == .draw {
                printGameResult(winner: winner)
                startRockPaperScissorsGame()
            } else {
                printGameResult(winner: winner)
                startMookZziBbaGame(turn: winner)
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startRockPaperScissorsGame()
        }
    } catch InputError.invalidInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startRockPaperScissorsGame()
    } catch {
        print("Error")
    }
}
