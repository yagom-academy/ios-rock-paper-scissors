//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박종화 on 2023/05/03.
//

struct RockPaperScissors {
    var isGameStart: Bool
    var userNumber: Int
    var turnDictionary: [Bool: String]
    var whoesTurn: String?

    init(isGameStart: Bool, userNumber: Int, turnDictionary: [Bool : String], whoesTurn: String) {
        self.isGameStart = isGameStart
        self.userNumber = userNumber
        self.turnDictionary = turnDictionary
        self.whoesTurn = whoesTurn
    }
    
    mutating func start() throws {
        while isGameStart {
            do {
                try startFirstGame()
            } catch UserCardsError.error {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
    
    mutating func startFirstGame() throws {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
        let userCards: UserCards = try input()

        switch userCards {
        case .rock, .scissors, .paper:
            try compareFirstCard(userNumber, createRandomNumber())
            try startFirstGame()
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

    mutating func compareFirstCard (_ user: Int, _ computer: Int) throws {
        let difference = user - computer
 
        switch difference {
        case 0:
            print("비겼습니다!")
        case 1, -2:
            print("이겼습니다!")
            self.whoesTurn = turnDictionary[true]
            try printSecondMenu()
        case -1, 2:
            print("졌습니다!")
            self.whoesTurn = turnDictionary[false]
            try printSecondMenu()
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

    mutating func printSecondMenu() throws {
        
        print("[\(self.whoesTurn ?? "에러4") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
        let userCards: UserCards = try input()
        
        switch userCards {
        case .rock, .scissors, .paper:
            compareSecondCard(userCards, createRandomNumber())
            try printSecondMenu()
        case .exit:
            print("게임 종료")
            self.isGameStart = false
        }
    }
    
    mutating func compareSecondCard(_ card: UserCards, _ randomNumber: Int) {
        let randomNumber = UserCards(rawValue: randomNumber)
        
        if card == randomNumber {
            print("\(self.whoesTurn ?? "에러2")의 승리!")
            self.isGameStart = false
        } else {
            changeTurn()
        }
    }
    
    mutating func changeTurn() {
        if self.whoesTurn == self.turnDictionary[true] {
            self.whoesTurn = self.turnDictionary[false]
        } else {
            self.whoesTurn = self.turnDictionary[true]
        }
        printTurn()
    }
    
    mutating func printTurn() {
        print("\(self.whoesTurn ?? "에러3")의 턴입니다.")
    }
}
