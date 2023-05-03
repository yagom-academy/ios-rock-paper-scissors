//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by redmango1446 on 2023/05/03.
//

class RockPaperScissorsManager {
    enum RockPaperScissors: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    func startGame() {
        let computerNumber = Int.random(in: 1...3)
        
        do {
            let userNumber = try inputUserNumber()
            
            if userNumber == 0 {
                print("게임 종료")
                
                return
            }
            
            let userHand = try convertEnum(of: userNumber)
            let computerHand = try convertEnum(of: computerNumber)
            
            compare(userHand, and: computerHand)
        } catch ConsoleError.inputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            
            startGame()
        } catch {
            print("알 수 없는 에러가 발생했습니다.")
        }
    }
    
    func inputUserNumber() throws -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = readLine(), let userNumber = Int(input), 0...3 ~= userNumber else {
            throw ConsoleError.inputError
        }
        
        return userNumber
    }
    
    func convertEnum(of number: Int) throws -> RockPaperScissors {
        switch number {
        case 1:
            return .scissors
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            throw ConsoleError.inputError
        }
    }
    
    func compare(_ userHand: RockPaperScissors, and computerHand: RockPaperScissors) {
        if userHand == computerHand {
            print("비겼습니다!!")
            startGame()
        } else if isUserWin(userHand, computerHand) {
            print("이겼습니다!!")
        } else {
            print("졌습니다!!")
        }
    }
    
    func isUserWin(_ user: RockPaperScissors, _ computer: RockPaperScissors) -> Bool {
        return user == .scissors && computer == .paper
        || user == .rock && computer == .scissors
        || user == .paper && computer == .rock
    }
}

