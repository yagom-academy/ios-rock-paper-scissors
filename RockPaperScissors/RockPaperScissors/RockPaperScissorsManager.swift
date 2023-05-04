//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by redmango, 비모 on 2023/05/03.
//

struct RockPaperScissorsManager {
    enum RockPaperScissors: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    func startGame() {
        do {
            let userNumber = try inputUserNumber()
            
            if userNumber == 0 {
                print("게임 종료")
                
                return
            }
            
            guard let userHand = RockPaperScissors(rawValue: userNumber) else {
                throw ConsoleError.inputError
            }
            
            guard let computerHand = RockPaperScissors(rawValue: Int.random(in: 1...3)) else {
                throw ConsoleError.inputError
            }
            
            compare(userHand, and: computerHand)
        } catch ConsoleError.inputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            
            startGame()
        } catch {
            print("알 수 없는 에러가 발생했습니다.")
        }
    }
    
    private func inputUserNumber() throws -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = readLine(), let userNumber = Int(input), 0...3 ~= userNumber else {
            throw ConsoleError.inputError
        }
        
        return userNumber
    }
    
    private func compare(_ userHand: RockPaperScissors, and computerHand: RockPaperScissors) {
        var winner: Player = .undecided
        
        if userHand == computerHand {
            print("비겼습니다!!")
            startGame()
            
            return
        } else if isUserWin(userHand, computerHand) {
            print("이겼습니다!!")
            winner = .user
        } else {
            print("졌습니다!!")
            winner = .computer
        }
        
        let mjpManager = MukJiPpaManager(currentPlayer: winner)
        mjpManager.startGame()
    }
    
    private func isUserWin(_ user: RockPaperScissors, _ computer: RockPaperScissors) -> Bool {
        return user == .scissors && computer == .paper
        || user == .rock && computer == .scissors
        || user == .paper && computer == .rock
    }
}

