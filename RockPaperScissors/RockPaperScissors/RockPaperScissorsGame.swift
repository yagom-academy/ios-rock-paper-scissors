//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by EtialMoon & Serena on 2023/05/02.
//

struct RockPaperScissorsGame {
    private let nextGame = MukJjiPaGame()
    
    func startRockPaperScissors() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        selectMenu()
    }
    
    private func selectMenu() {
        guard let input: String = readLine() else {
            print(ErrorMessages.invalidAccess.rawValue)
            return
        }
        
        switch input {
        case HandOptions.scissors.rawValue:
            decideVictory(with: HandOptions.scissors)
        case HandOptions.rock.rawValue:
            decideVictory(with: HandOptions.rock)
        case HandOptions.paper.rawValue:
            decideVictory(with: HandOptions.paper)
        case "0":
            print("게임 종료")
        default:
            print(ErrorMessages.invalidInput.rawValue)
            startRockPaperScissors()
        }
    }
    
    private func makeRival() -> HandOptions? {
        guard let rivalHand: HandOptions = HandOptions.allCases.randomElement() else {
            return nil
        }

        return rivalHand
    }

    private func decideVictory(with userHand: HandOptions) {
        guard let rivalHand: HandOptions = makeRival() else {
            return
        }
        
        if userHand == rivalHand {
            print("비겼습니다!")
            startRockPaperScissors()
        } else if (userHand == .scissors && rivalHand == .paper)
                    || (userHand == .rock && rivalHand == .scissors)
                    || (userHand == .paper && rivalHand == .rock) {
            print("이겼습니다!")
            winner = "사용자"
            nextGame.startMukJjiPa()
        } else {
            print("졌습니다!")
            winner = "컴퓨터"
            nextGame.startMukJjiPa()
        }
    }
}
