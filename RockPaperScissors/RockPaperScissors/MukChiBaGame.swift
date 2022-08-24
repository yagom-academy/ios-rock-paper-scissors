func playGame(gameResult: GameResult) {

    var isTurn: Bool = gameResult == .win ? true : false
//    let turn = decideTurn(gameResult: gameResult)
    print("[\(isTurn ? "사용자" : "컴퓨터")]턴 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    
    guard let userNumber = fetchUserInput(),
          0...3 ~= userNumber else {
        printUserInputError()
        // 잘못된 입력을 한 경우 컴퓨터 턴
        return playGame(gameResult: .lose)
    }
    
    
}

func decideTurn(gameResult: GameResult) -> String {
    if gameResult == .win { return "사용자" }
    
    return "컴퓨터"
}

func changeTurn() {
    
}
