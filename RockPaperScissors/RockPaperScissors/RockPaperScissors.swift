//
//  RockPaperScissors.swift
//  Created by uemu, mireu.
//  Copyright © yagom academy. All rights reserved.
//

struct RockPaperScissors {
    private var nextGame = MukJjiBba()
    
    func generateRandomNumber() -> RockPaperScissorsChoice {
        let randomNumber = Int.random(in: 1...3)
        
        switch randomNumber {
        case 1:
            return .rock
        case 2:
            return .paper
        case 3:
            return .scissors
        default:
            return .quit
        }
    }
    
    func compareUserPickAndComputerPick(_ userChoice: RockPaperScissorsChoice, _ computerChoice: RockPaperScissorsChoice) {
        switch (userChoice, computerChoice) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            print("이겼습니다!")
            turn = "사용자"
            nextGame.playMukChiBbaGame()
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            print("비겼습니다!")
            playRockPaperScissors()
        default:
            print("졌습니다!")
            turn = "컴퓨터"
            nextGame.playMukChiBbaGame()
        }
    }
    
    private func selectMenu() -> RockPaperScissorsChoice {
        let isRunning = true
        
        while isRunning {
            
            print("가위(1), 바위(2), 보(3)!<종료 : 0> :", terminator: " ")
            
            guard let input = readLine(), let userChoice =  RockPaperScissorsChoice(rawValue: Int(input) ?? -1)  else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            return userChoice
        }
    }
    
    func playRockPaperScissors() {
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
