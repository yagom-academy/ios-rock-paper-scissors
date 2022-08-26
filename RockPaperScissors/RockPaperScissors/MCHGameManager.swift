struct MCHGameManager {
    
    func startGame(gameResult: GameResult) {
        let isUserTurn: Bool = gameResult == .win ? true : false
        let randomComputerNumber = Int.random(in: 1...3)
        print("[\(isUserTurn ? "사용자" : "컴퓨터") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = fetchUserInput(),
              let userChoice = MukChiBa.init(rawValue: userNumber),
              let computerChoice = MukChiBa.init(rawValue: randomComputerNumber) else {
            printUserInputError()
            return startGame(gameResult: .lose)
        }
        
        let gameResult = checkGameResult(computerChoice: computerChoice, userChoice: userChoice)
        handleGameResult(gameResult: gameResult, isUserTurn: isUserTurn)
    }
    
    private func handleGameResult(gameResult: GameResult, isUserTurn: Bool) {
        switch gameResult {
        case .win:
            print("사용자의 턴입니다.")
            startGame(gameResult: .win)
        case .lose:
            print("컴퓨터의 턴입니다.")
            startGame(gameResult: .lose)
        case .draw:
            print("\(isUserTurn ? "사용자" : "컴퓨터") 의 승리!")
            break
        case .exit:
            print("게임 종료")
            break
        }
    }
    
    private func checkGameResult(computerChoice: MukChiBa, userChoice: MukChiBa) -> GameResult {
        if userChoice == computerChoice { return .draw }
        
        switch userChoice {
        case .muk:
            if computerChoice == .ba { return .lose }
        case .chi:
            if computerChoice == .muk { return .lose }
        case .ba:
            if computerChoice == .chi { return .lose }
        case .none:
            return .exit
        }
        
        return .win
    }
}
