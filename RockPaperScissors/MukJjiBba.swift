//
//  MukJjiBba.swift
//  Created by uemu, mireu.
//  Copyright © yagom academy. All rights reserved.
//

struct MukJjiBba {
    func generateRandomNumber() -> MukJjiBbaChoice {
        let randomNumber = Int.random(in: 1...3)
        
        switch randomNumber {
        case 1:
            return .muk
        case 2:
            return .jji
        case 3:
            return .bba
        default:
            return .quit
        }
    }
    
    func compareUserPickAndComputerPick(_ userChoice: MukJjiBbaChoice, _ computerChoice: MukJjiBbaChoice) {
        switch (userChoice, computerChoice) {
        case (.muk,.bba), (.jji,.muk), (.bba,.jji):
            turn = "컴퓨터"
            print("\(turn)의 턴입니다.")
            playMukChiBbaGame()
        case (.muk,.jji), (.jji,.bba), (.bba,.muk):
            turn = "사용자"
            print("\(turn)의 턴입니다.")
            playMukChiBbaGame()
        default:
            print("\(turn)의 승리!")
        }
    }
    
    func selectMenu() -> MukJjiBbaChoice {
        let isRunning = true
        
        while isRunning {
            
            print("[\(turn) 턴]묵(1), 찌(2), 빠(3)!<종료 : 0> :", terminator: " ")
            
            guard let input = readLine(), let userChoice = MukJjiBbaChoice(rawValue: Int(input) ?? -1) else {
                print("잘못된 입력입니다. 컴퓨터의 턴으로 넘깁니다.")
                turn = "컴퓨터"
                continue
            }
            return userChoice
        }
    }
    
    func playMukChiBbaGame() {
        let isRunning = true
        
        while isRunning {
            let computerChoice = generateRandomNumber()
            let userChoice = selectMenu()
            
            if userChoice == .quit {
                print("게임 종료")
                break
            }
            compareUserPickAndComputerPick(userChoice, computerChoice)
            break
        }
    }
}
