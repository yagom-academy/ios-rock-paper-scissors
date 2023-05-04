//
//  MukJjiPaGame.swift
//  RockPaperScissors
//
//  Created by EtialMoon & Serena on 2023/05/03.
//

struct MukJjiPaGame {    
    func startMukJjiPa() {
        print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        choiceMukJjiPaMenu()
    }
    
    private func choiceMukJjiPaMenu() {
        guard let input: String = readLine() else {
            print(ErrorMessages.invalidAccess.rawValue)
            return
        }
        
        switch input {
        case MukJjiPaOptions.muk.rawValue:
            decideVictory(with: .muk)
        case MukJjiPaOptions.jji.rawValue:
            decideVictory(with: .jji)
        case MukJjiPaOptions.pa.rawValue:
            decideVictory(with: .pa)
        case "0":
            print("게임 종료")
        default:
            print(ErrorMessages.invalidInput.rawValue)
            winner = "컴퓨터"
            startMukJjiPa()
        }
    }
    
    private func makeSecondRival() -> MukJjiPaOptions? {
        guard let rivalHand: MukJjiPaOptions = MukJjiPaOptions.allCases.randomElement() else {
            return nil
        }
        
        return rivalHand
    }
    
    private func decideVictory(with userHand: MukJjiPaOptions) {
        guard let rivalHand: MukJjiPaOptions = makeSecondRival() else {
            return
        }
        
        if userHand == rivalHand {
            print("\(winner)의 승리!")
        } else if (userHand == .jji && rivalHand == .pa)
                    || (userHand == .muk && rivalHand == .jji)
                    || (userHand == .pa && rivalHand == .muk) {
            winner = "사용자"
            print("\(winner)의 턴입니다.")
            startMukJjiPa()
        } else {
            winner = "컴퓨터"
            print("\(winner)의 턴입니다.")
            startMukJjiPa()
        }
    }
}
