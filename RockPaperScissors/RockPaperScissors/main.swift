enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum ResultMessage {
    static let win = "이겼습니다!"
    static let draw = "비겼습니다!"
    static let lose = "졌습니다!"
}

enum InformationMessage {
    static let startGame = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    static let endGame = "게임 종료"
    static let inputError = "잘못된 입력입니다. 다시 시도해주세요."
    static let computerHandDesignError = "컴퓨터의 값을 얻어오지 못했습니다."
    static let startMukChiBaGame = "묵(1), 찌(2), 빠(3)! <종료 : 0>:"
}

enum Winner {
    static let user = "사용자"
    static let computer = "컴퓨터"
}

func startGame() {
    print(InformationMessage.startGame, terminator: "")
    if let choicedMenu = readLine() {
        playGame(number: choicedMenu)
    }
}

func playGame(number: String) {
    guard number != "0" else {
        print(InformationMessage.endGame)
        return
    }
    
    guard let myHandDesign: RPS = obtainUserHandDesign(number: number) else {
        startGame()
        return
    }
    
    guard let computerHandDesign: RPS = obtainComputerHandDesign() else {
        startGame()
        return
    }
    compare(myHandDesign: myHandDesign, computerHandDesign: computerHandDesign)
}

func obtainUserHandDesign(number: String) -> RPS? {
    switch number {
    case "1":
        return RPS.scissors
    case "2":
        return RPS.rock
    case "3":
        return RPS.paper
    default:
        print(InformationMessage.inputError)
        return nil
    }
}

func obtainComputerHandDesign() -> RPS? {
    guard let computerHandDesign: RPS = RPS(rawValue: Int.random(in: 1...3)) else {
        print(InformationMessage.computerHandDesignError)
        return nil
    }
    return computerHandDesign
}

func compare(myHandDesign: RPS, computerHandDesign: RPS) {
    if myHandDesign == computerHandDesign {
        print(ResultMessage.draw)
        startGame()
    } else if myHandDesign == RPS.rock && computerHandDesign == RPS.scissors ||
                myHandDesign == RPS.scissors && computerHandDesign == RPS.paper ||
                myHandDesign == RPS.paper && computerHandDesign == RPS.rock {
        print(ResultMessage.win)
        startMukChiBaGame(winner: Winner.user)
    } else {
        print(ResultMessage.lose)
        startMukChiBaGame(winner: Winner.computer)
    }
}

func startMukChiBaGame(winner: String) {
    print("[\(winner) 턴] \(InformationMessage.startMukChiBaGame)", terminator: "")
    if let choicedMenu = readLine() {
        playMukChiBaGame(number: choicedMenu, winner: winner)
    }
}

func playMukChiBaGame(number: String, winner: String){
    guard number != "0" else {
        print(InformationMessage.endGame)
        return
    }
    
    guard let myHandDesign: RPS = obtainUserHandDesign(number: number) else {
        startMukChiBaGame(winner: Winner.computer)
        return
    }
    
    guard let computerHandDesign: RPS = obtainComputerHandDesign() else {
        startMukChiBaGame(winner: Winner.user)
        return
    }
    compareMukChiBa(myHandDesign: myHandDesign, computerHandDesign: computerHandDesign, previousWinner: winner)
}

func compareMukChiBa(myHandDesign: RPS, computerHandDesign: RPS, previousWinner: String) {
    if myHandDesign == computerHandDesign {
        print("\(previousWinner)의 승리!")
    } else if myHandDesign == RPS.rock && computerHandDesign == RPS.scissors ||
                myHandDesign == RPS.scissors && computerHandDesign == RPS.paper ||
                myHandDesign == RPS.paper && computerHandDesign == RPS.rock {
                    print("\(Winner.user)의 턴입니다")
                    startMukChiBaGame(winner: Winner.user)
                } else {
                    print("\(Winner.computer)의 턴입니다")
                    startMukChiBaGame(winner: Winner.computer)
                }
}
startGame()
