//
//  SecondGame.swift
//  RockPaperScissors
//
//  Created by EtialMoon & Serena on 2023/05/03.
//

struct SecondGame {    
    func startMukjjipa() {
        print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        choiceMukjjipaMenu()
    }
    
    private func choiceMukjjipaMenu() {
        guard let input: String = readLine() else {
            print("정상적인 접근이 아닙니다.")
            return
        }
        
        switch input {
        case MukjjipaOptions.muk.rawValue:
            compareHand(with: .muk)
        case MukjjipaOptions.jji.rawValue:
            compareHand(with: .jji)
        case MukjjipaOptions.pa.rawValue:
            compareHand(with: .pa)
        case "0":
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            winner = "컴퓨터"
            startMukjjipa()
        }
    }
    
    private func makeRival() throws -> MukjjipaOptions {
        guard let rivalHand: MukjjipaOptions = MukjjipaOptions.allCases.randomElement() else {
            throw Errors.invalidRival
        }
        
        return rivalHand
    }
    
    private func compareHand(with userHand: MukjjipaOptions) {
        let rivalHand: MukjjipaOptions
        
        do {
            rivalHand = try makeRival()
        } catch {
            print("가위바위보가 성립하지 않습니다.")
            return
        }
        
        if userHand == rivalHand {
            print("\(winner)의 승리!")
        } else if (userHand == .jji && rivalHand == .pa)
                    || (userHand == .muk && rivalHand == .jji)
                    || (userHand == .pa && rivalHand == .muk) {
            winner = "사용자"
            print("\(winner)의 턴입니다.")
            startMukjjipa()
        } else {
            winner = "컴퓨터"
            print("\(winner)의 턴입니다.")
            startMukjjipa()
        }
    }
}
