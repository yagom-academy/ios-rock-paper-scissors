//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
struct errorCode {
    static let wrongInput = -1
}

enum Gesture: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum MukchippaGesture: Int {
    case muk = 1
    case chi = 2
    case ppa = 3
}
enum Player: String {
    case computer = "컴퓨터"
    case user = "유저"
}
func computerPlay() -> Int {
    let computerSelect = Int.random(in: 1...3)
    return computerSelect
}

func userInput() -> Int {
    let inputList: Array<Int> = [0, 1, 2, 3]
    
    guard let input = readLine(), !input.isEmpty else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return errorCode.wrongInput
    }
    guard let inputInt = Int(input), inputList.contains(inputInt) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return errorCode.wrongInput
    }
    
    return inputInt
}

func rockScissorsPaper() {
    var repeatFlag: Bool = false
    
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let computerNumber = computerPlay()
        let userInput = userInput()

        guard executeGame(userInput: userInput) else {
            repeatFlag = false
            return
        }
        
        if userInput == errorCode.wrongInput {
            print("공백 들어오는지 체크")
            repeatFlag = true
            continue
        }
        
        guard let gesture = Gesture(rawValue: computerNumber) else {
            return
        }
        switch gesture {
        case .scissors:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.scissors, .paper])
        case .rock:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.paper, .scissors])
        case .paper:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.scissors, .rock])
        }
    } while repeatFlag
}

func executeGame(userInput: Int) -> Bool {
    if userInput == 0 {
        print("게임 종료")
        return false
    }
    return true
}

func gameResult(userInput: Int, gameCase: [Gesture]) -> Bool {
    
    var turnHolder = Player.user
    let userGesture = Gesture(rawValue: userInput)
    let userWin = gameCase[0] == userGesture
    let userLose = gameCase[1] == userGesture
    
    if userWin {
        print("이겼습니다!")
        playMukchippa(turnHolder: turnHolder)
        return false
    } else if userLose {
        print("졌습니다!")
        turnHolder = Player.computer
        playMukchippa(turnHolder: turnHolder)
        return false
    } else {
        print("비겼습니다!")
        return true
    }
}

rockScissorsPaper()

func playMukchippa(turnHolder: Player) {
    var turn = turnHolder
    let computerNumber = computerPlay()
    
    print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0>:")
    let userInput = userInput()
    let gesture = [0, 1, 2, 3]
    
    guard gesture.contains(userInput) else {
        turn = Player.computer
        print("잘못된 입력으로 컴퓨터에게 턴을 넘깁니다.")
        playMukchippa(turnHolder: turn)
        return
    }
    
    judgeMukchippa(user: userInput, computer: computerNumber, turn: turn)
    
}

func judgeMukchippa(user: Int, computer: Int, turn: Player) {
    var whoseTurn = turn
    let muk = MukchippaGesture.muk.rawValue
    let chi = MukchippaGesture.chi.rawValue
    let ppa = MukchippaGesture.ppa.rawValue
    
    if (user == chi && computer == ppa) || (user == muk && computer == chi) || (user == ppa && computer == muk) {
        whoseTurn = Player.user
        checkTurn(turn: whoseTurn, user: user, computer: computer)
    }

    if (user == chi && computer == muk) || (user == muk && computer == ppa) || (user == ppa && computer == chi) {
        whoseTurn = Player.computer
        checkTurn(turn: whoseTurn, user: user, computer: computer)
    }
    
    if (user == chi && computer == chi) || (user == muk && computer == muk) || (user == ppa && computer == ppa) {
        checkTurn(turn: whoseTurn, user: user, computer: computer)
    }
}

func checkTurn(turn: Player, user: Int, computer: Int) {
    if user == computer {
        print("\(turn.rawValue)의 승리!")
    } else {
        print("\(turn.rawValue)의 턴입니다.")
        playMukchippa(turnHolder: turn)
    }
}

