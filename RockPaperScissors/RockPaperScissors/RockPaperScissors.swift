//
//  RockPaperScissors.swift
//  Created by uemu, mireu.
//  Copyright © yagom academy. All rights reserved.
//

struct RockPaperScissors {
    private var nextGame = MukJjiBba()
    private var turn: CurrentTurn = .user
    
    func generateRandomRockPaperScissorsChoice() -> RockPaperScissorsChoice {
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
    
    mutating func compareUserPickAndComputerPick(_ userChoice: RockPaperScissorsChoice, _ computerChoice: RockPaperScissorsChoice) {
        switch (userChoice, computerChoice) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            print("이겼습니다!")
            turn = .user
            nextGame.playMukChiBbaGame()
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            print("비겼습니다!")
            playRockPaperScissors()
        default:
            print("졌습니다!")
            turn = .computer
            nextGame.playMukChiBbaGame()
        }
    }
    
    private func selectMenu() -> RockPaperScissorsChoice {
        let isRunning = true
        
        while isRunning {
            print("가위(1), 바위(2), 보(3)!<종료 : 0> :", terminator: " ")
            
            guard let input = readLine(),
                  let inputIntegerValue = Int(input),
                  let userChoice =  RockPaperScissorsChoice(rawValue: inputIntegerValue)  else {
                print("잘못된 입력입니다. 컴퓨터의 턴으로 넘깁니다.")
                continue
            }
            return userChoice
        }
    }
    
    mutating func playRockPaperScissors() {
        let isRunning = true
        
        while isRunning {
            let computerChoice = generateRandomRockPaperScissorsChoice()
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
