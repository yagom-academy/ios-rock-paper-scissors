//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박종화 on 2023/05/03.
//

struct RockPaperScissors {
    var isGameStart: Bool = true
    var userNumber: Int = 0
    var whosTurn = [Bool: String] = [true: "사용자", false: "컴퓨터"]
    var isPlayerTurn = whosTurn[true] // "사용자"

    mutating func start() throws {
        while isGameStart {
            do {
                try printfirstMenu()
            } catch UserCardsError.error {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
    
    mutating func printfirstMenu() throws {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
        let userCards: UserCards = try input()

        switch userCards {
        case .rock, .scissors, .paper:
            compareFirstCard(userNumber, createRandomNumber())
            try printfirstMenu()
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

    mutating func compareFirstCard(_ user: Int, _ computer: Int) {
        let difference = user - computer
 
        switch difference {
        case 0:
            print("비김")
            print("비김추가")
        case 1, -2:
            print("이김")
            self.isPlayerTurn = whosTurn[true]
        case -1, 2:
            print("패배")
            self.isPlayerTurn = whosTurn[false]
        default:
            print("오류1")
        }
    }
    
    mutating func input() throws -> UserCards {
        guard let inputNumber = readLine(),
              let user = Int(inputNumber),
              let userCards: UserCards = UserCards(rawValue: user) else {
            changeTurn()
            throw UserCardsError.error
        }
        self.userNumber = user
        return userCards
    }

    mutating func printSecondMenu () throws {
        
        print("[\(isPlayerTurn)] 턴 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
        let userCards: UserCards = try input()
        
        switch userCards {
        case .rock, .scissors, .paper:
            print("패 비교")
            compareSecondCard(userCards, createRandomNumber())
            printTurn()
            try printSecondMenu()
        case .exit:
            print("게임 종료")
            self.isGameStart = false
        }
    }
    
    mutating func compareSecondCard(_ card: UserCards, _ randomNumber: Int) {
        let randomNumber = UserCards(rawValue: randomNumber)
        
        if card == randomNumber {
            print("\(isPlayerTurn)의 승리!")
            self.isGameStart = false
        } else {
            changeTurn()
        }
    }
    
    mutating func changeTurn() {
        if isPlayerTurn == whosTurn[true] {
            isPlayerTurn = whosTurn[false]
        } else {
            isPlayerTurn = whosTurn[true]
        }
    }
    
    mutating func printTurn() {
        print("\(isPlayerTurn)의 턴입니다.")
    }
}

