//
//   MukchippaManager.swift
//  RockPaperScissors
//
//  Created by Charles, Toy on 2023/09/07.
//

struct MukchippaManager {
    var isUserTurn: Bool = true
    private var computerCard: Mukchippa?
    private var userCard: Mukchippa?
    
    private func printMenu() {
        print("[\(checkUserTurn(to: isUserTurn))턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
    
    private mutating func inputUserNumber() -> Int {
        while true {
            let stringNumber = readLine()
            
            if let stringNumber = stringNumber, let number = Int(stringNumber) {
                return number
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                isUserTurn = false
                printMenu()
            }
        }
    }
    
    private func checkUserTurn(to isUserTurn: Bool) -> String {
        if isUserTurn {
            return "사용자"
        } else {
            return "컴퓨터"
        }
    }
    
    private mutating func compareValues() {
        if computerCard == userCard {
            isUserTurn ? print("사용자의 승리!") : print("컴퓨터의 승리!")
            return
        } else if computerCard == .ppa && userCard == .muk ||
                  computerCard == .muk && userCard == .chi ||
                  computerCard == .chi && userCard == .ppa {
            print("컴퓨터의 턴입니다.")
            isUserTurn = false
            startMukchippa()
        } else {
            print("사용자의 턴입니다.")
            isUserTurn = true
            startMukchippa()
        }
    }
    
    private mutating func playMukchippa(with userNumber: Int) {
        switch userNumber {
        case 0:
            print("게임종료")
            return
        case 1...3:
            compareValues()
            return
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            isUserTurn = false
            startMukchippa()
        }
    }
    
    mutating func startMukchippa() {
        printMenu()
        
        let user = inputUserNumber()
        
        userCard = Mukchippa(rawValue: user)
        computerCard = Mukchippa(rawValue: Int.random(in: 1...3))

        playMukchippa(with: user)
    }
}
