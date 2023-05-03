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
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startMukjjipa()
            return
        }
        
        switch input {
        case MukjjipaOptions.muk.rawValue:
            print("muk")
        case MukjjipaOptions.jji.rawValue:
            print("jji")
        case MukjjipaOptions.pa.rawValue:
            print("pa")
        case "0":
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startMukjjipa()
        }
    }
    
}
