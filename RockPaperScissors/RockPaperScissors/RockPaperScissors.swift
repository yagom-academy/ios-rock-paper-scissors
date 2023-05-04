//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박종화 on 2023/05/03.
//

struct RockPaperScissors {
    var isFirstGameStart: Bool
    var userNumber: Int
    var turnDictionary: [Bool: String]
    var whoseTurn: String?

    init(isFirstGameStart: Bool, userNumber: Int, turnDictionary: [Bool : String], whoesTurn: String) {
        self.isFirstGameStart = isFirstGameStart
        self.userNumber = userNumber
        self.turnDictionary = turnDictionary
        self.whoseTurn = whoesTurn
    }
    
    mutating func startFirst() throws {
        while isFirstGameStart {
            do {
                try startSecondGame()
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
        case .exit:
            print("게임 종료")
            self.isFirstGameStart = false
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
            self.whoseTurn = turnDictionary[true]
            try startSecondGame()
        case -1, 2:
            print("졌습니다!")
            self.whoseTurn = turnDictionary[false]
            try startSecondGame()
        default:
            print("오류1")
        }
    }
    
    mutating func compareSecondCard (_ user: Int, _ computer: Int) {
        let difference = user - computer
        
        switch difference {
        case 0:
            print("\(self.whoseTurn ?? "error")의 승리!")
            isFirstGameStart = false
        case -1, 2:
            print("컴퓨터: \(computer)")
            if whoseTurn != self.turnDictionary[true] {
                changeTurn()
            }
            printTurn()
        case 1, -2:
            print("컴퓨터: \(computer)")
            if whoseTurn != self.turnDictionary[false] {
                changeTurn()
            }
            printTurn()
        default:
            print("오류")
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

    mutating func startSecondGame() throws {
        while isFirstGameStart {
            print("[\(self.whoseTurn ?? "에러4") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
            let userCards: UserCards = try input()
        
            switch userCards {
            case .rock, .scissors, .paper:
                compareSecondCard(userNumber, createRandomNumber())
            case .exit:
                print("게임 종료")
                self.isFirstGameStart = false
            }
        }
    }
    
    mutating func changeTurn() {
        if self.whoseTurn == self.turnDictionary[true]  {
            self.whoseTurn = self.turnDictionary[false]
        } else {
            self.whoseTurn = self.turnDictionary[true]
        }
    }
    
    mutating func printTurn() {
        print("\(self.whoseTurn ?? "에러3")의 턴입니다.")
    }
}
