//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박종화 on 2023/05/03.
//

struct RockPaperScissors {
    var isGameStart: Bool = true
    var isPlayerTurn: Bool = true
    
    mutating func start() throws {
        while isGameStart {
            do {
                try inputfirstMenu()
            } catch UserCardsError.error {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
    
    mutating func inputfirstMenu() throws {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
        guard let inputNumber = readLine(),
              let user = Int(inputNumber),
              let userCards: UserCards = UserCards(rawValue: user) else {
            throw UserCardsError.error
        }

        switch userCards {
        case .rock, .scissors, .paper:
            compareCard(user, createRandomNumber())
            try inputfirstMenu()
        case .exit:
            print("게임 종료")
            self.isGameStart = false
        }
    }

    func createRandomNumber() -> Int {
        let randomNumber = Int.random(in: 1...3)
        print(randomNumber)
        return randomNumber
    }

    mutating func compareCard(_ user: Int, _ computer: Int) {
        let difference = user - computer
 
        switch difference {
        case 0:
            print("비김")
            print("비김추가")
        case 1, -2:
            print("이김")
            self.isPlayerTurn = true
        case -1, 2:
            print("패배")
            self.isPlayerTurn = false
        default:
            print("오류1")
        }
    }

    func decideTurn(_ isPlayerTurn: Bool) {
        
        
    }

    mutating func inputSecondMenu(_ isPlayerTurn: Bool) {
        var whosTurn: String
        
        if isPlayerTurn == true {
            whosTurn = "사용자 턴"
        } else {
            whosTurn = "컴퓨터 턴"
        }
        print("[\(whosTurn)] 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
        guard let card = readLine(),
              let cardNumber = Int(card),
              let userCards: UserCards = UserCards(rawValue: cardNumber) else {
            return
        }
        switch userCards {
        case .rock, .scissors, .paper:
            print("패 비교")
        case .exit:
            print("게임 종료")
        default:
            print("패 넘김")
        }
    }
    
    func compareSecondCard(_ card: Int, _ randomNumber: Int, _ whosTurn: String) {
        if card == randomNumber {
            print("\(whosTurn)의 승리!")
        } else {
            whosTurn
            print("\(whosTurn)의 턴입니다.")
        }
        
    }
}
