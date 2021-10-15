enum Hand: CaseIterable {
    case scissors
    case rock
    case paper
    
    func checkHandForPlayerToWin() -> Hand {
        switch self {
        case .scissors:
            return .paper
        case .paper:
            return .rock
        case .rock:
            return .scissors
        }
    }
    
    static func changeNumberToHandForRockPaperScissorsGame(number: Int) -> Hand? {
        switch number {
        case 1:
            return .scissors
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            return nil
        }
    }
    
    static func changeNumberToHandForMukChiBaGame(number: Int) -> Hand? {
        switch number {
        case 1:
            return .rock
        case 2:
            return .scissors
        case 3:
            return .paper
        default:
            return nil
        }
    }
    
    static func createRandomHand() -> Hand? {
        if let randomChoice = Hand.allCases.randomElement() {
            return randomChoice
        }
        return nil
    }
}

enum RockPaperScissorsGameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

/// 에러를 방지하기 위해 특정 값으로 초기화
var playerHand: Hand? = nil
/// 에러를 방지하기 위해 특정 값으로 초기화
var rockPaperScissorsGameResult: RockPaperScissorsGameResult = .lose

var isEndOfGame: Bool = false
var inputString: String = ""

func printRockPaperScissorsGameMenu() {
    let programTerminator = "0"
    print("가위(1), 바위(2), 보(3)! <종료 : \(programTerminator)> : ", terminator: "")
}

func receiveValidPlayerInput() {
    let programTerminator = "0"
    guard let playerInputString: String = readLine(), playerInputString != programTerminator else {
        print("게임 종료")
        isEndOfGame = true
        return
    }
    
    inputString = playerInputString
}

func assignPlayerHandIfValidated(with playerInputString: String) {
    guard let playerInputNumber = Int(playerInputString),
          let handFromInputNumber: Hand = .changeNumberToHandForRockPaperScissorsGame(number: playerInputNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return
    }

    playerHand = handFromInputNumber
}

func createComputerHand() -> Hand? {
    guard let computerHand: Hand = .createRandomHand() else {
        print("오류 - 컴퓨터 패 생성 실패")
        return nil
    }
    print(computerHand)
    return computerHand
}

func startRockPaperScissorsGame() {
    guard let computerHand = createComputerHand() else {
        return
    }
//    guard let computerHand: Hand = .createRandomHand() else {
//        print("오류 - 컴퓨터 패 생성 실패")
//        return
//    }
//    print(computerHand)
    
    comparePlayerHandForRockPaperScissorsGame(with: computerHand)
    printRockPaperScissorsGameResult(of: rockPaperScissorsGameResult)
}

func comparePlayerHandForRockPaperScissorsGame(with computerHand: Hand){
    guard let handForPlayerToWin = playerHand?.checkHandForPlayerToWin() else {
        print("에러 - playerHand에 패가 할당되지 않음")
        return
    }
    
    if playerHand == computerHand {
        rockPaperScissorsGameResult = .draw
    } else if handForPlayerToWin == computerHand {
        rockPaperScissorsGameResult = .win
    } else {
        rockPaperScissorsGameResult = .lose
    }
}

func printRockPaperScissorsGameResult(of gameResult: RockPaperScissorsGameResult) {
    if rockPaperScissorsGameResult == .draw {
        playerHand = nil
    }
    print(gameResult.rawValue)
    return
}

func startProgram() {
    while playerHand == nil {
        printRockPaperScissorsGameMenu()
        
        receiveValidPlayerInput()
        if isEndOfGame == true {
            break
        }
        
        assignPlayerHandIfValidated(with: inputString)
        if playerHand == nil {
            continue
        }
        
        startRockPaperScissorsGame()
    }
    
    // 조건을 붙여서 처리...
    startMukChiBaGame()
}

startProgram()

// STEP2
/// 에러를 방지하기 위해 특정 값으로 초기화

func startMukChiBaGame() {
    printTurnAndMukChiBaGameMenu()
    receiveValidPlayerInput()
    assignPlayerHandIfValidated2(with: inputString)
    guard let computerHand = createComputerHand() else {
        return
    }
    comparePlayerHandForRockPaperScissorsGame(with: computerHand)
    printRockPaperScissorsGameResult2(of: rockPaperScissorsGameResult)
}

var isPlayerTurn: Bool = false

func printTurnAndMukChiBaGameMenu() {
    if rockPaperScissorsGameResult == .win {
        isPlayerTurn = true
    }
//    else if rockPaperScissorsGameResult == .lose {
//        isPlayerTurn = false
//    }
    let thisGameTurn: String = isPlayerTurn ? "사용자" : "컴퓨터"
    let programTerminator = "0"
    
    print("[\(thisGameTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : \(programTerminator)> : ", terminator: "")
}

func assignPlayerHandIfValidated2(with playerInputString: String) {
    guard let playerInputNumber = Int(playerInputString),
          let handFromInputNumber: Hand = .changeNumberToHandForMukChiBaGame(number: playerInputNumber) else {
        isPlayerTurn = false
        print("\(isPlayerTurn): 테스트용")
        return
    }

    playerHand = handFromInputNumber
}

func printRockPaperScissorsGameResult2(of gameResult: RockPaperScissorsGameResult) {

    if rockPaperScissorsGameResult == .draw {
        let thisGameTurn: String = isPlayerTurn ? "사용자" : "컴퓨터"
        print("\(thisGameTurn)의 승리!")
    } else if rockPaperScissorsGameResult == .win{
        isPlayerTurn = true
        print("사용자의 턴입니다")
    } else {
        isPlayerTurn = false
        print("컴퓨터의 턴입니다")
    }
}
