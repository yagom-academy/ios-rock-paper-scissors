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

    func decideTurn(_ user: Int, _ computer: Int) {
        var isWinner: Bool = true
        guard let user == 1 || user == -2 else {
            isWinner = false
            return
        }
    }

    func inputSecondMenu(_ isWinner: Bool) {
        var whosTurn: String
        
        if isWinner == true {
            whosTurn = "사용자 턴"
        } else {
            whosTurn = "컴퓨터 턴"
        }
        print("[\(whosTurn)] 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
        let card = readLine()
    }
}
