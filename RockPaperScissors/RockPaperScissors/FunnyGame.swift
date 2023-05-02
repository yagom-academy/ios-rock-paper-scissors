//
//  FunnyGame.swift
//  RockPaperScissors
//
//  Created by EtialMoon & Serena on 2023/05/02.
//

struct FunnyGame {
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        selectMenu()
    }
    
    private func selectMenu() {
        guard let input: String = readLine() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
            return
        }
        
        switch input {
        case HandOptions.scissors.rawValue:
            compareHand(HandOptions.scissors, with: HandOptions.rock)
        case HandOptions.rock.rawValue:
            compareHand(HandOptions.rock, with: HandOptions.paper)
        case HandOptions.paper.rawValue:
            compareHand(HandOptions.paper, with: HandOptions.scissors)
        case "0":
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
        }
    }
    
    private func makeRival() throws -> HandOptions {
        guard let rivalHand: HandOptions = HandOptions.allCases.randomElement() else {
            throw Errors.invalidRival
        }
        
        return rivalHand
    }

    private func compareHand(_ userHand: HandOptions, with trialHand: HandOptions) {
        let rivalHand: HandOptions
        
        do {
            rivalHand = try makeRival()
        } catch {
            print("가위바위보가 성립하지 않습니다.")
            return
        }
        
        let result = rivalHand == userHand ? "비겼습니다." :
        rivalHand == trialHand ? "졌습니다." :
        "이겼습니다!"
        print("\(result)")
        
        if result == "비겼습니다." {
            startGame()
        }
    }
}
