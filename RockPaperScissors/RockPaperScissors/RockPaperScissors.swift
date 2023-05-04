//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박종화 on 2023/05/03.
//

struct RockPaperScissors {
    var isGameStart: Bool = true
    var isPlayerTurn: Bool = true
    var userNumber: Int = 0
    
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
            compareCard(userNumber, createRandomNumber())
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
    
    mutating func input() throws -> UserCards {
        guard let inputNumber = readLine(),
              let user = Int(inputNumber),
              let userCards: UserCards = UserCards(rawValue: user) else {
            throw UserCardsError.error
        }
        self.userNumber = user
        return userCards
    }

    mutating func printSecondMenu () throws {
        var whosTurn: String
        
        if isPlayerTurn == true {
            whosTurn = "사용자"
        } else {
            whosTurn = "컴퓨터"
        }
        print("[\(whosTurn)] 턴 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
        let userCards: UserCards = try input()
        
        switch userCards {
        case .rock, .scissors, .paper:
            compareSecondCard(userCards, createRandomNumber(), whosTurn)
            print("패 비교")
        case .exit:
            print("게임 종료")
        default:
            print("패 넘김")
        }
    }
    
    func compareSecondCard(_ card: UserCards, _ randomNumber: Int, _ whosTurn: String) -> String {
        let randomNumber = UserCards(rawValue: randomNumber)
        
        if card == randomNumber {
            print("\(whosTurn)의 승리!")
        } else {
            changeTurn(<#T##isPlayerTurn: Bool##Bool#>)
        }
    }
    
    mutating func changeTurn(_ isPlayerTurn: Bool) {
        if isPlayerTurn == true {
            isPlayerTurn = false
        } else {
            isPlayerTurn = true
        }
        printTurn(<#T##card: UserCards##UserCards#>, <#T##whosTurn: String##String#>)
    }
    
    mutating func printTurn(_ card: UserCards, _ whosTurn: String) {
        switch card {
        case .rock, .scissors, .paper:
            print("\(whosTurn)의 턴입니다.")
            printSecondMenu()
        default:
            printSecondMenu()
        }
    }
}

feat: 턴 변경함수, 턴 출력함수 추가, 두 번째 비교함수 수정
