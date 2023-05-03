//
//  MukJiPpaManager.swift
//  MukJiPpa
//
//  Created by redmango1446 on 2023/05/03.
//

class MukJiPpaManager {
    enum MukJiPpa: Int {
        case muk = 1
        case ji = 2
        case ppa = 3
    }
    
    var player: String = rpsManager.winner
    
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
            changeTurn()
            startGame()
        } catch {
            print("알 수 없는 에러가 발생했습니다.")
        }
    }
    
    func inputUserNumber() throws -> Int {
        print("[\(player) 턴] 가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = readLine(), let userNumber = Int(input), 0...3 ~= userNumber else {
            throw ConsoleError.inputError
        }
        
        return userNumber
    }
    
    func convertEnum(of number: Int) throws -> MukJiPpa {
        switch number {
        case 1:
            return .muk
        case 2:
            return .ji
        case 3:
            return .ppa
        default:
            throw ConsoleError.inputError
        }
    }
    
    func compare(_ userHand: MukJiPpa, and computerHand: MukJiPpa) {
        if userHand == computerHand {
            print("\(player)의 승리")
        } else if bringTurn(userHand, computerHand) {
            print("\(player)의 턴입니다.")
            startGame()
        } else {
            changeTurn()
            print("\(player)의 턴입니다.")
            startGame()
        }
    }
    
    func bringTurn(_ user: MukJiPpa, _ computer: MukJiPpa) -> Bool {
        return user == .muk && computer == .ji
        || user == .ji && computer == .ppa
        || user == .ppa && computer == .muk
    }
    
    func changeTurn() {
        switch player {
        case "사용자":
            player = "컴퓨터"
        case "컴퓨터":
            player = "사용자"
        default:
            return
        }
    }
}


