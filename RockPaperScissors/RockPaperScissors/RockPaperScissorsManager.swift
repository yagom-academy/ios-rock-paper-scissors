//
//  RPSManger.swift
//  RockPaperScissors
//
//  Created by Charles, Toy on 2023/09/05.
//

struct RockPaperScissorsManager {
    private var computerCard: RockPaperScissors?
    private var userCard: RockPaperScissors?
    private(set) var isWinOrLose: Bool = true
    
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
            startGame()
        } else if computerValue == .paper && userValue == .rock ||
                    computerValue == .rock && userValue == .scissors ||
                    computerValue == .scissors && userValue == .paper {
            print("졌습니다!")
            isWinOrLose = false
            return
        } else {
            print("이겼습니다!")
            isWinOrLose = true
            return
        }
    }
    
    private mutating func playingGame(with userNumber: Int) {
        switch userNumber {
        case 0:
            print("게임종료")
            return
        case 1...3:
            compareValues(computerValue: userCard, userValue: computerCard)
            return
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
        }
    }
    
    mutating func startGame() {
        printMenu()
        
        let userChoice = inputUserNumber()
        
        userCard = RockPaperScissors(rawValue: userChoice)
        computerCard = RockPaperScissors(rawValue: Int.random(in: 1...3))
        
        playingGame(with: userChoice)
    }
}
