//
//  FunnyGame.swift
//  RockPaperScissors
//
//  Created by EtialMoon & Serena on 2023/05/02.
//

struct FunnyGame {
    private var winner: String = ""
    
    mutating func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        selectMenu()
    }
    
    private mutating func selectMenu() {
        guard let input: String = readLine() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
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
    
    private func makeRival() throws -> HandOptions {
        guard let rivalHand: HandOptions = HandOptions.allCases.randomElement() else {
            throw Errors.invalidRival
        }
        
        return rivalHand
    }

    private mutating func compareHand(with userHand: HandOptions) {
        let rivalHand: HandOptions
        
        do {
            rivalHand = try makeRival()
        } catch {
            print("가위바위보가 성립하지 않습니다.")
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
            startMukjjipa()
        } else {
            print("졌습니다!")
            winner = "컴퓨터"
            startMukjjipa()
        }
    }
    
    func startMukjjipa() {
        print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
}
