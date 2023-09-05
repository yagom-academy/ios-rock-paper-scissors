//
//  RPSManger.swift
//  RockPaperScissors
//
//  Created by 김형철 on 2023/09/05.
//

struct RPSManager {
    private var computerCard: RockPaperScissors?
    private var userCard: RockPaperScissors?
    
    private func inputUserNumber(number: String?) -> Int {
        guard let number = number, let number = Int(number) else { return 4 }
        
        return number
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    mutating func compareValues(_ computerValue: RockPaperScissors?, _ userValue: RockPaperScissors?) {
        if computerValue == userValue {
            print("비겼습니다!")
            playGame()
        } else if computerValue == .paper && userValue == .rock {
            print("졌습니다!")
            return
        } else if computerValue == .rock && userValue == .scissors {
            print("졌습니다!")
            return
        } else if computerValue == .scissors && userValue == .paper {
            print("졌습니다!")
            return
        } else {
            print("이겼습니다!")
            return
        }
    }
    
    mutating func playGame() {
        printMenu()
        
        let userChoice = inputUserNumber(number: readLine())
        
        userCard = RockPaperScissors(rawValue: userChoice)
        computerCard = RockPaperScissors(rawValue: Int.random(in: 1...3))
        
        if userChoice == 0 {
            print("게임종료")
            return
        } else if userChoice > 0 && userChoice < 4 {
            compareValues(computerCard, userCard)
            return
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            playGame()
        }
    }
}
