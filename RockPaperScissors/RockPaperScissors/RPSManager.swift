//
//  RPSManger.swift
//  RockPaperScissors
//
//  Created by Charles, Toy on 2023/09/05.
//

struct RockPaperScissorsManager {
    private var computerCard: RockPaperScissors?
    private var userCard: RockPaperScissors?
    
    private func inputUserNumber() -> Int {
        while true {
            let stringNumber = readLine()
            
            if let stringNumber = stringNumber, let number = Int(stringNumber) {
                return number
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                printMenu()
            }
        }
    }
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    private mutating func compareValues(computerValue: RockPaperScissors?, userValue: RockPaperScissors?) {
        if computerValue == userValue {
            print("비겼습니다!")
            playGame()
        } else if computerValue == .paper && userValue == .rock ||
                    computerValue == .rock && userValue == .scissors ||
                    computerValue == .scissors && userValue == .paper {
            print("졌습니다!")
            return
        } else {
            print("이겼습니다!")
            return
        }
    }
    
    mutating func playGame() {
        printMenu()
        
        let userChoice = inputUserNumber()
        
        userCard = RockPaperScissors(rawValue: userChoice)
        computerCard = RockPaperScissors(rawValue: Int.random(in: 1...3))
        
        if userChoice == 0 {
            print("게임종료")
            return
        } else if userChoice > 0 && userChoice < 4 {
            compareValues(computerValue: computerCard, userValue: userCard)
            return
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            playGame()
        }
    }
}
