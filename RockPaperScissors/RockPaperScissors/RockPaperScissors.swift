//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박종화 on 2023/05/03.
//

struct RockPaperScissors {
    var isGameStart: Bool = true
    var userNumber: Int = 0
    var turnDictionary: [Bool: String] = [true: "사용자", false: "컴퓨터"]
    var whoseTurn: String?

    
    mutating func start() {
        startFirstGame()
    }
    
    mutating func startFirstGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
        let userCards: UserCards = input()

        switch userCards {
        case .rock, .scissors, .paper:
            compareFirstCard(userNumber, createRandomNumber())
        case .exit:
            print("게임 종료")
        }
        
    }

    mutating func compareFirstCard (_ user: Int, _ computer: Int) {
        
        let difference = user - computer
 
        switch difference {
        case 0:
            print("비겼습니다!")
             startFirstGame()
        case 1, -2:
            print("이겼습니다!")
            self.whoseTurn = turnDictionary[true]
            isGameStart = false
            startSecondGame()
        case -1, 2:
            print("졌습니다!")
            self.whoseTurn = turnDictionary[false]
            isGameStart = false
            startSecondGame()
        default:
            print("오류1")
        }
    }
    
    mutating func startSecondGame() {
        print("[\(self.whoseTurn ?? "오류2") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
        let userCards: UserCards = input()
        
        switch userCards {
        case .rock, .scissors, .paper:
            compareSecondCard(userNumber, createRandomNumber())
        case .exit:
            print("게임 종료")
        }
    }

    
    mutating func compareSecondCard (_ user: Int, _ computer: Int) {
        let difference = user - computer
        
        switch difference {
        case 0:
            print("\(self.whoseTurn ?? "오류3")의 승리!")
        case -1, 2:
            print("컴퓨터: \(computer)")
            if whoseTurn != self.turnDictionary[true] {
                changeTurn()
            }
            printTurn()
            startSecondGame()
        case 1, -2:
            print("컴퓨터: \(computer)")
            if whoseTurn != self.turnDictionary[false] {
                changeTurn()
            }
            printTurn()
            startSecondGame()
        default:
            print("오류4")
        }
    }
    
    mutating func input() -> UserCards {
        guard let inputNumber = readLine(),
              let user = Int(inputNumber),
              let userCards: UserCards = UserCards(rawValue: user) else {
            if isGameStart == true {
                print("잘못된 입력입니다. 다시 시도해주세요")
                startFirstGame()
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요")
                changeTurn()
                startSecondGame()
            }
            fatalError("dd")
        }
        self.userNumber = user
        return userCards
    }
    
    func createRandomNumber() -> Int {
        let randomNumber = Int.random(in: 1...3)
        print(randomNumber)
        return randomNumber
    }
    
    mutating func changeTurn() {
        if self.whoseTurn == self.turnDictionary[true]  {
            self.whoseTurn = self.turnDictionary[false]
        } else {
            self.whoseTurn = self.turnDictionary[true]
        }
    }
    
    mutating func printTurn() {
        print("\(self.whoseTurn ?? "오류5")의 턴입니다.")
    }
}
