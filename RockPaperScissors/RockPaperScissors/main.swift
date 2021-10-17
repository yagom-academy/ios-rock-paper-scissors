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

// STEP1

/// 에러를 방지하기 위해 특정 값으로 초기화
var rockPaperScissorsGameResult: RockPaperScissorsGameResult = .lose
var playerHand: Hand? = nil
var isEndOfGame: Bool = false
var inputString: String = ""
var isPlayerTurn: Bool = false

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

func assignPlayerHandIfValidatedForRockPaperScissorsGame(with playerInputString: String) {
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
    
    return computerHand
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

// MARK:- 가위바위보 게임 시작
func startRockPaperScissorsGame() {
    guard let computerHand = createComputerHand() else {
        return
    }
    
    comparePlayerHandForRockPaperScissorsGame(with: computerHand)
    printRockPaperScissorsGameResult(of: rockPaperScissorsGameResult)
}

// STEP2


func printTurnAndMukChiBaGameMenu() {
    if rockPaperScissorsGameResult == .win {
        isPlayerTurn = true
    }
    
    let thisGameTurn: String = isPlayerTurn ? "사용자" : "컴퓨터"
    let programTerminator = "0"
    
    print("[\(thisGameTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : \(programTerminator)> : ", terminator: "")
}

func assignPlayerHandIfValidatedForMukChiBaGame(with playerInputString: String) {
    guard let playerInputNumber = Int(playerInputString),
          let handFromInputNumber: Hand = .changeNumberToHandForMukChiBaGame(number: playerInputNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        playerHand = nil
        isPlayerTurn = false
        rockPaperScissorsGameResult = .lose // 잘못된 입력을 하면 가위바위보 게임에서 컴퓨터가 이긴 셈이 된다
        return
    }
    
    playerHand = handFromInputNumber
}

func changeTurn(with gameResult: RockPaperScissorsGameResult) {
    if rockPaperScissorsGameResult == .win {
        isPlayerTurn = true
        print("사용자의 턴입니다")
    } else {
        isPlayerTurn = false
        print("컴퓨터의 턴입니다")
    }
}

func printMukChiBaGameResult(of gameResult: RockPaperScissorsGameResult) {
    if rockPaperScissorsGameResult == .draw {
        let thisGameTurn: String = isPlayerTurn ? "사용자" : "컴퓨터"
        print("\(thisGameTurn)의 승리!")
    }
}

// MARK:- 묵찌빠 게임 시작
func startMukChiBaGame() {
    while rockPaperScissorsGameResult != .draw {
        printTurnAndMukChiBaGameMenu()
        
        receiveValidPlayerInput()
        if isEndOfGame == true { break }
        
        assignPlayerHandIfValidatedForMukChiBaGame(with: inputString)
        if playerHand == nil { continue }
        
        guard let computerHand = createComputerHand() else { return }
        comparePlayerHandForRockPaperScissorsGame(with: computerHand)
        
        if rockPaperScissorsGameResult != .draw {
            changeTurn(with: rockPaperScissorsGameResult)
            continue
        }
        
        printMukChiBaGameResult(of: rockPaperScissorsGameResult)
    }
}

// MARK:- 프로그램 시작
func startProgram() {
    while playerHand == nil {
        printRockPaperScissorsGameMenu()
        
        receiveValidPlayerInput()
        if isEndOfGame == true { break }
        
        assignPlayerHandIfValidatedForRockPaperScissorsGame(with: inputString)
        if playerHand == nil { continue }
        
        startRockPaperScissorsGame()
    }
    
    if isEndOfGame == false {
        startMukChiBaGame()
    }
}

startProgram()
