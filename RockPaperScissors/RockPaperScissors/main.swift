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
    
    static func changeNumberToHand(number: Int) -> Hand? {
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
    
    static func createRandomHand() -> Hand? {
        if let randomChoice = Hand.allCases.randomElement() {
            return randomChoice
        }
        return nil
    }
}

enum GameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

/// 에러를 방지하기 위해 특정 값으로 초기화
var playerHand: Hand? = nil
/// 에러를 방지하기 위해 특정 값으로 초기화
var gameResult: GameResult = GameResult.lose

var inputString: String = ""

func startProgram() {
    receiveValidPlayerInput()
    if inputString.isEmpty == false {
        assignPlayerHandIfValidated(with: inputString)
    }
    if playerHand != nil {
        startGame()
    }
}

startProgram()

func receiveValidPlayerInput() {
    let programTerminator = "0"
    print("가위(1), 바위(2), 보(3)! <종료 : \(programTerminator)> : ", terminator: "")
    
    guard let playerInputString: String = readLine(), playerInputString != programTerminator else {
        print("게임 종료")
        return
    }
    
    inputString = playerInputString
}

func assignPlayerHandIfValidated(with playerInputString: String) {
    guard let playerInputNumber = Int(playerInputString),
          let handFromInputNumber: Hand = .changeNumberToHand(number: playerInputNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        /// 잘못된 입력 처리 시 전역변수 초기화
        inputString = ""
        startProgram()
        return
    }
    
    playerHand = handFromInputNumber
}

func startGame() {
    guard let computerHand: Hand = .createRandomHand() else {
        print("오류 - 컴퓨터 패 생성 실패")
        return
    }
    print(computerHand)
    
    comparePlayerHand(with: computerHand)
    printGameResult(of: gameResult)
}

func printGameResult(of gameResult: GameResult) {
    if gameResult == .draw {
        print(gameResult.rawValue)
        startProgram()
        return
    }
    
    print(gameResult.rawValue)
}

func comparePlayerHand(with computerHand: Hand){
    guard let handForPlayerToWin = playerHand?.checkHandForPlayerToWin() else {
        print("에러 - playerHand에 패가 할당되지 않음")
        return
    }
    
    if playerHand == computerHand {
        gameResult = .draw
    } else if handForPlayerToWin == computerHand {
        gameResult = .win
    } else {
        gameResult = .lose
    }
    /// 잘못된 입력값을 한 번 이상 처리할 경우, 승패 출력 후 다시 startGame 함수가 실행되지 않도록 전역변수를 초기화
    playerHand = nil
}
