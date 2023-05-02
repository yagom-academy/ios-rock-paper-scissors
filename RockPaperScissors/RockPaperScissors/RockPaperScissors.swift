//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Hyungmin Lee on 2023/05/02.
//

enum Choice: Int {
    case end = 0
    case rock = 1
    case paper = 2
    case scissors = 3
}

struct RockPaperScissors {
    private func getUserChoice() -> Choice? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        
        guard let input = readLine(), let choiceNumber = Int(input) else { return nil }
        
        return Choice(rawValue: choiceNumber)
    }
    
    private func checkWinner(_ userChoice: Choice) {
        guard let computerChoice = Choice(rawValue: Int.random(in: 1...3)) else { return }
        
        let result = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        
        switch result {
            case 0:
                print("비겼습니다!")
            case 1:
                print("이겼습니다!")
            case 2:
                print("졌습니다!")
            default:
                print("잘못된 결과입니다.")
        }
    }
    
    func start() {
        while true {
            guard let userChoice = getUserChoice() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            if userChoice == .end {
                print("게임 종료")
                break
            }
            
            checkWinner(userChoice)
        }
    }
}
