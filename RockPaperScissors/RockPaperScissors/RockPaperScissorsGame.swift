//  RockPaperScissors - RockPaperScissorsGame.swift
//  Created by vetto, songjun on 2022.12.27

func printRockPaperScissorsMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func convertNumberToRockPaperScissors(number: Int) -> RockPaperScissors {
    guard let hand = RockPaperScissors(rawValue: number) else {
        return RockPaperScissors.wrongHand
    }
    return hand
}

func decideRockPaperScissorWinner(_ userHand: RockPaperScissors,
                                  _ computerHand: RockPaperScissors) -> Winner {
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return .user
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        return .computer
    default:
        return .draw
    }
}

func printRockPaperScissorsGameResult(winner: Winner) {
    if winner == .user {
        print("이겼습니다.")
    } else if winner == .computer {
        print("졌습니다.")
    } else {
        print("비겼습니다.")
    }
}

func startRockPaperScissorsGame() -> Winner? {
    do {
        printRockPaperScissorsMenu()
        
        let inputtedNumber = try inputUserNumber()
        
        switch inputtedNumber {
        case 0:
            return nil
        case 1, 2, 3:
            let userHand = convertNumberToRockPaperScissors(number: inputtedNumber)
            let computerHand = convertNumberToRockPaperScissors(number: makeRandomComputerNumber())
            let winner = decideRockPaperScissorWinner(userHand, computerHand)
            
            if winner == .draw {
                printRockPaperScissorsGameResult(winner: winner)
                return startRockPaperScissorsGame()
            } else {
                printRockPaperScissorsGameResult(winner: winner)
                return winner
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return startRockPaperScissorsGame()
        }
    } catch InputError.invalidInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startRockPaperScissorsGame()
    } catch {
        print(error)
        return nil
    }
}
