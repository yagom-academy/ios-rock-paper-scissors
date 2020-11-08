//  2020.11.08 Green written

import Foundation

//게임 결과
enum GameResult {
    case win
    case draw
    case lose
    case exit
    case retry
    case error
}

//가위바위보 입력
func startsScissorsRockPaper() {
    print("가위(1), 바위(2), 보(3)!<종료 : 0> : ", terminator: " ")

    guard let input: String = readLine(), let users = Int(input) else {
        printResultScissorsRockPaper(result: .error)
        return
    }
    
    let computer = Int.random(in: 1...3)
    
    compareScissorsRockPaper(users: users, computer: computer)
}

//가위바위보 결과비교
func compareScissorsRockPaper(users: Int, computer: Int) {
    let compareResult: GameResult
    
    if (users == computer) {
        compareResult = .draw
    } else if ((users == 1 && computer == 3) || (users == 2 && computer == 1) || (users == 3 && computer == 2)) {
        compareResult = .win
    } else if ((users == 1 && computer == 2) || (users == 2 && computer == 3) || (users == 3 && computer == 1)) {
        compareResult = .lose
    } else if (users == 0) {
        compareResult = .exit
    } else {
        compareResult = .retry
    }
    printResultScissorsRockPaper(result: compareResult)
}

//가위바위보 결과출력
func printResultScissorsRockPaper(result: GameResult) {
    switch result {
    case .win:
        print("이겼습니다!")
        startRockScissorsPaper(gameResult: .win, turn: "사용자")
    case .lose:
        print("졌습니다!")
        startRockScissorsPaper(gameResult: .win, turn: "컴퓨터")
    case .draw:
        print("비겼습니다!")
        startsScissorsRockPaper()
    case .exit:
        print("게임 종료")
    case .retry:
        print("잘못된 입력입니다. 다시 시도해주세요")
        startsScissorsRockPaper()
    case .error:
        print("입력값이 잘못되어 게임을 종료합니다.")
    }
}

//묵찌빠 입력
func startRockScissorsPaper(gameResult: GameResult, turn: String) {
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> : ",terminator: " ")
        
        guard let input: String = readLine(), let users = Int(input) else {
        printResultScissorsRockPaper(result: .error)
            return
        }
        
        let computer = Int.random(in: 1...3)
        
        compareRockScissorsPaper(users: users, computer: computer, turn: turn)
}

//묵찌빠 결과비교
func compareRockScissorsPaper(users: Int, computer: Int, turn: String) {
    let compareResult: GameResult
    var nextTurn: String = turn
    
    if ((users == 1 && computer == 2) || (users == 2 && computer == 3) || (users == 3 && computer == 1)) {
        compareResult = .draw
        nextTurn = "사용자"
    } else if ((users == 1 && computer == 3) || (users == 2 && computer == 1) || (users == 3 && computer == 2)) {
        compareResult = .lose
        nextTurn = "컴퓨터"
    } else if ((users == 1 && computer == 1) || (users == 2 && computer == 2) || (users == 3 && computer == 3)) {
        compareResult = .draw
    } else if (users == 0) {
        compareResult = .exit
    } else {
        compareResult = .retry
    }
    printResultRockScissorsPaper(game: compareResult, turn: nextTurn)
}

//묵찌빠 결과출력
func printResultRockScissorsPaper(game: GameResult, turn: String) {
    switch game {
    case .win:
        print("\(turn)의 턴입니다")
        startRockScissorsPaper(gameResult: .win, turn: "사용자")
    case .lose:
        print("\(turn)의 턴입니다")
        startRockScissorsPaper(gameResult: .lose, turn: "컴퓨터")
    case .draw:
        print("\(turn)의 승리!")
    case .exit:
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요")
        startRockScissorsPaper(gameResult: .lose, turn: "컴퓨터")
    }
}

//게임 호출
startsScissorsRockPaper()









