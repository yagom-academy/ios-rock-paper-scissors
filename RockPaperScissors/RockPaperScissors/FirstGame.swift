//
//  FirstGame.swift
//  RockPaperScissors
//
//  Created by EtialMoon & Serena on 2023/05/02.
//

struct FirstGame {
    var secondGame = SecondGame()
    
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        selectMenu()
    }
    
    private func selectMenu() {
        guard let input: String = readLine() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return
        }
        
        switch input {
        case HandOptions.scissors.rawValue:
            compareHand(with: HandOptions.scissors)
        case HandOptions.rock.rawValue:
            compareHand(with: HandOptions.rock)
        case HandOptions.paper.rawValue:
            compareHand(with: HandOptions.paper)
        case "0":
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
        }
    }
    
    private func makeRival() -> HandOptions? {
        guard let rivalHand: HandOptions = HandOptions.allCases.randomElement() else {
            return nil
        }

        return rivalHand
    }

    private func compareHand(with userHand: HandOptions) {
        guard let rivalHand: HandOptions = makeRival() else {
            return
        }
        
        if userHand == rivalHand {
            print("비겼습니다!")
            startGame()
        } else if (userHand == .scissors && rivalHand == .paper)
                    || (userHand == .rock && rivalHand == .scissors)
                    || (userHand == .paper && rivalHand == .rock) {
            print("이겼습니다!")
            winner = "사용자"
            secondGame.startMukjjipa()
        } else {
            print("졌습니다!")
            winner = "컴퓨터"
            secondGame.startMukjjipa()
        }
    }
}
