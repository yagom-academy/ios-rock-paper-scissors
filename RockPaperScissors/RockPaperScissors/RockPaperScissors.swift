//
//  RockPaperScissors.swift
//  Created by uemu, mireu.
//  Copyright © yagom academy. All rights reserved.
//

struct RockPaperScissors {
    private var nextGame = MukJjiBba()
    
    mutating func compareUserPickAndComputerPick(_ userChoice: RockPaperScissorsChoice, _ computerChoice: RockPaperScissorsChoice) {
        switch (userChoice, computerChoice) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            print("이겼습니다!")
            turn = "사용자"
            nextGame.playMukChiBbaGame()
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            print("비겼습니다!")
            playRockPaperScissors()
        default:
            turn = "컴퓨터"
            print("졌습니다!")
            nextGame.playMukChiBbaGame()
        }
    }
    
    private func selectMenu() -> RockPaperScissorsChoice {
        while true {
            print("가위(1), 바위(2), 보(3)!<종료 : 0> :", terminator: " ")
            
            guard let input = readLine(), let userChoice =  RockPaperScissorsChoice(rawValue: Int(input) ?? -1)  else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            return userChoice
        }
    }
    
    mutating func playRockPaperScissors() {
        let isRunning = true
        
        while isRunning {
            let computerChoice = RockPaperScissorsChoice(rawValue: getRandomNumber()) ?? .rock
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
